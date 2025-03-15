local colors = require("plugins.configs.common").colorscheme.colors

require("render-markdown").setup({
  file_types = { "markdown", "codecompanion" },
  indent = {
    enabled = false,
    render_modes = false,
    per_level = 2,
    skip_level = 1,
    skip_heading = false,
    icon = '▏',
    highlight = 'RenderMarkdownIndent',
  },
})

vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = colors.cyan, bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = colors.purple, bold = true })

vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = colors.cyan, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = colors.purple, bold = true })
