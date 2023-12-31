local colors = require('onenord.colors').load()

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

vim.o.background = 'dark'
vim.cmd.colorscheme 'onenord'

-- Highlight the CocInlayHint
vim.api.nvim_set_hl(0, 'CocInlayHint', { fg = colors.light_gray })
