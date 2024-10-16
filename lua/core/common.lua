local common = {
  augroup = vim.api.nvim_create_augroup("EventGroup", {
    clear = true
  }),
}

return common
