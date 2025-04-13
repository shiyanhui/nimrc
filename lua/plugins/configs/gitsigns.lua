require("gitsigns").setup({
  watch_gitdir = {
    interval = 1000,  -- 检查间隔（毫秒）
    follow_files = true
  }
})
