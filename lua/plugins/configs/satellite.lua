local colors = require("plugins.configs.common").colorscheme.colors

require("satellite").setup {
  current_only = false,
  winblend = 30,
  zindex = 40,
  excluded_filetypes = {},
  width = 2,
  handlers = {
    cursor = {
      enable = true,
      symbols = { "" }
    },
    search = {
      enable = true,
      symbols = { "-" },
    },
    diagnostic = {
      enable = false,
    },
    gitsigns = {
      enable = false,
    },
    marks = {
      enable = false,
    },
    quickfix = {
      enable = false,
    }
  },
}

vim.api.nvim_set_hl(0, "SatelliteCursor", { fg = colors.white })
vim.api.nvim_set_hl(0, "SatelliteSearch", { fg = colors.yellow })
