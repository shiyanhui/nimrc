local cmp = require('cmp')

cmp.setup({
  preselect = cmp.PreselectMode.None,
  formatting = {
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
      local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
      if icon then
        vim_item.kind = icon
        vim_item.kind_hl_group = hl_group
        return vim_item
      end
      return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.scroll_docs(-4),
    ['<C-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})

cmp.setup.cmdline(':', {
  sources = {
    { name = 'path' },
    { name = 'cmdline' }
  }
})
