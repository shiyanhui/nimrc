local colors = require("plugins.configs.common").colorscheme.colors
local devicons = require("nvim-web-devicons")

devicons.setup({
  color_icons = true;
})

for filetype, icon in pairs(devicons.get_icons()) do
  -- icon.color = colors.blue
  devicons.set_icon({
    [filetype] = icon
  })
end
