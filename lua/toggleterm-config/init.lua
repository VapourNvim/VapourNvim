require"toggleterm".setup {
    size = 13,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal'
}
local Terminal = require('toggleterm.terminal').Terminal
local float = Terminal:new({direction = "float"})
local lazygit = Terminal:new({cmd = "lazygit", direction = "float"})

function _float_toggle()
    float:toggle()
end

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _float_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
