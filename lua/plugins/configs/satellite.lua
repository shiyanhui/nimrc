local colors = require('onenord.colors').load()

require('satellite').setup {
  current_only = false,
  winblend = 30,
  zindex = 40,
  excluded_filetypes = {},
  width = 2,
  handlers = {
    cursor = {
      enable = true,
      symbols = { '' }
    },
    search = {
      enable = true,
      symbols = { '-' },
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

vim.api.nvim_set_hl(0, "SatelliteCursor", { fg = colors.fg })
vim.api.nvim_set_hl(0, "SatelliteSearch", { fg = colors.yellow })
