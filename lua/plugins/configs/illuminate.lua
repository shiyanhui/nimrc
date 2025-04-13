require("illuminate").configure({
  under_cursor = true,
  large_file_cutoff = 10000,
  case_insensitive_regex = false,
  disable_keymaps = true,
  filetypes_denylist = {
    "NvimTree",
    "codecompanion",
  }
})
