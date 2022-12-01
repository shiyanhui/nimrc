vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.keymap.set('n', '<Leader><Tab>', ':NvimTreeToggle<CR>')

vim.cmd [[
  highlight! NvimTreeEndOfBuffer ctermfg=0 guifg=#353b49
]]

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    hide_root_folder = true,
    adaptive_size = false,
    -- width = 40,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
