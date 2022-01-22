require"staline".setup {
  sections = {
    left = {("▁"):rep(vim.o.columns)}, -- change thickness: "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
    mid = {},
    right = {}
  }
}
