local npairs = Vapour.utils.plugins.packadd('nvim-autopairs', true)

-- if remap == nil then return end

npairs.setup({break_line_filetype = nil, check_ts = true})

local remap = vim.api.nvim_set_keymap
_G.MUtils = {}

if Vapour.plugins.cmp.enabled == true then
    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = true, -- automatically select the first item
        insert = false, -- use insert confirm behavior instead of replace
        map_char = { -- modifies the function or method delimiter by filetypes
            all = '(',
            tex = '{'
        }
    })
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
