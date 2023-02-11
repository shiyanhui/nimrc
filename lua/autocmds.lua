local common  = require('common')

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
