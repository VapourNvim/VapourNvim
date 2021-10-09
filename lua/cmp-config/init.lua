Vapour.utils.plugins.packadd('nvim-compe')

vim.o.completeopt = "menu,menuone,noselect"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})},
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"]() == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, {"i", "s"})
    },
    sources = {{name = 'nvim_lsp'}, {name = 'vsnip'}, {name = 'buffer'}, {name = 'omni'}}
})

vim.cmd("autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }")

-- Setup lspconfig.
-- require'lspconfig'.html.setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }
-- local system_name
-- if vim.fn.has("mac") == 1 then
--   system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--   system_name = "Linux"
-- elseif vim.fn.has('win32') == 1 then
--   system_name = "Windows"
-- else
--   print("Unsupported system for sumneko")
-- end
-- 
-- -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = "/Users/neilsabde/.config/nvim/lua-language-server/"
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
-- 
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- 
-- 
-- require'lspconfig'.sumneko_lua.setup {
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--         maxPreload = 2000,
--         checkThirdParty = false
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
-- 
-- local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
-- 
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
-- end
-- 
-- -- Show icons in autocomplete
-- require('vim.lsp.protocol').CompletionItemKind = {
--     '', '', 'ƒ', ' ', '', '', '', 'ﰮ', '', '', '', '', '了', ' ', '﬌ ', ' ', ' ', '', ' ', ' ',
--     ' ', ' ', '', '', '<>'
-- }
-- 
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = {spacing = 5, severity_limit = 'Warning'},
--     update_in_insert = true
-- })
