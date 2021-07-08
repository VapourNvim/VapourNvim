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
    require_if_installed = function(pkg)
      local ok, package = pcall(require, pkg)

      if ok then return package else return nil end
    end,
  },
}

