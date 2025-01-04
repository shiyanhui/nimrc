local dap = require("dap")
local dapui = require("dapui")
local gitblame = require("gitblame")

dapui.setup({
  layouts = {
    {
      elements = {
        {
          id = "breakpoints",
          size = 0.2
        },
        {
          id = "scopes",
          size = 0.5
        },
        {
          id = "stacks",
          size = 0.3
        },
      },
      position = "right",
      size = 40
    },
  },
  mappings = {
    expand = "o",
    open = "<CR>",
  },
})

local is_open = false

local open = function()
  dapui.open({ reset = true })
  is_open = true
  vim.cmd [[
    GitBlameDisable
  ]]
end

local close = function()
  dapui.close()
  is_open = false
  vim.cmd [[
    GitBlameEnable
  ]]
end

dap.listeners.before.attach.dapui_config = function()
  open()
end
dap.listeners.before.launch.dapui_config = function()
  open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  close()
end
dap.listeners.before.event_exited.dapui_config = function()
  close()
end

vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    if is_open then
      open()
    end
  end
})
