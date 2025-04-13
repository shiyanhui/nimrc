local lazy_opts = require("plugins.lazy")

local plugins = {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function() require("plugins.configs.monokaipro") end,
  },

  -- efficiency
  { "ibhagwan/fzf-lua",               config = function() require("plugins.configs.fzf") end, dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "junegunn/vim-easy-align",        config = function() require("plugins.configs.easyalign") end },
  { "easymotion/vim-easymotion",      config = function() require("plugins.configs.easymotion") end },
  { "scrooloose/nerdcommenter",       config = function() require("plugins.configs.nerdcommenter") end },
  { "ntpeters/vim-better-whitespace", config = function() require("plugins.configs.betterwhitespace") end },
  { "ethanholz/nvim-lastplace",       config = function() require("plugins.configs.nvimlastplace") end },
  { "windwp/nvim-autopairs",          config = function() require("nvim-autopairs").setup() end },
  { "kylechui/nvim-surround",         config = function() require("nvim-surround").setup() end, version = "*", event = "VeryLazy" },
  { "neovim/nvim-lspconfig",          config = function() require("plugins.configs.nvimlspconfig") end, dependencies = { "saghen/blink.cmp" } },
  { "stevearc/conform.nvim",          config = function() require("plugins.configs.conform") end },
  {
    "saghen/blink.cmp",
    config = function() require("plugins.configs.blink") end,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    version = "*",
  },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  {
    "coffebar/transfer.nvim",
    lazy = true,
    cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
    opts = require("plugins.configs.transfer"),
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      require("claudecode").setup()
    end,
  },

  -- ui
  { "mhinz/vim-startify",                  config = function() require("plugins.configs.vimstartify") end },
  { "nvim-tree/nvim-web-devicons",         config = function() require("plugins.configs.nvimwebdevicons") end },
  { "nvim-treesitter/nvim-treesitter",     config = function() require("plugins.configs.treesitter") end, build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim",           config = function() require("plugins.configs.lualine") end, dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "akinsho/bufferline.nvim",             config = function() require("plugins.configs.bufferline") end, dependencies = { "nvim-tree/nvim-web-devicons" }, branch = "main" },
  { "Bekaboo/dropbar.nvim",                config = function() require("plugins.configs.dropbar") end },
  { "f-person/git-blame.nvim",             config = function() require("plugins.configs.gitblame") end },
  { "hiphish/rainbow-delimiters.nvim",     config = function() require("plugins.configs.rainbowdelimiters") end },
  { "RRethy/vim-illuminate",               config = function() require("plugins.configs.illuminate") end },
  { "petertriho/nvim-scrollbar",           config = function() require("plugins.configs.scrollbar") end },
  { "lewis6991/gitsigns.nvim",             config = function() require("plugins.configs.gitsigns") end },
  { "folke/todo-comments.nvim",            config = function() require("todo-comments").setup() end, dependencies = { "nvim-lua/plenary.nvim" } },
  { "lukas-reineke/indent-blankline.nvim", opts = require("plugins.configs.indentblankline").opts, main = "ibl" },
  { "ecthelionvi/NeoColumn.nvim",          opts = require("plugins.configs.neocolumn").opts },
  { "folke/which-key.nvim",                opts = { delay = 1000 }, event = "VeryLazy"  },
  { "sindrets/diffview.nvim",              cmd = { "DiffviewFileHistory" } },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.configs.nvimtree") end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function() require("plugins.configs.noice") end,
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
}

require("lazy").setup(plugins, lazy_opts)
