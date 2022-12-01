local groupId = vim.api.nvim_create_augroup('EventsGroup', {
  clear = true
})

vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  group = groupId,
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
  group = groupId,
  pattern = {'*.h', '*.c'},
  callback = function()
    vim.cmd [[
      setfiletype c
    ]]
  end,
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = groupId,
  pattern = {'*.pp'},
  callback = function()
    vim.cmd [[
      setfiletype json
    ]]
  end,
})

vim.api.nvim_create_autocmd({'BufEnter'}, {
  group = groupId,
  pattern = {'*'},
  callback = function()
    vim.cmd [[
      highlight OverLength ctermbg=15 guibg=#ffffff
    ]]
  end,
})

vim.api.nvim_create_autocmd({
  'BufEnter', 'BufWrite', 'TextChanged', 'TextChangedI',
  'InsertEnter', 'InsertLeave'
}, {
  group = groupId,
  pattern = {'*.go', '*.py', '*.rs', '*.h', '*.c', '*.cpp', '*.hpp'},
  callback = function()
    vim.cmd [[
      match OverLength /\%<82v.\%>81v/
    ]]
  end,
})

vim.api.nvim_create_autocmd({
  'BufEnter', 'BufWrite', 'TextChanged', 'TextChangedI',
  'InsertEnter', 'InsertLeave'
}, {
  group = groupId,
  pattern = {'*.java'},
  callback = function()
    vim.cmd [[
      match OverLength /\%<122v.\%>121v/
    ]]
  end,
})

vim.api.nvim_create_autocmd({
  'BufEnter', 'BufWrite', 'TextChanged', 'TextChangedI',
  'InsertEnter', 'InsertLeave'
}, {
  group = groupId,
  pattern = {'*'},
  callback = function()
    local n = #tostring(vim.fn.line('$')) + 2
    if n < 4 then n = 4 end
    vim.o.numberwidth = n
  end,
})
