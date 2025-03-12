local common = require("plugins.configs.common")
local colors = common.colorscheme.colors

require("lualine").setup({
  options = {
    theme = common.colorscheme.get_name(),
    disabled_filetypes = {"packer", "NvimTree"},
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  }
})
