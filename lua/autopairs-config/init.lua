local npairs = Vapour.utils.plugins.exists('nvim-autopairs')

if remap == nil then return end

npairs.setup({break_line_filetype = nil})
local remap = vim.api.nvim_set_keymap

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            vim.fn["compe#confirm"]()
            return npairs.esc("<c-y>")
        else
            vim.defer_fn(function()
                vim.fn["compe#confirm"]("<cr>")
            end, 20)
            return npairs.esc("<c-n>")
        end
    else
        return npairs.check_break_line_char()
    end
end

remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})
