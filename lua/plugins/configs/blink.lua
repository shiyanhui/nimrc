local blink    = require("blink-cmp")
local lspkind  = require("lspkind")
local devicons = require("nvim-web-devicons")
local colors   = require("plugins.configs.common").colorscheme.colors
local winblend = 10

local opts = {
  sources = {
    default = { "lsp", "path", "buffer" },
    per_filetype = {
      codecompanion = {
        "codecompanion"
      },
    },
    transform_items = function(_, items)
      items = vim.tbl_filter(function(item)
        return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
      end, items)
      table.sort(items, function(a, b)
        return a.label < b.label
      end)
      return items
    end,
  },
  completion = {
    menu = {
      winblend = winblend,
      border = "rounded",
      draw = {
        treesitter = {
          "lsp"
        },
        align_to = "none",
        components = {
          kind_icon = {
            text = function(ctx)
              local icon = ctx.kind_icon
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, _ = devicons.get_icon(ctx.label)
                if dev_icon then
                    icon = dev_icon
                end
              else
                icon = lspkind.symbolic(ctx.kind, {
                  mode = "symbol",
                })
              end
              return icon .. ctx.icon_gap
            end,
            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, dev_hl = devicons.get_icon(ctx.label)
                if dev_icon then
                  hl = dev_hl
                end
              end
              return hl
            end,
          }
        },
        columns = {
          { "kind_icon" },
          { "label" },
          { "kind"},
          { "source_name" }
        },
      },
    },
    list = {
      selection = {
        preselect = false,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 50,
      window = {
        winblend = winblend,
        border = "rounded"
      }
    },
    trigger = {
      prefetch_on_insert = false
    },
    accept = {
      dot_repeat = false,
    }
  },
  keymap = {
    preset = "none",
    ["<Tab>"] = {
      "select_next",
      "fallback",
    },
    ["<S-Tab>"] = {
      "select_prev",
      "fallback",
    },
    ["<CR>"] = {
      function()
        if blink.is_visible() and vim.bo.filetype == "codecompanion" then
          blink.select_and_accept()
          return true
        end
      end,
      "fallback"
    }
  },
  signature = {
    enabled = true,
    window = {
      winblend = winblend,
    }
  },
  cmdline = {
    enabled = true,
    keymap = {
      preset = "none",
      ["<Tab>"] = {
        "insert_next",
        "fallback",
      },
      ["<S-Tab>"] = {
        "insert_prev",
        "fallback",
      },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false
        },
      },
      menu = {
        auto_show = true
      },
    },
  }
}

blink.setup(opts)

vim.api.nvim_set_hl(0, "BlinkCmpMenu",         { fg = colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpDoc",          { fg = colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder",   { fg = colors.cyan })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder",    { fg = colors.cyan })
vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = colors.cyan })
