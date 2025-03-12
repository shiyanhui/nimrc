local M = {}

M.opts = {
  keymap = {
    preset = 'none',
    ['<Tab>'] = { 'select_next', 'fallback_to_mappings' },
    ['<S-Tab>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-k>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
  },
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    menu = {
      draw = {
        padding = 1,
        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'source_name' } },
      }
    }
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = 'mono'
  },
  sources = {
    per_filetype = {
      codecompanion = { "codecompanion" },
    },
    default = {}
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
}

M.opts_extend = { "sources.default" }

return M
