local utils = require("core.utils")

local config = utils.read_config("Personal/deepseek/coding")
if not config then
  return
end

vim.env["MINUET_API_KEY"] = config.api_key

require("minuet").setup {
  provider = "openai_compatible",
  request_timeout = 3,
  n_completions = 1,
  throttle = 300,
  debounce = 300,
  virtualtext = {
    auto_trigger_ft = { "*" },
    auto_trigger_ignore_ft = {},
    keymap = {
      accept = nil,
      accept_line = nil,
      accept_n_lines = nil,
      next = nil,
      prev = nil,
      dismiss = nil
    },
    show_on_completion_menu = false,
  },
  provider_options = {
    openai_compatible = {
      api_key = "MINUET_API_KEY",
      end_point = config.url,
      model = config.model,
      optional = {
        max_tokens = 16382,
        top_p = 0.1,
        provider = {
          sort = "throughput",
        },
      },
    },
  },
}

vim.keymap.set("i", "<C-e>", function()
  local virtualtext = require("minuet.virtualtext")
  if virtualtext.action.is_visible() then
    virtualtext.action.accept()
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "i", true)
end, {noremap = true, silent = true})
