-- Utility functions to help with various uses
Vapour.utils = {
  file = {
    exists = function (file)
      local fp = io.open(file, "r")
      if fp ~= nil then io.close(fp) return true else return false end
    end,
  },
  plugins = {
    -- Allows us to require packages in vapour-user-config
    -- without throwing exceptions if the package don't exist
    -- Optionally you can run this like some/package to add it
    -- to the Vapour.packages.user table for installation.
    require_if_installed = function(pkg, conf)
      local user, repo = string.match(pkg, "(.*)/(.*)")
      local pkg_config = conf or {}

      if not repo then repo = pkg end

      local ok, package = pcall(require, repo)

      if ok then return package else table.insert(Vapour.plugins.user, {pkg, conf}) return nil end
    end,
  },
}

