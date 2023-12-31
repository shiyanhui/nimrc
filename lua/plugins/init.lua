require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- efficiency
  use {'neoclide/coc.nvim',              config = function() require('plugins.coc') end, branch = 'release'}
  use {'junegunn/fzf',                   run    = ':call fzf#install()'}
  use {'junegunn/fzf.vim',               config = function() require('plugins.fzf') end}
  use {'easymotion/vim-easymotion',      config = function() require('plugins.easymotion') end}
  use {'scrooloose/nerdcommenter',       config = function() require('plugins.nerdcommenter') end}
  use {'windwp/nvim-autopairs',          config = function() require('nvim-autopairs').setup() end}
  use {'ntpeters/vim-better-whitespace', config = function() require('plugins.whitespace') end}
  use {'junegunn/vim-easy-align',        config = function() require('plugins.easyalign') end}
  use {'kylechui/nvim-surround',         config = function() require('nvim-surround').setup() end, tag = 'main'}
  use {'github/copilot.vim',             config = function() require('plugins.copilot') end}
  use {
    'andymass/vim-matchup',
    event = 'VimEnter',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  }

  -- interface
  use {'mhinz/vim-startify'}
  use {'p00f/nvim-ts-rainbow'}
  use {'sindrets/diffview.nvim'}
  use {'petertriho/nvim-scrollbar',   config = function() require('scrollbar').setup() end}
  use {'shiyanhui/vista.vim',         config = function() require('plugins.vista') end}
  use {'lewis6991/gitsigns.nvim',     config = function() require('gitsigns').setup() end, requires = {'nvim-lua/plenary.nvim'}}
  use {'nvim-tree/nvim-web-devicons', config = function() require('plugins.nvimwebdevicons') end}
  use {'nvim-lualine/lualine.nvim',   config = function() require('plugins.lualine') end, requires = {'nvim-tree/nvim-web-devicons', opt = true}}
  use {'folke/todo-comments.nvim',    config = function() require('todo-comments').setup() end, requires = {'nvim-lua/plenary.nvim'}}
  use {'folke/lsp-colors.nvim',       config = function() require('lsp-colors').setup() end}
  use {'folke/which-key.nvim',        config = function() require('plugins.whichkey') end}
  use {'akinsho/bufferline.nvim',     config = function() require('plugins.bufferline') end, requires = {'nvim-tree/nvim-web-devicons'}, tag = "*"}
  use {'nvim-tree/nvim-tree.lua',     config = function() require('plugins.nvimtree') end, requires = {'nvim-tree/nvim-web-devicons'}, tag = 'nightly'}
  use {'f-person/git-blame.nvim',     config = function() require('plugins.gitblame') end}
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }

  -- themes
  use {'rmehri01/onenord.nvim'}

  -- languages
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = {'markdown'}
    end,
    ft = {'markdown'}
  }
end)

require('plugins.colorscheme')
