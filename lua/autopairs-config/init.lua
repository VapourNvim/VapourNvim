local npairs = Vapour.utils.plugins.packadd('nvim-autopairs', true)

-- if remap == nil then return end

npairs.setup({break_line_filetype = nil, check_ts = true})

local remap = vim.api.nvim_set_keymap
_G.MUtils = {}

if Vapour.plugins.compe.enabled == true then
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
else
    MUtils.completion_confirm = function()
        if vim.fn.pumvisible() ~= 0 then
            return npairs.esc("<cr>")
        else
            return npairs.autopairs_cr()
        end
    end

    remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})
end
