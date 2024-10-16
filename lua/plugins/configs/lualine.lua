local common = require("plugins.configs.common")

require('lualine').setup({
  options = {
    theme = common.colorscheme.get_name(),
    disabled_filetypes = {'packer', 'NvimTree'},
  }
})
