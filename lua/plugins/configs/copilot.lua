local colors = require("plugins.configs.common").colorscheme.colors

vim.keymap.set('i', '<C-e>', 'copilot#Accept("<Esc><S-a>")', {noremap = true, silent = true, expr=true, replace_keycodes = false})
vim.keymap.set('i', '<C-s>', '<Plug>(copilot-suggest)')

vim.g.copilot_no_tab_map = true
vim.g.copilot_no_maps = true
vim.g.copilot_idle_delay = 1
vim.g.copilot_proxy = 'http://localhost:7897'
vim.g.copilot_proxy_strict_ssl = false

vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = colors.gray })
