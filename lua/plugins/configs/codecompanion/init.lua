local codecompanion = require("codecompanion")
local common        = require("core.common")
local opts          = require("plugins.configs.codecompanion.options")

require("codecompanion").setup(opts)

vim.api.nvim_create_autocmd("BufEnter", {
  group = common.augroup,
  pattern = "*",
  callback = function()
    vim.schedule(function()
      if vim.bo.filetype == "codecompanion" then
        vim.cmd [[
          set nonumber
          set norelativenumber
          set signcolumn=yes:1
          set fillchars=vert:▕
        ]]
      end
    end)
  end,
})

-- close NvimTree when open CodeCompanion
vim.keymap.set("n", "<Leader>t", function()
  -- local chat = codecompanion.last_chat()
  -- if not chat or not chat.ui:is_visible() then
    -- require("nvim-tree.view").close()
  -- end
  codecompanion.toggle()
end)

vim.keymap.set("n", "<Leader>ac", "<CMD>CodeCompanionActions<CR>")

vim.cmd [[
  cab cc CodeCompanion
]]
