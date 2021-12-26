Vapour.utils.plugins.packadd('catppuccin')
local catppuccin = require("catppuccin")

catppuccin.setup({
  transparent_background = Vapour.settings.transparent_bg,
  term_colors = false,
  styles = {comments = "italic", functions = "italic", keywords = "italic", strings = "NONE", variables = "NONE"},
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {errors = "italic", hints = "italic", warnings = "italic", information = "italic"},
      underlines = {errors = "underline", hints = "underline", warnings = "underline", information = "underline"}
    },
    lsp_trouble = false,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {enabled = true, show_root = true},
    which_key = true,
    indent_blankline = {enabled = true, colored_indent_levels = true},
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = false,
    lightspeed = false,
    ts_rainbow = true,
    hop = false
  }
})
vim.cmd('colorscheme catppuccin')
Vapour.settings.lualine_colorscheme = "catppuccin"
