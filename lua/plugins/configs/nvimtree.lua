local common = require('core.common')

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors    = true

vim.keymap.set('n', '<Leader><Tab>', ':NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd({'QuitPre'}, {
  group = common.augroup,
  callback = function()
    if vim.fn.winnr('$') == 2 then
      vim.cmd("NvimTreeClose")
    end
  end,
})

require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    width = common.sidebar_width,
    hide_root_folder = true,
  },
  renderer = {
    -- root_folder_label = false,
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
