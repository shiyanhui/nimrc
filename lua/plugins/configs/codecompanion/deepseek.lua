local utils = require("core.utils")

local M = {}

M.adapt = function(onepassword_config_path)
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
        choices = {
          [config.model] = {}
        }
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
        local adapters = require("codecompanion.utils.adapters")

        local output = {}
        if data and data ~= "" then
          local data_mod = adapters.clean_streamed_data(data)
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

return M
