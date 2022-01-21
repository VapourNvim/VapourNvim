if Vapour.plugins.lsp.enabled then
  local lsp_installer = Vapour.utils.plugins.require('nvim-lsp-installer')
  lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                         .make_client_capabilities())
    local opts = {capabilities = capabilities}
    if Vapour.language_servers[server.name] then
      opts = Vapour.language_servers[server.name].config(opts)
    end
    server:setup(opts)
  end)
end

-- Diagnostics

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- Show icons in autocomplete
require('vim.lsp.protocol').CompletionItemKind = {
  '', '', 'ƒ', ' ', '', '', '', 'ﰮ', '', '', '', '', '了', ' ',
  '﬌ ', ' ', ' ', '', ' ', ' ', ' ', ' ', '', '', '<>'
}

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = {spacing = 5, severity_limit = 'Warning'},
      update_in_insert = true
    })
