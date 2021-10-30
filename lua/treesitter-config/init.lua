Vapour.utils.plugins.packadd('nvim-treesitter')

require'nvim-treesitter.configs'.setup {
    ensure_installed = Vapour.plugins.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = Vapour.plugins.treesitter.ignore_install,
    indent = Vapour.plugins.treesitter.indent,
    highlight = Vapour.plugins.treesitter.highlight,
    autotag = Vapour.plugins.treesitter.autotag,
    rainbow = Vapour.plugins.treesitter.rainbow
}
