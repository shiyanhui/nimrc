local common  = require("core.common")

require("codecompanion").setup({
  opts = {
    send_code = false,
  },
  strategies = {
    chat = {
      adapter = "copilot",
      roles = {
        llm = function(adapter)
          return adapter.formatted_name
        end,
        user = "User"
      }
    },
    inline = {
      adapter = "copilot",
      keymaps = {
        accept_change = {
          modes = { n = "ga" },
          description = "Accept the suggested change",
        },
        reject_change = {
          modes = { n = "gr" },
          description = "Reject the suggested change",
        },
      },
    },
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
      prompt = "Prompt ",
      provider = "telescope",
      opts = {
        show_default_actions = true,
        show_default_prompt_library = true,
      },
    },
    chat = {
      intro_message = "",
      show_references = true,
      show_settings = true,
      show_token_count = true,
      start_in_insert_mode = false,
      auto_scroll = false,
      window = {
        layout = "vertical",
        position = "right",
        width = 0.4,
      },
    },
    inline = {
      layout = "vertical",
    },
  }
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = common.augroup,
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "codecompanion" then
      vim.cmd [[
        set nonumber
        set norelativenumber
        set signcolumn=yes:1
        set fillchars=vert:▕
      ]]
    end
  end,
})

vim.keymap.set("n", "<Leader>t", ":CodeCompanionChat Toggle<CR>")
