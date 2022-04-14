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
