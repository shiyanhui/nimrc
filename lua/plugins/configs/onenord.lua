local colors = require("onenord.colors").load()

vim.o.background = "dark"

require("onenord").setup({
  borders = true,
  fade_nc = false,
  disable = {
    eob_lines = true,
  },
  inverse = {
    match_paren = true,
  },
})

-- Highlight the CocInlayHint
vim.api.nvim_set_hl(0, "CocInlayHint", { fg = colors.light_gray })

-- For the lazy.nvim floating window
vim.api.nvim_set_hl(0, "LazyNormal", { bg = colors.bg })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.bg, fg = colors.selection })
