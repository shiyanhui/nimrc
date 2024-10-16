local monokaipro = require("monokai-pro")
local colors     = require("plugins.configs.common").colorscheme.colors

monokaipro.setup({
  transparent_background = false,
  filter = "machine",
  inc_search = "background",
  background_clear = {
    "float_win",
    "bufferline",
  },
  override = function(c)
    return {
      NvimTreeFolderIcon        = { fg = colors.blue },
      NvimTreeOpenedFolderIcon  = { fg = colors.blue },
      NvimTreeFolderName        = { fg = c.base.dimmed1 },
      NvimTreeOpenedFolderName  = { fg = c.base.dimmed1, bold = true, italic = true },
      NvimTreeEmptyFolderName   = { fg = c.base.dimmed1 },
      NvimTreeFolderArrowOpen   = { fg = c.base.dimmed1 },
      NvimTreeFolderArrowClosed = { fg = c.base.dimmed1 },
      NvimTreeNormal            = { fg = c.base.dimmed1 },
      Directory                 = { fg = colors.fg, bg = colors.bg },
      NormalFloat               = { bg = c.base.dimmed1 },
    }
  end,
  overridePalette = function(filter)
    return {
      dark1 = colors.light_bg,
    }
  end,
  overrideScheme = function(cs, p, config, hp)
    local cs_override = {}
    cs_override.statusBar = {
      background = colors.light_bg,
    }
    return cs_override
  end
})

monokaipro.load()
