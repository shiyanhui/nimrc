require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install   = { "ipkg" },
  sync_install     = false,
  auto_install     = false,
  highlight = {
    enable = true
  },
  rainbow = {
    enable         = true,
    extended_mode  = true,
    max_file_lines = nil,
  }
})
