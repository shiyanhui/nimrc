local ONENORD    = "onenord"
local ONEDARK    = "onedark"
local MONOKAIPRO = "monokai-pro"

local M = {
  sidebar_width = 35,
  colorscheme = {
    current = nil,
    colors = {},
  },
  icons = {
    hint = "",
    info = "",
    warn = "",
    error = "󰅙",
  }
}

-- Get the current colorscheme
M.colorscheme.get_name = function()
  if M.colorscheme.current == nil then
    local name = nil
    if pcall(require, ONENORD) then
      name = ONENORD
    elseif pcall(require, ONEDARK) then
      name = ONEDARK
    elseif pcall(require, MONOKAIPRO) then
      name = MONOKAIPRO
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

M.colorscheme.is_monokai_pro = function()
  return M.colorscheme.get_name() == MONOKAIPRO
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
    dark_gray = colors.gray,
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
    dark_gray = colors.grey
  }
elseif M.colorscheme.is_monokai_pro() then
  local colors = require("monokai-pro.colorscheme.palette.machine")

  M.colorscheme.colors = {
    dark = colors.dark2,
    black = colors.dark1,
    red = colors.accent1,
    green = colors.accent4,
    yellow = colors.accent3,
    blue = colors.accent2,
    purple = colors.accent6,
    cyan = colors.accent5,
    white = colors.text,
    gray = colors.dimmed3,
    orange = colors.accent2,
    fg = colors.text,
    bg = colors.background,
    light_bg = colors.dimmed5,
    light_gray = colors.dimmed4,
    dark_red = colors.accent1,
    dark_gray = colors.dimmed2,
  }
end

return M
