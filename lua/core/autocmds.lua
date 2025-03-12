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

vim.api.nvim_create_autocmd("BufNewFile", {
  group = common.augroup,
  pattern = {"*"},
  callback = function()
    if vim.bo.filetype ~= "nofile" then
      vim.bo.winborder = "rounded"
    end
  end,
})

vim.cmd([[
  cab <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'vert h' : 'h'
  autocmd FileType c,cpp,java,python,go setlocal tabstop=4 shiftwidth=4 expandtab
]])
