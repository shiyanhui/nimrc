local deepseek = require("plugins.configs.codecompanion.deepseek")

local M = {}

M.opts = {
  language = "Chinese",
  system_prompt = function(opts)
    return [[
      You are a universal assistant, and you should help the user complete the user's request.
    ]]
  end
}

M.prompt_library = {
  ["Generate Document"] = {
    strategy = "inline",
    description = "Generate document",
    opts = {
      index = 10,
      is_default = true,
      is_slash_cmd = true,
      short_name = "gendoc",
      auto_submit = true,
    },
    prompts = {
      {
        role = "user",
        content = [[
          给下面的代码生成详细的文档，包括总结、输入参数、返回值、使用示例等。
        ]],
        opts = {
          contains_code = true,
        },
      },
    },
  },
  ["Test workflow"] = {
    strategy = "workflow",
    description = "Use a workflow to repeatedly edit then test code",
    opts = {
      index = 5,
      short_name = "gentest",
    },
    prompts = {
      {
        {
          name = "Setup Test",
          role = "user",
          opts = { auto_submit = false },
          content = function()
            vim.g.codecompanion_auto_tool_mode = true
            return [[### Instructions
请你为@file写一个单元测试，针对每一个方法和类生成测试用例。确保测试用例覆盖了正常情况、边界情况和异常情况。

可以参考已有的单元测试，内容见
- @file

### 需要遵循的步骤

你需要严格按照以下步骤操作：

1. 使用 @editor 工具更新 #buffer{watch} 中的代码
2. 然后使用 @cmd_runner 工具运行测试suite，具体的测试命令是 xxxx（必须在代码更新后执行）
3. 确保在同一次响应中触发两个工具

我们将重复这个循环直到测试通过。必须严格遵循这些步骤。]]
          end,
        },
      },
      {
        {
          name = "Repeat On Failure",
          role = "user",
          opts = { auto_submit = true },
          condition = function()
            return _G.codecompanion_current_tool == "cmd_runner"
          end,
          repeat_until = function(chat)
            return chat.tool_flags.testing == true
          end,
          content = "测试失败了。请编辑当前缓冲区并重新运行测试套件？",
        },
      },
    },
  },
}

M.strategies = {
  inline = {
    adapter = "copilot_claude",
  },
  chat = {
    adapter = "copilot_claude",
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
}

M.adapters = {
  opts = {
    show_defaults = false,
  },
  copilot_claude = function()
    return require("codecompanion.adapters").extend("copilot", {
      schema = {
        model = {
          default = "gpt-4.1",
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
  deepseek_custom = function()
    return deepseek.adapt("Personal/deepseek/config")
  end,
}

M.display = {
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

return M
