local common = require("core.common")
local colors = require("onenord.colors").load()

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

vim.o.background = "dark"
vim.cmd.colorscheme "onenord"

-- Highlight the CocInlayHint
vim.api.nvim_set_hl(0, "CocInlayHint", { fg = colors.light_gray })

vim.api.nvim_create_autocmd("BufEnter", {
  group = common.augroup,
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "OverLength", { bg = colors.light_gray })
    vim.fn.matchadd("OverLength", "\\%121v")
  end,
})
