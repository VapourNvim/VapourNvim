Vapour.utils.plugins.packadd('nvim-lspconfig')

local lspconfig = Vapour.utils.plugins.require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Language servers
for ls_type, props in pairs(Vapour.language_servers) do
  if props.enabled == true then
    if props.vapour_init then props.vapour_init() end
    
    lspconfig[ls_type].setup(props.setup or {})
  end
end

require'lspconfig'.jsonls.setup {
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}

require'lspconfig'.gopls.setup {cmd = {"gopls", "serve"}, settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}}}

-- Lua is a little bit different

USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/ls/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.config/nvim/ls/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/ls/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.config/nvim/ls/lua-language-server/bin/Linux/lua-language-server"
elseif vim.fn.has("win32") == 1 then
    sumneko_root_path = "C:\\Users" .. USER .. "\\.config\\nvim\\ls\\lua-language-server"
    sumneko_binary = "C:\\Users" .. USER .. "\\.config\\nvim\\ls\\lua-language-server\\bin\\Windows\\lua-language-server"
elseif Vapour.language_servers.sumneko['root_path'] ~= nil then
    sumneko_root_path = Vapour.language_servers.sumneko.root_path
    sumneko_binary = Vapour.language_servers.sumneko.binary_path
else
    print("Unsupported system for sumneko")
end

if Vapour.language_servers.sumneko.enabled and sumneko_binary ~= "" and not Vapour.utils.file.exists(sumneko_binary) then
  print('Unable to load Sumneko language servr.  Make sure it is installed in ' .. sumneko_root_path)
else
  local luadev = Vapour.utils.plugins.require('lua-dev')
  local lua_lsp_config = {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            diagnostics = {globals = {'vim'}},
            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
                preloadFileSize = 450
            }
          }
        }
      }

  if luadev ~= nil then
    lua_lsp_config = luadev.setup {
      lspconfig = lua_lsp_config
    }
  end

  require'lspconfig'.sumneko_lua.setup(lua_lsp_config)
end

-- Diagnostics

vim.fn.sign_define("LspDiagnosticsSignError", {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})

-- Some Keybindings for lsp

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'ca', ':Lspsaga range_code_action<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', {noremap = true, silent = true})

-- Show icons in autocomplete

require('vim.lsp.protocol').CompletionItemKind = {
    '', '', 'ƒ', ' ', '', '', '', 'ﰮ', '', '', '', '', '了', ' ', '﬌ ', ' ', ' ', '', ' ', ' ',
    ' ', ' ', '', '', '<>'
}
