local colors            = require('onenord.colors').load()
local selected          = colors.bg
local is_offsets_enable = false

local options           = {
  separator_style       = 'padded_slant',
  mode                  = 'buffers',
  left_trunc_marker     = '',
  right_trunc_marker    = '',
  modified_icon         = '',
  show_buffer_icons     = false,
  show_close_icon       = false,
  show_duplicate_prefix = false,
  truncate_names        = false,
  sort_by               = function(a, b)
    return a.name < b.name
  end
}

if (is_offset_nvimtree) then
  options.offsets = {{
    filetype   = 'NvimTree',
    text       = '',
    text_align = 'left',
    separator  = false
  }}
end

require('bufferline').setup {
  options = options,
  highlights = {
    background            = { bg = colors.active },
    buffer_selected       = { bg = selected },
    buffer_visible        = { bg = colors.active },
    close_button          = { bg = colors.active },
    close_button_visible  = { bg = colors.active },
    close_button_selected = { bg = selected },
    modified              = { bg = colors.active },
    modified_selected     = { bg = selected },
    modified_visible      = { bg = colors.active },
    separator             = { fg = colors.bg, bg = colors.active },
    separator_selected    = { fg = colors.bg, bg = selected },
    separator_visible     = { fg = colors.bg, bg = colors.active },
    trunc_marker          = { fg = colors.light_gray, bg = colors.bg },
  }
}
