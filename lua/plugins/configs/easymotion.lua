local colors = require("plugins.configs.common").colorscheme.colors

vim.g.EasyMotion_smartcase = true

vim.keymap.set('', '<Leader>h', '<Plug>(easymotion-linebackward)', {remap = true})
vim.keymap.set('', '<Leader>j', '<Plug>(easymotion-j)', {remap = true})
vim.keymap.set('', '<Leader>k', '<Plug>(easymotion-k)', {remap = true})
vim.keymap.set('', '<Leader>l', '<Plug>(easymotion-lineforward)', {remap = true})

vim.api.nvim_set_hl(0, 'EasyMotionTarget', { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'EasyMotionTarget2First', { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'EasyMotionTarget2Second', { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'EasyMotionShade', { fg = colors.gray })
