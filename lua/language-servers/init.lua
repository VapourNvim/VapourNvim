Vapour.utils.plugins.packadd('nvim-lspconfig')

local lspconfig = Vapour.utils.plugins.require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Language servers
for ls_type, props in pairs(Vapour.language_servers) do
  if props.enabled == true then
    if props.vapour_init then props.vapour_init() end

    lspconfig[ls_type].setup(props.setup or {
      capabilities = capabilities,
      root_dir = function(_)
        return vim.loop.cwd()
      end

    })
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
  sumneko_binary = "/Users/" .. USER .. "/.config/nvim/ls/lua-language-server/bin/lua-language-server"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/" .. USER .. "/.config/nvim/ls/lua-language-server"
  sumneko_binary = "/home/" .. USER .. "/.config/nvim/ls/lua-language-server/bin/Linux/lua-language-server"
elseif vim.fn.has("win32") == 1 then
  sumneko_root_path = "C:\\Users\\" .. USER .. "\\AppData\\Local\\nvim\\ls\\lua-language-server"
  sumneko_binary = "C:\\Users" .. USER .. "\\AppData\\Local\\nvim\\ls\\lua-language-server\\bin\\Windows\\lua-language-server"
elseif Vapour.language_servers.sumneko_lua['root_path'] ~= nil then
  sumneko_root_path = Vapour.language_servers.sumneko_lua.root_path
  sumneko_binary = Vapour.language_servers.sumneko_lua.binary_path
else
  print("Unsupported system for sumneko")
end

if Vapour.language_servers.sumneko_lua.enabled and sumneko_binary ~= "" and not Vapour.utils.file.exists(sumneko_binary) then
  print('Unable to load Sumneko language server.  Make sure it is installed in ' .. sumneko_root_path)
else
  local luadev = Vapour.utils.plugins.require('lua-dev')
  local lua_lsp_config = {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
      Lua = {
        runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
        diagnostics = {globals = {'vim'}},
        workspace = {library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}, preloadFileSize = 450}
      }
    }
  }

  if luadev ~= nil then lua_lsp_config = luadev.setup {lspconfig = lua_lsp_config} end

  require'lspconfig'.sumneko_lua.setup(lua_lsp_config)
end

-- Diagnostics

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- Show icons in autocomplete
require('vim.lsp.protocol').CompletionItemKind = {
  '', '', 'ƒ', ' ', '', '', '', 'ﰮ', '', '', '', '', '了', ' ', '﬌ ', ' ', ' ', '', ' ', ' ',
  ' ', ' ', '', '', '<>'
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {spacing = 5, severity_limit = 'Warning'},
  update_in_insert = true
})
