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

-- Quit all windows if the current window is not a tool window
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local is_tool_filetype = function(filetype)
      local tools_filetypes = {
        "",
        "codecompanion",
        "help",
        "man",
        "NvimTree",
        "trouble",
      }
      for _, item in ipairs(tools_filetypes) do
        if item:match(filetype) then
          return true
        end
      end
      return false
    end

    local get_filetype_by_win = function(win)
      return vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "filetype")
    end

    local curr_win = vim.api.nvim_get_current_win()
    local curr_win_filetype = get_filetype_by_win(curr_win)
    if is_tool_filetype(curr_win_filetype) and vim.fn.winnr('$') > 1 then
      vim.api.nvim_win_close(curr_win, true)
      return
    end

    vim.cmd [[
      :qa!
    ]]
  end
})

vim.cmd([[
  cab <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'vert h' : 'h'
  autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab
]])
