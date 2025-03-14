local colors = require("plugins.configs.common").colorscheme.colors

require("monokai-pro").setup({
  transparent_background = false,
  terminal_colors = true,
  devicons = true,
  filter = "machine",
  inc_search = "underline",
  background_clear = {
    "bufferline"
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      bold = false,
    },
    indent_blankline = {
      context_highlight = "default",
      context_start_underline = false,
    },
  },
  override = function()
    return {
      Directory = { bg = colors.bg, fg = colors.fg },
    }
  end,
  overridePalette = function(filter)
    return {
      dark2 = colors.black,
    }
  end,
})

vim.cmd([[colorscheme monokai-pro]])

vim.api.nvim_set_hl(0, '@markup.raw.block.markdown', { bg = "NONE" })
