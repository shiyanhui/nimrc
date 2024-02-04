require("plugins.lazy")

local plugins = {
  -- themes
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.configs.onenord")
    end,
  },

  -- efficiency
  { "neoclide/coc.nvim",              config = function() require('plugins.configs.coc') end, branch = "release" },
  { "junegunn/fzf",                   build  = ":call fzf#install()" },
  { "junegunn/fzf.vim",               config = function() require("plugins.configs.fzf") end },
  { "junegunn/vim-easy-align",        config = function() require("plugins.configs.easyalign") end },
  { "easymotion/vim-easymotion",      config = function() require("plugins.configs.easymotion") end },
  { "scrooloose/nerdcommenter",       config = function() require("plugins.configs.nerdcommenter") end },
  { "windwp/nvim-autopairs",          config = function() require("nvim-autopairs").setup() end },
  { "ntpeters/vim-better-whitespace", config = function() require("plugins.configs.whitespace") end },
  { "kylechui/nvim-surround",         config = function() require("nvim-surround").setup() end, version = "*", event = "VeryLazy" },
  { "github/copilot.vim",             config = function() require('plugins.configs.copilot') end },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
   },

  -- ui
  { "mhinz/vim-startify" },
  { "sindrets/diffview.nvim" },
  -- TODO:
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    -- tag = "nightly",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('plugins.configs.nvimtree')
    end,
  },
  { "lewis6991/gitsigns.nvim",         config = function() require("gitsigns").setup() end },
  { "hiphish/rainbow-delimiters.nvim", config = function() require("plugins.configs.rainbowdelimiters") end },
  { "akinsho/bufferline.nvim",         config = function() require("plugins.configs.bufferline") end, dependencies = { "nvim-tree/nvim-web-devicons" }, version = "*" },
  { "petertriho/nvim-scrollbar",       config = function() require("scrollbar").setup() end },
  { "nvim-lualine/lualine.nvim",       config = function() require("plugins.configs.lualine") end, dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-tree/nvim-web-devicons",     config = function() require("plugins.configs.nvimwebdevicons") end },
  { "nvim-treesitter/nvim-treesitter", config = function() require('plugins.configs.treesitter') end, build = ":TSUpdate" },
  { "f-person/git-blame.nvim",         config = function() require("plugins.configs.gitblame") end },
  { "shiyanhui/vista.vim",             config = function() require("plugins.configs.vista") end },
  { "folke/todo-comments.nvim",        config = function() require("todo-comments").setup() end, dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require('plugins.configs.whichkey') end
  },

  -- languages
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}

require("lazy").setup(plugins)
