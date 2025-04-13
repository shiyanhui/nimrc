vim.g.mapleader = ","

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<Leader>w", "<CMD>w!<CR>", opts)
vim.keymap.set("n", "<Leader>q", "<CMD>q!<CR>", opts)
vim.keymap.set("n", "<Leader>/", "<CMD>nohls<CR>", opts)
vim.keymap.set("n", "<Leader>p", "<CMD>Lazy<CR>", opts)

vim.keymap.set("n", "U", "<CMD>redo<CR>")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("x", "p", "pgvy")
vim.keymap.set("n", ";", ":!")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

vim.keymap.set({"n", "i"}, "<C-a>", "<Esc><S-i>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-a>", "<End>")
vim.keymap.set({"n", "i"}, "<C-e>", "<Esc><S-a>")

vim.keymap.set({"n", "i", "c"}, "<C-f>", "<Right>")
vim.keymap.set({"n", "i", "c"}, "<C-b>", "<Left>")

vim.keymap.set("n", "<C-t>", "<C-o>")
vim.keymap.set("n", "<C-o>", "O")
vim.keymap.set("i", "<C-o>", "<Esc>O")
