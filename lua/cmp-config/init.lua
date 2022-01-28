vim.o.completeopt = "menu,menuone,noselect"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
             and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
             == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local cmp = Vapour.utils.plugins.require('cmp')
local lspkind = Vapour.utils.plugins.require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {buffer = "[Buf]", nvim_lsp = "[LSP]", dictionary = "[Dict]", vsnip = "[Vsnip]"}
    })
  },
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
  sources = Vapour.plugins.lsp.cmp_sources
})

Vapour.utils.plugins.require("cmp_dictionary").setup({
  dic = {["markdown,text"] = "/usr/share/dict/words"}
})

vim.cmd(
    "autocmd FileType TelescopePrompt lua Vapour.utils.plugins.require('cmp').setup.buffer { enabled = false }")
