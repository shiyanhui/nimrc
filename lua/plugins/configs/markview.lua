local presets = require("markview.presets");

require("markview").setup({
  preview = {
    filetypes = { "markdown", "codecompanion" },
    -- NOTE: `ignore_buftypes` must be keep empty, or codecompanion will not take effect
    ignore_buftypes = {},
    icon_provider = "devicons",
    enable_hybrid_mode = false,
    hybrid_modes = {},
    debounce = 50,
  },
  markdown = {
    headings = presets.headings.arrowed,
    code_blocks = {
      style = "simple",
    },
    list_items = {
      indent_size = 2,
      shift_width = 2,
    }
  }
})
