local lazy_opts = require("plugins.lazy")

local plugins = {
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.configs.onenord")
    end,
  },
  -- {
    -- "navarasu/onedark.nvim",
    -- config = function()
      -- require('onedark').setup {
          -- style = 'dark'
      -- }
      -- require('onedark').load()
    -- end,
  -- },

  -- efficiency
  { "junegunn/fzf",                   build  = ":call fzf#install()" },
  { "junegunn/fzf.vim",               config = function() require("plugins.configs.fzf") end },
  { "junegunn/vim-easy-align",        config = function() require("plugins.configs.easyalign") end },
  -- We load copilot before coc because we want to override copilot's tab completion.
  { "neoclide/coc.nvim",              config = function() require('plugins.configs.coc') end, branch = "master", build = "npm ci", lazy = false, priority = 100},
  { "github/copilot.vim",             config = function() require('plugins.configs.copilot') end, lazy = false, priority = 200},
  { "easymotion/vim-easymotion",      config = function() require("plugins.configs.easymotion") end },
  { "scrooloose/nerdcommenter",       config = function() require("plugins.configs.nerdcommenter") end },
  { "ntpeters/vim-better-whitespace", config = function() require("plugins.configs.whitespace") end },
  { "ethanholz/nvim-lastplace",       config = function() require("plugins.configs.nvimlastplace") end },
  { "windwp/nvim-autopairs",          config = function() require("nvim-autopairs").setup() end },
  { "kylechui/nvim-surround",         config = function() require("nvim-surround").setup() end, version = "*", event = "VeryLazy" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = require("plugins.configs.copilotchat").opts,
  },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  },
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("xcodebuild").setup()
    end,
  },

  -- ui
  { "mhinz/vim-startify",              config = function() require("plugins.configs.vimstartify") end },
  { "nvim-tree/nvim-web-devicons",     config = function() require("plugins.configs.nvimwebdevicons") end },
  { "nvim-treesitter/nvim-treesitter", config = function() require('plugins.configs.treesitter') end, build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim",       config = function() require("plugins.configs.lualine") end, dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "akinsho/bufferline.nvim",         config = function() require("plugins.configs.bufferline") end, dependencies = { "nvim-tree/nvim-web-devicons" }, branch = "main" },
  { "f-person/git-blame.nvim",         config = function() require("plugins.configs.gitblame") end },
  { "hiphish/rainbow-delimiters.nvim", config = function() require("plugins.configs.rainbowdelimiters") end },
  { "shiyanhui/vista.vim",             config = function() require("plugins.configs.vista") end },
  { "lewis6991/satellite.nvim",        config = function() require("plugins.configs.satellite") end },
  { "lewis6991/gitsigns.nvim",         config = function() require("gitsigns").setup() end },
  { "folke/todo-comments.nvim",        config = function() require("todo-comments").setup() end, dependencies = { "nvim-lua/plenary.nvim" } },
  { "ecthelionvi/NeoColumn.nvim",      opts = require("plugins.configs.neocolumn").opts },
  { "sindrets/diffview.nvim",          cmd = {"DiffviewFileHistory"} },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.configs.nvimtree")
    end,
  },

  -- languages
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}

require("lazy").setup(plugins, lazy_opts)
