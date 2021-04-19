require"format".setup {
    ["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
    lua = {
        {
            cmd = {
                function(file)
                    return string.format(
                               "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb %s",
                               file)
                end
            }
        }
    },
    javascript = {
        {
            cmd = {
                function(file)
                    return string.format("npx prettier --write %s", file)
                end
            }
        }
    },
    typescript = {
        {
            cmd = {
                function(file)
                    return string.format("npx prettier --write %s", file)
                end
            }
        }
    },
    python = {
        {
            cmd = {
                function(file)
                    return string.format("black --quiet %s", file)
                end
            }
        }
    }
}

vim.cmd('autocmd BufWritePost *.lua FormatWrite')
vim.cmd('autocmd BufWritePost *.py FormatWrite')
vim.cmd('autocmd BufWritePost *.js FormatWrite')

