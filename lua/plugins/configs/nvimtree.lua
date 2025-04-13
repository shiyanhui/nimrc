local common = require("plugins.configs.common")
local colorscheme = common.colorscheme

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors    = true

vim.keymap.set("n", "<Leader><Tab>", "<CMD>NvimTreeToggle<CR>")

require("nvim-tree").setup({
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
          arrow_closed = "",
          arrow_open = "",
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

if colorscheme.is_onedark() then
  vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = colorscheme.colors.blue })
elseif colorscheme.is_monokai_pro() then
  vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = colorscheme.colors.black })
end
