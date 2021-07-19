require"format".setup {
    ["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
    html = {{cmd = {"prettier -w"}}},
    css = {{cmd = {"prettier -w"}}},
    json = {{cmd = {"prettier -w"}}},
    yaml = {{cmd = {"prettier -w"}}},
    javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
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
    python = {
        {
            cmd = {
                function(file)
                    return string.format("black --quiet %s", file)
                end
            }
        }
    },
    go = {
        {
            cmd = {
                function(file)
                    return string.format("gofmt -w %s", file)
                end
            }
        }
    },
    ruby = {
        {
            cmd = {
                function(file)
                    return string.format("rufo %s", file)
                end
            }
        }
    },
    vue = {
        {
            cmd = {
                function(file)
                    return string.format("vue-beautify %s", file)
                end
            }
        }
    },
    php = {
        {
            cmd = {
                function(file)
                    return string.format("php-formatter formatter:use:sort --quiet %s", file)
                end
            }
        }
    }
}

vim.cmd('autocmd BufWritePost *.lua FormatWrite')
vim.cmd('autocmd BufWritePost *.py FormatWrite')
vim.cmd('autocmd BufWritePost *.js FormatWrite')

