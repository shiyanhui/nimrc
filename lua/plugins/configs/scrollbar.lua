local colors = require("plugins.configs.common").colorscheme.colors

require("scrollbar").setup({
  hide_if_all_visible = false,
  handle = {
    color = colors.light_bg,
    highlight = "CursorColumn",
    hide_if_all_visible = false,
  },
  handlers = {
    cursor = true,
    diagnostic = false,
    gitsigns = true,
    handle = true,
    search = false,
    ale = false,
  },
})
