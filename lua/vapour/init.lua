require('vapour.globals')

-- Vapour object to use for namespacing
Vapour = {
  plugins = {
    -- Packer-specific needs
    packer = {
      -- See vapour/user-config/README.md for an example use of this
      init = {
      },
    },

    -- User-loaded plugins
    user = {},
  },

  -- To update see vapour.utils
  utils = {},
}

require('vapour.utils')
