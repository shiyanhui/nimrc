local colors = require("plugins.configs.common").colorscheme.colors

require("noice").setup({
  presets = {
    bottom_search = false,
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
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
    },
    progress = {
      enabled = false
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    message = {
      enabled = false,
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
      enabled = false,
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
        style = "border",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = {
          Normal = "Normal",
          FloatBorder = "DiagnosticInfo"
        },
      },
    },
  },
})

vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { fg = colors.cyan })

-- NOTE: To adapt to the 0.11 winborder temporarily
local initialWinborder = vim.o.winborder
vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
    vim.o.winborder = "none"
  end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
    vim.o.winborder = initialWinborder
  end,
})
