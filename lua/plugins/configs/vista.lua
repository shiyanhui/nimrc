local common = require("plugins.configs.common")
local colors = require("plugins.configs.common").colorscheme.colors

vim.g.vista_blink                        = {0, 0}
vim.g.vista_cursor_delay                 = 100
vim.g.vista_default_executive            = 'ctags'
vim.g.vista_disable_statusline           = true
vim.g.vista_echo_cursor_strategy         = 'floating_win'
vim.g.vista_floating_border              = 'rounded'
vim.g.vista_fold_toggle_icons            = {'', ''}
vim.g.vista_preview_after_current_lines  = 15
vim.g.vista_preview_before_current_lines = 5
vim.g.vista_sidebar_width                = common.sidebar_width
vim.g.vista_stay_on_open                 = false
vim.g.vista_top_level_blink              = {0, 0}
vim.g.vista_update_on_text_changed       = true
vim.g.vista_update_on_text_changed_delay = 100

vim.api.nvim_set_hl(0, 'VistaPublic',    { link = 'GitSignsAdd' })
vim.api.nvim_set_hl(0, 'VistaProtected', { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'VistaPrivate',   { link = 'GitSignsDelete' })
vim.api.nvim_set_hl(0, 'VistaTag',       { link = 'Function' })
vim.api.nvim_set_hl(0, 'VistaNormal',    { link = 'Normal' })
vim.api.nvim_set_hl(0, 'VistaNormal',    { bg = colors.dark })
vim.api.nvim_set_hl(0, 'VistaFloat',     { bg = colors.bg })

vim.api.nvim_create_autocmd({'FileType'}, {
  group = common.augroup,
  pattern = {'vista'},
  callback = function()
    vim.cmd [[
      set winhighlight=Normal:VistaNormal
    ]]
  end,
})

vim.api.nvim_create_autocmd({
  'BufEnter', 'BufWrite', 'TextChanged', 'TextChangedI',
  'InsertEnter', 'InsertLeave'
}, {
  group = common.augroup,
  pattern = {'*'},
  callback = function()
    local n = #tostring(vim.fn.line('$')) + 1
    if n < 3 then n = 3 end
    vim.o.numberwidth = n
  end,
})

vim.keymap.set('n', '<Leader>t', ':Vista!!<CR>')
