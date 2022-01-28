-- Vapour object to use for namespacing
Vapour = {
  options = {tabwidth = 2},
  language_servers = {
    sumneko_lua = {
      config = function(opts)
        opts = vim.tbl_deep_extend("force", {
          settings = {
            Lua = {
              runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
              diagnostics = {globals = {'vim'}},
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
                preloadFileSize = 10000
              },
              telemetry = {enable = false}
            }
          }

        }, opts)
        return opts
      end
    },
    jsonls = {
      config = function(opts)
        opts = vim.tbl_deep_extend("force", {
          settings = {json = {schemas = Vapour.utils.plugins.require('schemastore').json.schemas()}}
        }, opts)
        return opts
      end
    }
  },
  plugins = {
    zen_mode = {enabled = true, enable_rainbow_colors = false},
    twilight = {enabled = true, enable_rainbow_colors = false},
    indent_blankline = {enabled = true, enable_rainbow_colors = false},
    colorizer = {enabled = true},
    autopairs = {enabled = true},
    gitsigns = {enabled = true},
    bufferline = {enabled = true},
    staline = {enabled = true, theme = 'normal'},
    stabline = {enabled = true},
    dashboard = {enabled = true},
    toggleterm = {
      enabled = true,
      toggle_float = function()
        local Terminal = Vapour.utils.plugins.require('toggleterm.terminal').Terminal
        local float = Terminal:new({direction = "float"})
        return float:toggle()
      end,
      toggle_lazygit = function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({cmd = "lazygit", direction = "float"})
        return lazygit:toggle()
      end,
      toggle_ranger = function()
        local Terminal = require('toggleterm.terminal').Terminal
        local ranger = Terminal:new({cmd = "ranger", direction = "float"})
        return ranger:toggle()
      end,
      which_key = {
        root = "t",
        name = "Terminal",
        definitions = {
          t = {":ToggleTerm<cr>", "Split Below"},
          f = {"<cmd>lua Vapour.plugins.toggleterm.toggle_float()<cr>", "Floating Terminal"},
          l = {"<cmd>lua Vapour.plugins.toggleterm.toggle_lazygit()<cr>", "LazyGit"},
          r = {"<cmd>lua Vapour.plugins.toggleterm.toggle_ranger()<cr>", "LazyGit"}
        }
      }
    },
    treesitter = {
      enabled = true,
      ensure_installed = "all",
      ignore_install = {},
      indent = {enable = false},
      highlight = {enable = true},
      autotag = {enable = true},
      rainbow = {enable = true, extended_mode = false, disable = {"html"}}
    },
    vsnip = {enabled = true},
    telescope = {enabled = true},
    nvim_tree = {enabled = true, view_width = 25},
    dial = {enabled = true},
    null_ls = {enabled = true},
    nvim_comment = {enabled = true},
    presence = {enabled = true},
    lsp = {
      enabled = true,
      cmp_sources = {
        {name = 'nvim_lsp'}, {name = 'vsnip'}, {name = 'buffer'}, {name = 'omni'},
        {name = "dictionary", keyword_length = 2}, {name = 'path'}
      }
    },
    which_key = {user_defined = {}},

    -- Packer-specific needs
    packer = {
      enabled = true,
      -- See vapour/user-config/README.md for an example use of this
      init = {
        display = {
          open_fn = function()
            return Vapour.utils.plugins.require('packer.util').float {border = "single"}
          end
        }
      }
    },

    -- User-loaded plugins
    user = {}
  },

  -- To update see vapour.utils
  utils = {},

  settings = {
    -- If true, :w -> :w!
    always_force_write = false,
    colorscheme = 'rose-pine',
    lualine_colorscheme = 'rose-pine',
    transparent_bg = false
  }
}

require('vapour.utils')

local user_config = vim.fn.stdpath "config" .. '/lua/vapour/user-config/init.lua'

if not Vapour.utils.file.exists(user_config) then Vapour.utils.file.create(user_config) end

-- User config that overrides the above
vim.cmd('luafile ' .. user_config)

-- General
require('vapour.options')
require('vapour.plugins')
require('vapour.keybindings')

-- Syntax and Visual
-- If a custom theme is wanted, require() that in user-config.init
-- Otherwise if the default theme is not wanted change Vapour.settings.colorscheme
-- This will return nil if it's not found
if Vapour.settings.colorscheme ~= "custom" then
  Vapour.utils.plugins.require('colorscheme.' .. Vapour.settings.colorscheme)
end

-- LSP and Autocomplete
require('language-servers')

-- Whichkey
require('which-key-config')
if Vapour.settings.transparent_bg then vim.cmd('hi Normal guibg=NONE ctermbg=NONE') end
