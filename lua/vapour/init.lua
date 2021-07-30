require('vapour.globals')

Vapour = {}

-- Vapour object to use for namespacing
Vapour = {
    options = {tabwidth = 2},
    language_servers = {
      sumneko = {enabled = false}, 
      bash = {enabled = false}, 
      css = {enabled = false}, 
      html = {enabled = false, vapour_init = function()
          local lspconfig = Vapour.utils.plugins.require('lspconfig')

          Vapour.language_servers.html.setup.capabilities = vim.lsp.protocol.make_client_capabilities()
          Vapour.language_servers.html.setup.capabilities.textDocument.completion.completionItem.snippetSupport = true
        end,
        setup = {}},
      tsserver = {enabled = false}, 
      pyright = {enabled = false}, 
      jedi_language_server = {enabled = false}, 
      vimls = {enabled = false}, 
      yamlls = {enabled = false}, 
      solargraph = {enabled = false}, 
      vuels = {enabled = false}, 
      phpactor = {enabled = false, vapour_init = function() require'language-servers.phpactor' end}, 
      jsonls = {enabled = false, setup = {commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
          }
        }
      }}, 
      gopls = {enabled = false, setup = {cmd = {"gopls", "serve"}, settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}}}},
    },
    plugins = {
        colorizer = {enabled = false},
        colorbuddy = {enabled = false},
        bufferline = {enabled = false},
        galaxyline = {enabled = false},
        dashboard = {enabled = false},
        toggleterm = {
            enabled = false,
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
                    -- l = {"<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<cr>", "LazyGit"}
                }
            }
        },
        treesitter = {enabled = false},
        rainbow_parentheses = {enabled = false},
        closetag = {enabled = false},
        vsnip = {enabled = false},
        markdown_preview = {eanbled = false},
        telescope = {enabled = false},
        nvim_tree = {enabled = false},
        dial = {enabled = false},
        format = {enabled = false},
        nvim_comment = {enabled = false},
        compe = {enabled = false, sources = {}},
        which_key = {
            user_defined = {},
        },

        -- Packer-specific needs
        packer = {
            enabled = true,
            -- See vapour/user-config/README.md for an example use of this
            init = {}
        },

        -- User-loaded plugins
        user = {}
    },

    -- To update see vapour.utils
    utils = {},

    settings = {
        -- If true, :w -> :w!
        always_force_write = false,
        colorscheme = 'onedark'
    }
}

require('vapour.utils')
