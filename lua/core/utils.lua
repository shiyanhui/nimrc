local M = {}

-- 30 days
local expire_duration = 30 * 24 * 3600

M.ensure_dir_exists = function(file_path)
  local dir = file_path:match("(.*[/\\])")
  if dir then
    local cmd = string.format("mkdir -p %s", dir)
    return os.execute(cmd)
  end
  return true
end

M.read_config = function(onepassword_path)
  local cache_file_path = vim.fn.stdpath("cache") .. "/nimrc/" .. onepassword_path

  local use_cache = false
  if vim.fn.filereadable(cache_file_path) == 1 then
    local stat = vim.loop.fs_stat(cache_file_path)
    if stat then
      use_cache = os.time() - stat.mtime.sec < expire_duration
    end
  end

  -- reading config from cache file
  if use_cache then
    local cache_content = vim.fn.readfile(cache_file_path)
    if #cache_content > 0 then
      local cache_str = table.concat(cache_content, "\n")
      local ok, config = pcall(vim.json.decode, cache_str, { luanil = { object = true } })
      if ok then
        return config
      end
    end
  end

  -- reading config from 1password
  local raw_config = vim.fn.system("op read op://" .. onepassword_path .. " --no-newline")
  local ok, config = pcall(vim.json.decode, raw_config, { luanil = { object = true } })
  if not ok then
    return nil
  end

  -- saving to cache file
  if not M.ensure_dir_exists(cache_file_path) then
    return nil
  end

  local file = io.open(cache_file_path, "w")
  if file then
    file:write(raw_config)
    file:close()
  end

  return config
end

return M
