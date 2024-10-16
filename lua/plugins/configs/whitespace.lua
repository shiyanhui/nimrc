local colors = require('onenord.colors').load()

vim.g.better_whitespace_guicolor             = colors.dark_red
vim.g.better_whitespace_enabled              = true
vim.g.current_line_whitespace_disabled_soft  = true
vim.g.current_line_whitespace_disabled_hard  = true
vim.g.gstrip_whitelines_at_eof               = true
vim.g.go_highlight_trailing_whitespace_error = false

vim.keymap.set('n', '<Leader><Space>', ':StripWhitespace!<CR>')
