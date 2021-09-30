require('vapour.globals')

Vapour = {}

-- Vapour object to use for namespacing
Vapour = {
    options = {tabwidth = 2},
    language_servers = {
        sumneko_lua = {enabled = false},
        bashls = {enabled = false},
        cssls = {
            enabled = false,
            vapour_init = function()
                Vapour.utils.plugins.require('lspconfig')

                Vapour.language_servers.cssls.setup.capabilities = vim.lsp.protocol.make_client_capabilities()
                Vapour.language_servers.cssls.setup.capabilities.textDocument.completion.completionItem.snippetSupport = true
            end,
            setup = {}
        },
        html = {
            enabled = false,
            vapour_init = function()
                Vapour.utils.plugins.require('lspconfig')

                Vapour.language_servers.html.setup.capabilities = vim.lsp.protocol.make_client_capabilities()
                Vapour.language_servers.html.setup.capabilities.textDocument.completion.completionItem.snippetSupport = true
            end,
            setup = {}
        },
        tsserver = {enabled = false},
        pyright = {enabled = false},
        jedi_language_server = {enabled = false},
        pylsp = {enabled = false},
        vimls = {enabled = false},
        yamlls = {enabled = false},
        solargraph = {enabled = false},
        vuels = {enabled = false},
        phpactor = {
            enabled = false,
            vapour_init = function()
                require 'language-servers.phpactor'
            end
        },
        jsonls = {
            enabled = false,
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
        gopls = {enabled = false, setup = {cmd = {"gopls", "serve"}, settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}}}}
    },
    plugins = {
        indent_blankline = {enabled = true, enable_rainbow_colors = false},
        colorizer = {enabled = true},
        bufferline = {enabled = true},
        galaxyline = {enabled = true},
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
                    -- l = {"<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<cr>", "LazyGit"}
                }
            }
        },
        treesitter = {enabled = true, indent = {enabled = false}},
        rainbow_parentheses = {enabled = true},
        closetag = {enabled = true},
        vsnip = {enabled = true},
        markdown_preview = {eanbled = true},
        telescope = {enabled = true},
        nvim_tree = {enabled = true},
        dial = {enabled = true},
        format = {enabled = true},
        nvim_comment = {enabled = true},
        neogit = {enabled = true},
        compe = {enabled = true, sources = {}},
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
        colorscheme = 'onedark'
    }
}

require('vapour.utils')
