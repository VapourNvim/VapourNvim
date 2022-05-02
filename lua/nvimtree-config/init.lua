local nvimtree = Vapour.utils.plugins.require 'nvim-tree'
nvimtree.setup {
  filters = {custom = {'*.tmp', '.git'}},
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {'dashboard'},
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  },
  filters = {custom = {'.git'}},
  view = {
    width = Vapour.plugins.nvim_tree.view_width,
    side = 'left',
    mappings = {custom_only = false, list = {}}
  },
  renderer = {
    indent_markers = {enable = true, icons = {corner = "└ ", edge = "│ ", none = "  "}}
  }
}
vim.cmd [[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
