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
    headings = {
      enable = true,
      heading_1 = {
        icon = "󰉫 "
      },
      heading_2 = {
        icon = "󰉬 "
      },
      heading_3 = {
        icon = "󰉭 "
      },
      heading_4 = {
        icon = "󰉮 "
      },
      heading_5 = {
        icon = "󰉯 "
      },
      heading_6 = {
        icon = "󰉰 "
      },
    },
    code_blocks = {
      style = "simple",
      sign = false
    },
    list_items = {
      enable = true,
      indent_size = 0,
      shift_width = 1,
      marker_minus = {
        text = "",
      },
    }
  },
  experimental = {
    check_rtp_message = false
  }
})
