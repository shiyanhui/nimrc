local common = require('common')

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors    = true

vim.keymap.set('n', '<Leader><Tab>', ':NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd({'QuitPre'}, {
  group = common.augroup,
  callback = function()
    vim.cmd("NvimTreeClose")
  end,
})

require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    hide_root_folder = true,
    adaptive_size = false,
    width = common.sidebar_width,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        git = {
          -- ignored = "󰛑",
        }
      }
    }
  },
  filters = {
    dotfiles = true,
  },
})
