require('vapour.globals')

-- Vapour object to use for namespacing
Vapour = {
    language_servers = {sumneko = {enabled = false}},
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

            -- Set to true to allow which_key.user_defined to override anything set by plugins
            allow_override_mappings = nil
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
