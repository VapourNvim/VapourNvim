require('vapour.globals')

Vapour = {}

-- Vapour object to use for namespacing
Vapour = {
  options = {tabwidth = 2},
  language_servers = {
    sumneko_lua = {enabled = true},
    bashls = {enabled = true},
    cssls = {enabled = true},
    html = {enabled = true},
    tsserver = {enabled = true},
    pyright = {enabled = true},
    jedi_language_server = {enabled = true},
    pylsp = {enabled = true},
    vimls = {enabled = true},
    yamlls = {enabled = true},
    solargraph = {enabled = true},
    vuels = {enabled = true},
    phpactor = {
      enabled = true,
      vapour_init = function()
        require 'language-servers.phpactor'
      end
    },
    jsonls = {
      enabled = true,
      setup = {
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
          }
        }
      }
    },
    gopls = {enabled = true, setup = {cmd = {"gopls", "serve"}, settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}}}}
  },
  plugins = {
    indent_blankline = {enabled = true, enable_rainbow_colors = false},
    colorizer = {enabled = true},
    autopairs = {enabled = true},
    gitsigns = {enabled = true},
    bufferline = {enabled = true},
    lualine = {enabled = true},
    dashboard = {enabled = true},
    toggleterm = {
      enabled = true,
      toggle_float = function()
        local Terminal = require('toggleterm.terminal').Terminal
        local float = Terminal:new({direction = "float"})
        return float:toggle()
      end,
      toggle_lazygit = function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({cmd = "lazygit", direction = "float"})
        return lazygit:toggle()
      end,
      which_key = {
        root = "T",
        name = "Terminal",
        definitions = {
          t = {":ToggleTerm<cr>", "Split Below"},
          f = {"<cmd>lua Vapour.plugins.toggleterm.toggle_float()<cr>", "Floating Terminal"},
          l = {"<cmd>lua Vapour.plugins.toggleterm.toggle_lazygit()<cr>", "LazyGit"}
        }
      }
    },
    treesitter = {
      enabled = true,
      ensure_installed = "all",
      ignore_install = {"haskell"},
      indent = {enable = false},
      highlight = {enable = true},
      autotag = {enable = true},
      rainbow = {enable = true, extended_mode = false, disable = {"html"}}
    },
    vsnip = {enabled = true},
    telescope = {enabled = true},
    nvim_tree = {enabled = true},
    dial = {enabled = true},
    format = {enabled = true},
    nvim_comment = {enabled = true},
    cmp = {
      enabled = true,
      sources = {{name = 'nvim_lsp'}, {name = 'vsnip'}, {name = 'buffer'}, {name = 'omni'}, {name = "dictionary", keyword_length = 2}}
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

local user_config = CONFIG_PATH .. '/lua/vapour/user-config/init.lua'

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
if Vapour.settings.colorscheme ~= "custom" then Vapour.utils.plugins.require('colorscheme.' .. Vapour.settings.colorscheme) end

-- LSP and Autocomplete
require('language-servers')

-- Whichkey
require('which-key-config')
if Vapour.settings.transparent_bg then vim.cmd('hi Normal guibg=NONE ctermbg=NONE') end
