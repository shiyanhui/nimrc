local common = require("plugins.configs.common")

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors    = true

vim.keymap.set('n', '<Leader><Tab>', ':NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()

    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end

    if #invalid_win == #wins - 1 then
      for _, w in ipairs(invalid_win) do
        if #vim.api.nvim_list_wins() > 1 then
          vim.api.nvim_win_close(w, true)
        end
      end
    end
  end
})

require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    width = common.sidebar_width,
  },
  renderer = {
    root_folder_label = false,
    group_empty = true,
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      }
    },
  },
  filters = {
    dotfiles = true
  },
})
