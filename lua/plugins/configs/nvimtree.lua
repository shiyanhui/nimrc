local common = require("plugins.configs.common")
local colorscheme = common.colorscheme

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors    = true

vim.keymap.set("n", "<Leader><Tab>", ":NvimTreeToggle<CR>")

-- 判断filetype是否有效
local is_filetype_valid = function(filetype)
  local invalid = (
    filetype == "" or
    filetype:match("NvimTree") ~= nil or
    filetype:match("dapui_") ~= nil or
    filetype:match("dap-") ~= nil
  )
  return not invalid
end

-- 通过window获取buffer的filetype
local get_filetype_by_win = function(win)
  return vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "filetype")
end

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()

    for _, w in ipairs(wins) do
      local filetype = get_filetype_by_win(w)
      if not is_filetype_valid(filetype) then
        table.insert(invalid_win, w)
      end
    end

    local curr_filetype = get_filetype_by_win(vim.api.nvim_get_current_win())
    if #invalid_win == #wins - 1 and is_filetype_valid(curr_filetype) then
      for _, w in ipairs(invalid_win) do
        if #vim.api.nvim_list_wins() > 1 then
          vim.api.nvim_win_close(w, true)
        end
      end

      -- 关闭dapui和dap
      if require("dap").status() ~= "" then
        require("dapui").close()
        require("dap").terminate({
          all = true
        })
      end
    end
  end
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    width = common.sidebar_width,
  },
  renderer = {
    root_folder_label = false,
    group_empty = true,
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      }
    },
  },
  filters = {
    dotfiles = true
  },
})

if colorscheme.is_onedark() then
  vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = colorscheme.colors.blue })
end
