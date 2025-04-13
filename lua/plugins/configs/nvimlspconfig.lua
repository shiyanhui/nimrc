local icons = require("plugins.configs.common").icons

local setup_servers = function()
  local cmp = require("blink.cmp")

  local servers_opts = {
    -- npm i -g pyright
    pyright = {},
    -- brew install llvm
    clangd = {},
    -- go install golang.org/x/tools/gopls@latest
    gopls = {},
    -- npm install -g dockerfile-language-server-nodejs
    dockerls = {},
    -- brew install jdtls
    jdtls = {},
    -- npm i -g vscode-langservers-extracted
    eslint = {},
    -- npm i -g vscode-langservers-extracted
    jsonls = {},
    -- brew install rust-analyzer
    rust_analyzer = {},
    -- brew install lua-language-server
    lua_ls = {},
    -- npm install -g typescript-language-server typescript
    ts_ls = {},
  }
  local enabled_servers = {}
  for server, config in pairs(servers_opts) do
    config.capabilities = cmp.get_lsp_capabilities(config.capabilities)
    vim.lsp.config(server, config)
    table.insert(enabled_servers, server)
  end

  if #enabled_servers > 0 then
    vim.lsp.enable(enabled_servers)
  end
end

local setup_diagnostic = function()
  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.error,
        [vim.diagnostic.severity.WARN]  = icons.warn,
        [vim.diagnostic.severity.INFO]  = icons.info,
        [vim.diagnostic.severity.HINT]  = icons.hint,
      }
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = true,
  })

  vim.api.nvim_create_autocmd({ "CursorHold" }, {
    group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
    callback = function()
      -- see vim.diagnostic.Opts.Float
      local opts = {
        border = "rounded",
        focus = false,
        scope = "cursor",
        header = "",
        source = true,
        severity_sort = true,
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end

setup_servers()
setup_diagnostic()
