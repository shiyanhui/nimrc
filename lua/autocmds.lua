local common  = require('common')
local colors = require('onenord.colors').load()

vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  group = common.augroup,
  pattern = {'*'},
  callback = function()
    if vim.fn.line("'\"") <= vim.fn.line('$') then
      vim.cmd [[
        normal! g`"
      ]]
      return 1
    end
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = common.augroup,
  pattern = {'*.h', '*.c'},
  callback = function()
    vim.cmd [[
      setfiletype c
    ]]
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = common.augroup,
  pattern = {'*.pp'},
  callback = function()
    vim.cmd [[
      setfiletype json
    ]]
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = common.augroup,
  pattern = {'*.wxml'},
  callback = function()
    vim.cmd [[
      setfiletype xml
    ]]
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = common.augroup,
  pattern = {'*.wxss'},
  callback = function()
    vim.cmd [[
      setfiletype css
    ]]
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = common.augroup,
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'OverLength', { bg = colors.light_gray })
    vim.fn.matchadd('OverLength', '\\%121v')
  end,
})

vim.cmd([[
  autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab
]])
