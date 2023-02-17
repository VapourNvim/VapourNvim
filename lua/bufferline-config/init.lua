-- Bootstrap: Bail during initialization.
if vim.g.nvim_bootsrapped == 1 then return nil end

local bufferline = Vapour.utils.plugins.require('bufferline')
bufferline.setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    }
  }
}
