-- Utility functions to help with various uses
local require_plugin = function(p)
  if Vapour.plugins[p] ~= nil and not Vapour.plugins[p].enabled then return nil end

  local ok, plugin = pcall(require, p)

  if ok then
    return plugin
  else
    print('Unable to load ' .. p)
    return nil
  end
end

local packadd_plugin = function(p, return_plugin)
  vim.cmd('packadd! ' .. p)

  if return_plugin == true then return require_plugin(p) end
end

local plugin_exists = function(p)
  local plugin = require_plugin(p)

  return plugin == nil
end

local add_which_key = function(starter_key, definitions)
  Vapour.plugins.which_key.user_defined[starter_key] = definitions or {}
end

Vapour.utils = {
  tables = {
    -- table_in = table of what to be copied from
    -- table_out = table store what is in table_in
    copy = function(t1, t2)
      for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
          Vapour.utils.tables.copy(t1[k], t2[k])
        else
          t1[k] = v
        end
      end
      return t1
    end
  },
  file = {
    exists = function(file)
      local fp = io.open(file, "r")
      if fp ~= nil then
        io.close(fp)
        return true
      else
        return false
      end
    end,
    create = function(user_config)
      local fp, err = io.open(user_config, 'w+')
      assert(fp, err)
      fp:write('')
      fp:close()
    end
  },
  plugins = {
    require = require_plugin,
    packadd = packadd_plugin,
    exists = plugin_exists,
    which_key = add_which_key,
    -- Helper function to add to the user plugins if need be
    add_user = function(p)
      table.insert(Vapour.plugins.user, p)
    end,
    -- Allows us to require packages in vapour-user-config
    -- without throwing exceptions if the package don't exist
    -- Optionally you can run this like some/package to add it
    -- to the Vapour.packages.user table for installation.
    --
    -- mod_name - Name to pass into require()
    -- pkg - The name to pass into Packer (i.e.: <username>/<repo>)
    -- conf - Any configurations to pass into Packer
    require_if_installed = function(mod_name, pkg, conf)
      assert(mod_name, 'Module name is needed for require()')

      local packer_ref = pkg or '' -- In case we are only passed in mod_name
      local _, repo = string.match(packer_ref, "(.*)/(.*)")
      local pkg_is_git = true

      if not repo then pkg_is_git = false end

      local plugin = plugin_exists(mod_name)

      if plugin ~= nil then
        return plugin
      elseif pkg_is_git then
        table.insert(Vapour.plugins.user, {packer_ref, conf})
        return nil
      end
    end
  }
}

