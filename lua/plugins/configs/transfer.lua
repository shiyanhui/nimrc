function upload()
  local path = vim.api.nvim_buf_get_name(0)
  if path ~= "" then
    vim.cmd("TransferUpload " .. path)
  else
    print("TransferUpload failed: empty buffer path")
  end
end

vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>lua upload()<CR>", { noremap = true, silent = true })
