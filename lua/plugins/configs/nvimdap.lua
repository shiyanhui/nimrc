local colors = require("plugins.configs.common").colorscheme.colors
local dap = require("dap")

vim.api.nvim_set_hl(0, "DapBreakpointColumn", { fg = colors.red })
vim.api.nvim_set_hl(0, "DapStoppedColumn", { fg = colors.green })
vim.api.nvim_set_hl(0, "DapBreakpointRejectedColumn", { fg = colors.dark_red })

vim.fn.sign_define("DapBreakpoint", {text="", texthl="DapBreakpointColumn", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text="➜", texthl="DapStoppedColumn", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointRejected", {text="", texthl="DapBreakpointRejectedColumn", linehl="", numhl=""})

vim.api.nvim_set_keymap("n", "<Leader>ds", ":DapNew<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>db", ":DapToggleBreakpoint<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>dr", ":DapToggleRepl<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>dn", ":DapStepOver<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>di", ":DapStepInto<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>dc", ":DapContinue<CR>", {silent = true})

dap.adapters.gdb = {
  type = "executable",
  command = "/home/linuxbrew/.linuxbrew/bin/gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = "${workspaceFolder}/version_manager/vm_srv",
    args = {},
    stopAtEntry = true,
    stopOnEntry = true,
    cwd = "${workspaceFolder}",
    environment = {
      MALLOC_CONF = "background_thread:true,dirty_decay_ms:10000,muzzy_decay_ms:10000",
      VM_REGION = "dev"
    },
    externalConsole = false,
    MIMode = "gdb",
    miDebuggerPath = "/home/linuxbrew/.linuxbrew/bin/gdb",
    logging = {
      engineLogging = true,
      programOutput = true,
      exceptions = true,
    },
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        ignoreFailures = false
      },
      {
        text = "-exec \"catch throw\"",
        ignoreFailures = false
      }
    },
  },
  {
    name = "Attach",
    type = "gdb",
    request = "attach",
    program = "${workspaceFolder}/version_manager/vm_srv",
    args = {},
    pid = "1",
    cwd = "${workspaceFolder}",
    MIMode = "gdb",
    miDebuggerPath = "/home/linuxbrew/.linuxbrew/bin/gdb",
    logging = {
      engineLogging = true,
      programOutput = true,
      exceptions = true,
    }
  },
}

dap.configurations.cpp = dap.configurations.c
