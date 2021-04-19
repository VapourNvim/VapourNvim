local M = {}

function M.is_buffer_empty()
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function M.has_width_gt(cols)
    return vim.fn.winwidth(0) / 2 > cols
end

return M
