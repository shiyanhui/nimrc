local ONENORD = "onenord"
local ONEDARK = "onedark"

local M = {
  sidebar_width = 40,
  colorscheme = {
    current = nil,
    colors = {},
  },
}

-- Get the current colorscheme
M.colorscheme.get_name = function()
  if M.colorscheme.current == nil then
    local name = nil
    if pcall(require, ONENORD) then
      name = ONENORD
    elseif pcall(require, ONEDARK) then
      name = ONEDARK
    end
    M.colorscheme.current = name
  end

  return M.colorscheme.current
end

M.colorscheme.is_onenord = function()
  return M.colorscheme.get_name() == ONENORD
end

M.colorscheme.is_onedark = function()
  return M.colorscheme.get_name() == ONEDARK
end

-- Set the colorscheme.colors table based on the current colorscheme
if M.colorscheme.is_onenord() then
  local colors = require("onenord.colors").load()

  M.colorscheme.colors = {
    dark = "#2A2F3A",
    black = colors.bg,
    red = colors.dark_red,
    green = colors.green,
    yellow = colors.yellow,
    blue = colors.blue,
    purple = colors.purple,
    cyan = colors.cyan,
    white = colors.fg,
    gray = colors.gray,
    orange = colors.orange,
    fg = colors.fg,
    bg = colors.bg,
    light_bg = colors.active,
    light_gray = colors.light_gray,
    dark_red = colors.dark_red,
  }
elseif M.colorscheme.is_onedark() then
  local colors = require("onedark.palette").dark

  M.colorscheme.colors = {
    dark = colors.black,
    black = colors.black,
    red = colors.red,
    green = colors.green,
    yellow = colors.yellow,
    blue = colors.blue,
    purple = colors.purple,
    cyan = colors.cyan,
    white = colors.fg,
    gray = colors.grey,
    orange = colors.orange,
    fg = colors.fg,
    bg = colors.bg0,
    light_bg = colors.bg_d,
    light_gray = colors.grey,
    dark_red = colors.dark_red,
  }
end

return M
