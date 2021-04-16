local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
    formatStdin = true
}

local isort = {formatCommand = "isort --in-place ${INPUT}", formatStdin = true}

local yapf = {formatCommand = "yapf -i ${INPUT}", formatStdin = true}

local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "python"},
    settings = {
        rootMarkers = {".git/"},
        languages = {lua = {luaFormat}, python = {isort, yapf}, html = {prettier}, css = {prettier}, json = {prettier}, yaml = {prettier}}
    }
}
vim.cmd('autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)')
-- Because vim does not reload after formatting for me
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
vim.cmd('autocmd BufWritePost *.py edit!')
-- vim.cmd('autocmd BufWritePost *.py edit!')
-- vim.cmd('autocmd BufWritePost *.py edit!')
-- vim.cmd('autocmd BufWritePost *.py edit!')
-- vim.cmd('autocmd BufWritePost *.py edit!')
