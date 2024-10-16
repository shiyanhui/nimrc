local common  = require("core.common")

local function set_filetype(patterns, filetype)
  vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = common.augroup,
    pattern = patterns,
    callback = function()
      vim.cmd("setfiletype " .. filetype)
    end,
  })
end

set_filetype({"*.h", "*.c"}, "c")
set_filetype({"*.pp"}, "json")
set_filetype({"*.wxml"}, "xml")
set_filetype({"*.wxss"}, "css")
set_filetype({"*.swiftinterface"}, "swift")

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = common.augroup,
  pattern = {"*.py", "*.go"},
  callback = function()
    vim.cmd [[
    ]]
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = common.augroup,
  pattern = "copilot-*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "yes:1"
  end,
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  group = common.augroup,
  pattern = {"*"},
  callback = function()
    if vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd [[
        normal! g`"
      ]]
      return 1
    end
  end,
})

vim.cmd([[
  autocmd FileType c,cpp,java,python,go,swift,vue,javascript,html,css setlocal tabstop=4 shiftwidth=4 expandtab
]])
