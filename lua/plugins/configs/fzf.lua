local fzf = require("fzf-lua")

fzf.setup{
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

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>f", "<CMD>FzfLua files<CR>", opts)
vim.keymap.set("n", "<Leader>b", "<CMD>FzfLua buffers<CR>", opts)
vim.keymap.set("n", "<Leader>ag", "<CMD>FzfLua grep_project<CR>", opts)
vim.keymap.set("n", "<C-j>", "<CMD>FzfLua jumps<CR>", opts)
vim.keymap.set("i", "<C-j>", "<Esc><CMD>FzfLua jumps<CR>", opts)

vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
vim.keymap.set("n", "gy", fzf.lsp_typedefs, opts)
vim.keymap.set("n", "gi", fzf.lsp_implementations, opts)
vim.keymap.set("n", "gr", fzf.lsp_references, opts)
vim.keymap.set("n", "gs", fzf.lsp_document_symbols, opts)
vim.keymap.set("n", "gc", fzf.lsp_incoming_calls, opts)
vim.keymap.set("n", "ge", fzf.lsp_document_diagnostics, opts)

vim.keymap.set("n", "<C-f>", ":FzfLua ")

-- Register fzf-lua as the UI interface for vim.ui.select
fzf.register_ui_select()

vim.cmd [[
  cab ff FzfLua
]]
