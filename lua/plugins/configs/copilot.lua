local colors = require("plugins.configs.common").colorscheme.colors

vim.keymap.set('i', '<C-e>', 'copilot#Accept("<Esc><S-a>")', {noremap = true, silent = true, expr=true, replace_keycodes = false})
vim.g.copilot_no_tab_map = 1

vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = colors.gray })
