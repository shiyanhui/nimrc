require('dropbar').setup({
  bar = {
    sources = function(buf, _)
      local sources = require('dropbar.sources')
      return {
        sources.path,
      }
    end,
  },
  icons = {
    kinds = {
      dir_icon = function()
        return '', ''
      end,
    },
  },
})
