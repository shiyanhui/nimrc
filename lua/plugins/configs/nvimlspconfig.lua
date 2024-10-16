local on_attach = function(_, bufnr)
  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
end

require("lspconfig")["sourcekit"].setup({
  on_attach = on_attach,
  single_file_support = true,
})

local signs = { Error = "❯❯", Warn = "❯❯", Hint = "❯❯", Info = "❯❯" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
