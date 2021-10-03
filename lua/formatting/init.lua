require"format".setup {
    ["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
    html = {{cmd = {"prettier -w"}}},
    css = {{cmd = {"prettier -w"}}},
    json = {{cmd = {"prettier -w"}}},
    yaml = {{cmd = {"prettier -w"}}},
    javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    javascriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    typescriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    lua = {
        {
            cmd = {
                function(file)
                    return string.format(
                               "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb %s",
                               file)
                end
            },
            tempfile_postfix = ".tmp"
        }
    },
    python = {
        {
            cmd = {
                function(file)
                    return string.format("black --quiet %s", file)
                end
            },
            tempfile_postfix = ".tmp"
        }
    },
    go = {
        {
            cmd = {
                function(file)
                    return string.format("gofmt -w %s", file)
                end
            },
            tempfile_postfix = ".tmp"
        }
    },
    ruby = {
        {
            cmd = {
                function(file)
                    return string.format("rufo %s", file)
                end
            },
            tempfile_postfix = ".tmp"
        }
    },
    vue = {
        {
            cmd = {
                function(file)
                    return string.format("vue-beautify %s", file)
                end
            },
            tempfile_postfix = ".tmp"
        }
    },
    php = {
        {
            cmd = {
                function(file)
                    return string.format("php-formatter formatter:use:sort --quiet %s", file)
                end
            },
            tempfile_postfix = ".tmp"
        }
    }
}

vim.cmd('autocmd BufWritePost * FormatWrite')
