require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    highlight = {enable = true},
    autotag = {enable = true},
    rainbow = {enable = true}
}
