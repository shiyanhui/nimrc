local colors = require("plugins.configs.common").colorscheme.colors

require("noice").setup({
  presets = {
    bottom_search = false,
    -- command_palette = true,
  },
  messages = {
    enabled = false
  },
  notify = {
    enabled = false
  },
  cmdline = {
    format = {
      cmdline = { pattern = "^:", icon = ":", lang = "vim", title = " Command " },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash", title = " Shell " },
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = "18",
        col = "50%",
      },
      size = {
        min_width = 66,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = "21",
        col = "50%",
      },
      size = {
        width = 66,
        max_width = 66;
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
})

vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { fg = colors.cyan })
