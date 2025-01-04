local colors = require("plugins.configs.common").colorscheme.colors

vim.api.nvim_set_hl(0, "RainbowDelimiterRed",    { fg = colors.red })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",   { fg = colors.blue })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = colors.orange })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen",  { fg = colors.green })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = colors.purple })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan",   { fg = colors.cyan })

require("rainbow-delimiters.setup").setup({
  highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
  }
})
