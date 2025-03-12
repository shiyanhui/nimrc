local lazy_opts = require("plugins.lazy")

local plugins = {
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        transparent_background = false,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        styles = {
          comment = { italic = true },
          keyword = { italic = true }, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        -- Enable this will disable filter option
        day_night = {
          enable = false, -- turn off by default
          day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
          night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
        },
        inc_search = "background", -- underline | background
        background_clear = {
          -- "float_win",
          "toggleterm",
          "telescope",
          -- "which-key",
          "renamer",
          "notify",
          -- "nvim-tree",
          -- "neo-tree",
          -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
        },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = "default", -- default | pro
            context_start_underline = false,
          },
        },
      })
    end
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
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("xcodebuild").setup()
    end,
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
  { "f-person/git-blame.nvim",         config = function() require("plugins.configs.gitblame") end },
  { "hiphish/rainbow-delimiters.nvim", config = function() require("plugins.configs.rainbowdelimiters") end },
  { "shiyanhui/vista.vim",             config = function() require("plugins.configs.vista") end },
  { "lewis6991/satellite.nvim",        config = function() require("plugins.configs.satellite") end },
  { "mfussenegger/nvim-dap",           config = function() require("plugins.configs.nvimdap") end },
  { "rcarriga/nvim-dap-ui",            config = function() require("plugins.configs.nvimdapui") end, dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  { "theHamsta/nvim-dap-virtual-text", config = function() require("plugins.configs.nvimdapvirtualtext") end},
  { "folke/todo-comments.nvim",        config = function() require("todo-comments").setup() end, dependencies = { "nvim-lua/plenary.nvim" } },
  { "lewis6991/gitsigns.nvim",         config = function() require("gitsigns").setup() end },
  { "ecthelionvi/NeoColumn.nvim",      opts = require("plugins.configs.neocolumn").opts },
  { "sindrets/diffview.nvim",          cmd = {"DiffviewFileHistory"} },
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

  -- languages
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}

require("lazy").setup(plugins, lazy_opts)
