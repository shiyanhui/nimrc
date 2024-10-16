vim.g.mapleader = ","

vim.keymap.set("n", "<Leader>w", ":w!<CR>")
vim.keymap.set("n", "<Leader>q", ":q!<CR>")
vim.keymap.set("n", "<Leader>/", ":nohls<CR>")
vim.keymap.set("n", "<Leader>p", ":Lazy<CR>")
vim.keymap.set("n", "<Leader>cp", ":CopilotChatToggle<CR>", {silent = true, noremap = true})

vim.keymap.set("n", "U", ":redo<CR>")
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

vim.keymap.set("n", "<C-j>", ":Jumps<CR>")
vim.keymap.set("i", "<C-j>", "<Esc>:Jumps<CR>")
