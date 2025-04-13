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
      Directory                           = { bg = colors.bg, fg = colors.fg },
      NormalFloat                         = { bg = colors.bg },
      FloatBorder                         = { bg = colors.bg, fg = colors.cyan },
      WinBarNC                            = { bg = colors.bg, fg = colors.dark_gray },
      IlluminatedWordRead                 = { bg = colors.light_gray, underline = true },
      IlluminatedWordText                 = { bg = colors.light_gray, underline = true },
      IlluminatedWordWrite                = { bg = colors.light_gray, underline = true },
      ["@markup.raw.block.markdown"]      = { bg = "NONE" },
      BufferLineCloseButton               = { fg = colors.dark_gray },
      BufferLineCloseButtonVisible        = { fg = colors.dark_gray },
      BufferLineCloseButtonSelected       = { fg = colors.yellow },
      BufferLineBackground                = { italic = true },
      BufferLineBufferSelected            = { bold = true },
      BufferLineHint                      = { italic = true },
      BufferLineHintSelected              = { bold = true },
      BufferLineHintDiagnostic            = { italic = true },
      BufferLineHintDiagnosticSelected    = { bold = true },
      BufferLineInfo                      = { italic = true },
      BufferLineInfoSelected              = { bold = true },
      BufferLineInfoDiagnostic            = { italic = true },
      BufferLineInfoDiagnosticSelected    = { fg = colors.cyan, bold = true },
      BufferLineWarning                   = { italic = true },
      BufferLineWarningSelected           = { bold = true },
      BufferLineWarningDiagnostic         = { italic = true },
      BufferLineWarningDiagnosticSelected = { fg = colors.orange, bold = true },
      BufferLineError                     = { italic = true },
      BufferLineErrorSelected             = { bold = true },
      BufferLineErrorDiagnostic           = { italic = true },
      BufferLineErrorDiagnosticSelected   = { fg = colors.red, bold = true },
    }
  end,
  overridePalette = function(filter)
    return {
      dark2 = colors.black,
    }
  end,
})

vim.cmd [[
  colorscheme monokai-pro
]]
