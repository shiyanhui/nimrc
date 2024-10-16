local MONOKAI_PRO = "monokai-pro"
local ONENORD     = "onenord"

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
    if pcall(require, "monokai-pro") then
      name = MONOKAI_PRO
    elseif pcall(require, "onenord") then
      name = ONENORD
    end
    M.colorscheme.current = name
  end

  return M.colorscheme.current
end

M.colorscheme.is_monokai_pro = function()
  return M.colorscheme.get_name() == MONOKAI_PRO
end

M.colorscheme.is_onenord = function()
  return M.colorscheme.get_name() == ONENORD
end

-- Set the colorscheme.colors table based on the current colorscheme
if M.colorscheme.is_monokai_pro() then
  local p = require("monokai-pro.colorscheme.palette.machine")

  M.colorscheme.colors = {
    dark = p.dark2,
    black = p.dark1,
    red = p.accent1,
    green = p.accent4,
    yellow = p.accent3,
    -- blue = p.accent5,
    blue = "#8094b4",
    purple = p.accent6,
    cyan = p.accent5,
    white = p.text,
    gray = p.dimmed3,
    orange = p.accent2,
    fg = p.text,
    bg = p.background,
    light_bg = "#1d272c",
    light_gray = p.dimmed5,
  }
elseif M.colorscheme.is_onenord() then
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
  }
end

return M
