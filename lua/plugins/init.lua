local lazy_opts = require("plugins.lazy")

local plugins = {
  {
    "loctvl842/monokai-pro.nvim",
     lazy = false,
     priority = 1000,
     config = function() require("plugins.configs.monokaipro") end,
   },

  -- efficiency
  { "junegunn/fzf",                   build  = ":call fzf#install()" },
  { "junegunn/fzf.vim",               config = function() require("plugins.configs.fzf") end },
  { "junegunn/vim-easy-align",        config = function() require("plugins.configs.easyalign") end },
  { "neoclide/coc.nvim",              config = function() require("plugins.configs.coc") end, branch = "master", build = "npm ci", lazy = false, priority = 100},
  { "github/copilot.vim",             config = function() require("plugins.configs.copilot") end, lazy = false, priority = 200},
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
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  {
    "coffebar/transfer.nvim",
    lazy = true,
    cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
    opts = require("plugins.configs.transfer"),
  },

  -- ui
  { "mhinz/vim-startify",              config = function() require("plugins.configs.vimstartify") end },
  { "nvim-tree/nvim-web-devicons",     config = function() require("plugins.configs.nvimwebdevicons") end },
  { "nvim-treesitter/nvim-treesitter", config = function() require("plugins.configs.treesitter") end, build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim",       config = function() require("plugins.configs.lualine") end, dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "akinsho/bufferline.nvim",         config = function() require("plugins.configs.bufferline") end, dependencies = { "nvim-tree/nvim-web-devicons" }, branch = "main" },
  { 'Bekaboo/dropbar.nvim',            config = function() require("plugins.configs.dropbar") end },
  { "f-person/git-blame.nvim",         config = function() require("plugins.configs.gitblame") end },
  { "hiphish/rainbow-delimiters.nvim", config = function() require("plugins.configs.rainbowdelimiters") end },
  { "shiyanhui/vista.vim",             config = function() require("plugins.configs.vista") end },
  { "lewis6991/satellite.nvim",        config = function() require("plugins.configs.satellite") end },
  { "RRethy/vim-illuminate",           config = function() require("plugins.configs.illuminate") end },
  { "folke/todo-comments.nvim",        config = function() require("todo-comments").setup() end, dependencies = { "nvim-lua/plenary.nvim" } },
  { "lewis6991/gitsigns.nvim",         config = function() require("gitsigns").setup() end },
  { "ecthelionvi/NeoColumn.nvim",      opts = require("plugins.configs.neocolumn").opts },
  { "sindrets/diffview.nvim",          cmd = {"DiffviewFileHistory"} },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = require("plugins.configs.indentblankline").opts
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 1000,
    },
  },
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
}

require("lazy").setup(plugins, lazy_opts)
