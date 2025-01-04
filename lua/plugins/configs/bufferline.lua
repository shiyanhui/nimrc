local colorscheme       = require("plugins.configs.common").colorscheme
local colors            = colorscheme.colors
local is_offsets_enable = false

local options           = {
  separator_style       = "padded_slant",
  mode                  = "buffers",
  left_trunc_marker     = '',
  right_trunc_marker    = '',
  modified_icon         = '',
  show_buffer_icons     = false,
  show_close_icon       = false,
  show_duplicate_prefix = false,
  truncate_names        = false,
  sort_by               = function(a, b)
    return a.name < b.name
  end,
}

if (is_offsets_enable) then
 options.offsets = {{
   filetype   = 'NvimTree',
   text       = '',
   text_align = 'left',
   separator  = false
 }}
end

local highlights = {}
if colorscheme.is_onenord() then
  highlights = {
    fill                  = { bg = colors.bg },
    background            = { bg = colors.light_bg },
    buffer_selected       = { bg = colors.bg },
    buffer_visible        = { bg = colors.light_bg },
    close_button          = { bg = colors.light_bg },
    close_button_visible  = { bg = colors.light_bg },
    close_button_selected = { bg = colors.bg },
    modified              = { bg = colors.light_bg },
    modified_selected     = { bg = colors.bg },
    modified_visible      = { bg = colors.light_bg },
    separator             = { fg = colors.bg, bg = colors.light_bg },
    separator_selected    = { fg = colors.bg, bg = colors.bg },
    separator_visible     = { fg = colors.bg, bg = colors.light_bg },
    trunc_marker          = { fg = colors.light_gray, bg = colors.bg },
  }
end

require('bufferline').setup({
  options = options,
  highlights = highlights,
})
