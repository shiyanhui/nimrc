local opts = {
  exclude = {
    filetypes = { "help", "dashboard", "startify" },
  },
  indent = {
    char = "▏",
  },
  scope = {
    enabled = false,
  }
}

local M = {
  opts = opts,
}

return M
