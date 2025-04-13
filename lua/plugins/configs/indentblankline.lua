local opts = {
  exclude = {
    filetypes = { "help", "dashboard", "startify", "markdown" },
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
