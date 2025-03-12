local blacklist = {
  NvimTree = true,
  codecompanion = true,
  CopilotChat = true,
  startify = true,
  help = true,
  [""] = true
}

require("dropbar").setup({
  bar = {
    enable = function(buf, win, _)
      if
        not vim.api.nvim_buf_is_valid(buf)
        or blacklist[vim.bo[buf].ft]
        or not vim.api.nvim_win_is_valid(win)
        or vim.fn.win_gettype(win) ~= ""
        or vim.wo[win].winbar ~= ""
      then
        return false
      end

      local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
      if stat and stat.size > 1024 * 1024 then
        return false
      end

      return true
    end,
    -- only keep the path
    sources = function(buf, _)
      local sources = require("dropbar.sources")
      return {
        sources.path,
      }
    end,
  },
  icons = {
    ui = {
      bar = {
        separator = " > ",
      },
    },
    kinds = {
      -- hide the directory icon
      dir_icon = function()
        return "", ""
      end,
      -- hide the file icon
      file_icon = function()
        return "", ""
      end
    },
  },
})
