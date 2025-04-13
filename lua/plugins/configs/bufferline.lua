local common = require("plugins.configs.common")

local colorscheme       = common.colorscheme
local colors            = colorscheme.colors
local icons             = common.icons
local is_offsets_enable = true

local options             = {
  separator_style         = "slant",
  mode                    = "buffers",
  left_trunc_marker       = "",
  right_trunc_marker      = "",
  modified_icon           = "",
  buffer_close_icon       = "",
  left_mouse_command      = nil,
  right_mouse_command     = nil,
  middle_mouse_command    = nil,
  show_buffer_icons       = true,
  show_buffer_close_icons = true,
  show_close_icon         = false,
  show_duplicate_prefix   = false,
  truncate_names          = false,
  diagnostics             = "nvim_lsp",
  diagnostics_indicator   = function(count, level, diagnostics_dict, context)
    -- count for each type of diagnostics
    local error_count = diagnostics_dict.error or 0
    local warning_count = diagnostics_dict.warning or 0
    local info_count = diagnostics_dict.info or 0
    local hint_count = diagnostics_dict.hint or 0

    local parts = {
      error_count > 0 and icons.error .. " " .. error_count or "",
      warning_count > 0 and icons.warn .. " " .. warning_count or "",
      info_count > 0 and icons.info .. " " .. info_count or "",
      hint_count > 0 and icons.hint .. " " .. hint_count or "",
    }
    -- filter empty values
    local filtered_parts = {}
    for _, v in ipairs(parts) do
      if v ~= "" then
        table.insert(filtered_parts, v)
      end
    end
    return table.concat(filtered_parts, " ")
  end,
  custom_filter = function(buf, buf_nums)
    return vim.bo[buf].filetype ~= "codecompanion"
  end,
  sort_by = function(a, b)
    return a.name < b.name
  end,
}

if (is_offsets_enable) then
 options.offsets = {{
   filetype   = "NvimTree",
   text       = "",
   text_align = "left",
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
elseif colorscheme.is_onedark() then
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
elseif colorscheme.is_monokai_pro() then
  highlights = {
    trunc_marker = { bg = colors.bg },
  }
end

require("bufferline").setup({
  options = options,
  highlights = highlights,
})
