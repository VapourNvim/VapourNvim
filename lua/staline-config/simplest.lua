-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

require"staline".setup {
  sections = {
    left = {("▁"):rep(vim.o.columns)}, -- change thickness: "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
    mid = {},
    right = {}
  }
}
