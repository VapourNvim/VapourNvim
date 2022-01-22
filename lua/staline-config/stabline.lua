require('stabline').setup {
  defaults = {
    style = "bar",
    stab_left = "┃",
    stab_right = " ",
    inactive_bg = "#1e2127",
    inactive_fg = "#aaaaaa",
    -- stab_bg     = Default is darker version of bg.,

    font_active = "bold",
    exclude_fts = {'NvimTree', 'dashboard', 'lir'},
    stab_start = "",
    stab_end = ""
  }
}
