local colors = require('onenord.colors').load()

vim.g.EasyMotion_smartcase = true

vim.keymap.set('', '<Leader>h', '<Plug>(easymotion-linebackward)', {remap = true})
vim.keymap.set('', '<Leader>j', '<Plug>(easymotion-j)', {remap = true})
vim.keymap.set('', '<Leader>k', '<Plug>(easymotion-k)', {remap = true})
vim.keymap.set('', '<Leader>l', '<Plug>(easymotion-lineforward)', {remap = true})

vim.api.nvim_set_hl(0, 'EasyMotionTarget', { fg = colors.dark_red, bold = true })
vim.api.nvim_set_hl(0, 'EasyMotionTarget2First', { fg = colors.dark_red, bold = true })
vim.api.nvim_set_hl(0, 'EasyMotionTarget2Second', { fg = colors.dark_red, bold = true })
vim.api.nvim_set_hl(0, 'EasyMotionShade', { fg = colors.light_gray })
