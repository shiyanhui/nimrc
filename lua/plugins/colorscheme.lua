vim.o.background = 'dark'
vim.cmd.colorscheme 'onenord'

require('onenord').setup({
  borders = true,
  fade_nc = false,
  disable = {
    eob_lines = true,
  },
  inverse = {
    match_paren = true,
  },
})
