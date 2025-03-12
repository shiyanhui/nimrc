local codecompanion = require("codecompanion")
local common        = require("core.common")
local utils         = require("core.utils")

local deepseek_adapter = function(onepassword_config_path)
  -- one request and response session
  local session_id = nil

  local config = utils.read_config(onepassword_config_path)
  if not config then
    return
  end

  return require("codecompanion.adapters").extend("deepseek", {
    env = {
      api_key = config.api_key,
    },
    url = config.url,
    schema = {
      model = {
        default = config.model,
      },
      max_tokens = {
        default = 16384,
      },
      top_p = {
        default = 0.3
      },
    },
    handlers = {
      chat_output = function(self, data)
        local utils = require("codecompanion.utils.adapters")

        local output = {}
        if data and data ~= "" then
          local data_mod = utils.clean_streamed_data(data)
          local ok, json = pcall(vim.json.decode, data_mod, { luanil = { object = true } })

          if ok and json.choices and #json.choices > 0 then
            local choice = json.choices[1]
            local delta = (self.opts and self.opts.stream) and choice.delta or choice.message

            -- for every new session, add a newline
            local prefix = ""
            if session_id ~= delta.id then
              prefix = "\n\n"
            end
            session_id = delta.id

            if delta then
              output.role = nil
              if delta.role then
                output.role = delta.role
              end

              if delta.reasoning_content then
                output.reasoning = prefix .. delta.reasoning_content
              elseif delta.content then
                if delta.content == "\n\n" then
                  delta.content = ""
                end
                output.content = prefix .. delta.content
              end

              return {
                status = "success",
                output = output,
              }
            end
          end
        end
      end,
    }
  })
end

require("codecompanion").setup({
  opts = {
    language = "Chinese"
  },
  strategies = {
    chat = {
      adapter = "deepseek_custom",
      roles = {
        llm = function(adapter)
          return adapter.formatted_name
        end,
        user = "User"
      },
      keymaps = {
        clear = {
          modes = {
            n = "<C-l>",
          },
        },
      },
      slash_commands = {
        ["buffer"] = {
          opts = {
            provider = "fzf_lua",
          },
        },
        ["file"] = {
          opts = {
            max_lines = 100000,
            provider = "fzf_lua",
          },
        },
        ["help"] = {
          opts = {
            provider = "fzf_lua",
          },
        },
        ["symbols"] = {
          opts = {
            provider = "fzf_lua",
          },
        },
      }
    },
    inline = {
      adapter = "deepseek_custom",
    },
  },
  adapters = {
    opts = {
      show_defaults = false,
    },
    copilot_claude37 = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            -- 1: claude-3.5-sonnet (copilot)
            -- 2: claude-3.7-sonnet (copilot)
            -- 3: claude-3.7-sonnet-thought (copilot)
            -- 4: gemini-2.0-flash-001 (copilot)
            -- 5: gpt-3.5-turbo (copilot)
            -- 6: gpt-4 (copilot)
            -- 7: * gpt-4o (copilot)
            -- 8: gpt-4o-2024-08-06 (copilot)
            -- 9: gpt-4o-2024-11-20 (copilot)
            -- 10: gpt-4o-mini (copilot)
            -- 11: o1 (copilot)
            -- 12: o3-mini (copilot)
            -- 13: o3-mini-paygo (copilot)
            default = "claude-3.7-sonnet",
          },
        },
      })
    end,
    deepseek = function()
      return require("codecompanion.adapters").extend("deepseek", {
        env = {
          -- read the API key from 1Password
          api_key = "cmd: op read op://Personal/deepseek/apikey --no-newline",
        },
        schema = {
          max_tokens = {
            default = 8192,
          }
        }
      })
    end,
    deepseek_research = function()
      return deepseek_adapter("Personal/deepseek/deep_research")
    end,
    deepseek_custom = function()
      return deepseek_adapter("Personal/deepseek/config")
    end,
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
      prompt = "Prompt: ",
      provider = "default",
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
        width = 0.5,
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
  local chat = codecompanion.last_chat()
  if not chat or not chat.ui:is_visible() then
    require("nvim-tree.view").close()
  end
  codecompanion.toggle()
end)

vim.cmd(
  [[cab cc CodeCompanion]]
)
