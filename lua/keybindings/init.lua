vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>l', ':LazyGit<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})

vim.api.nvim_set_keymap('n', '<C-b>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-B>', ':bprevious<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = false})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = false})

vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>/', ':CommentToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>/', ':CommentToggle<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>r', ':Telescope live_grep<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 's', ":HopChar2<CR>", {silent = true})
vim.api.nvim_set_keymap('n', 'S', ":HopWord<CR>", {silent = true})

vim.api.nvim_set_keymap('n', '<Leader>t', ":ToggleTerm<CR>", {silent = true})

vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
