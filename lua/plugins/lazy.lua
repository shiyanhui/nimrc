local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set the quit key to <Esc>
require("lazy.view.config").keys.close = "<Esc>"

return {
  colorscheme = { "onenord" },
  ui = {
    size = { width = 0.66, height = 0.7 },
    border = "rounded",
  }
}
