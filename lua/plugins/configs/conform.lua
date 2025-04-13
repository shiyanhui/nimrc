require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "autoflake", "isort" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
  formatters = {
    autoflake = {
      command = "autoflake",
      args = {
        "--remove-all-unused-imports",
        "--in-place",
        "-",
      },
    },
    isort = {
      command = "isort",
      args = { "--profile", "black", "-" },
    }
  },
})

local format_go = function()
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  -- buf_request_sync defaults to a 1000ms timeout. Depending on your
  -- machine and codebase, you may want longer. Add an additional
  -- argument after params if you find that you have to write the file
  -- twice for changes to be saved.
  -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
  vim.lsp.buf.format({async = false})
end

vim.api.nvim_create_user_command("OI", function(args)
  if vim.bo.filetype == "go" then
    format_go()
    return
  end

  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end

  require("conform").format({
    async = true,
    lsp_format = "fallback",
    range = range
  })
end, { range = true })
