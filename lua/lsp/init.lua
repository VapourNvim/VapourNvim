vim.fn.sign_define("LspDiagnosticsSignError", {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {texthl = "LspDiagnosticsSignInformation", text = "💡", numhl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {texthl = "LspDiagnosticsSignHint", text = "💡", numhl = "LspDiagnosticsSignHint"})

vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')
vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
vim.cmd('nnoremap <silent> ca :Lspsaga code_action<CR>')
vim.cmd('nnoremap <silent> K :Lspsaga hover_doc<CR>')
vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd('nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>')
vim.cmd('nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>')
vim.cmd('nnoremap <silent> <C-f> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')
vim.cmd('nnoremap <silent> <C-b> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')

require('vim.lsp.protocol').CompletionItemKind = {
      '';          -- = 1
      '';      -- = 2;
      'ƒ';        -- = 3;
      ' ';   -- = 4;
      '';         -- = 5;
      '';      -- = 6;
      '';         -- = 7;
      'ﰮ';     -- = 8;
      '';        -- = 9;
      '';      -- = 10;
      '';          -- = 11;
      '';         -- = 12;
      '了';          -- = 13;
      ' ';       -- = 14;
      '﬌ ';       -- = 15;
      ' ';         -- = 16;
      ' ';          -- = 17;
      '';     -- = 18;
      ' ';        -- = 19;
      ' ';    -- = 20;
      ' ';      -- = 21;
      ' ';        -- = 22;
      '';         -- = 23;
      '';      -- = 24;
      '<>'; -- = 25;
}
