local common = {
  color_dark = '#2A2F3A',
  augroup    = vim.api.nvim_create_augroup('EventGroup', {
    clear = true
  }),
  sidebar_width = 40
}

return common
