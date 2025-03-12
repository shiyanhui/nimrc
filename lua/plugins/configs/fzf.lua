require("fzf-lua").setup{
  defaults = {
    prompt = "❯ "
  },
  winopts = {
    width      = 0.88,
    height     = 0.66,
    fullscreen = true,
  },
  keymap = {
    builtin = {
      false
    },
    fzf = {
      false
    }
  }
}

vim.keymap.set('n', '<Leader>f', '<CMD>FzfLua files<CR>')
vim.keymap.set('n', '<Leader>b', '<CMD>FzfLua buffers<CR>')
vim.keymap.set('n', '<Leader>ag', '<CMD>FzfLua grep_project<CR>')
