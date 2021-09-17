Vapour.utils.plugins.packadd('nvim-treesitter')

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    indent = {enable = true},
    highlight = {enable = true},
    autotag = {enable = Vapour.plugins.closetag.enabled},
    rainbow = {enable = Vapour.plugins.rainbow_parentheses.enabled, extended_mode = false, disable = {"html"}},
    autopairs = {enable = true}
}
