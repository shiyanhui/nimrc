require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- efficiency
  -- use {'neoclide/coc.nvim', branch = 'release', config = function() require('plugins.coc') end}
  use {'junegunn/fzf', run = ':call fzf#install()'}
  use {'junegunn/fzf.vim', config = function() require('plugins.fzf') end}
  use {'easymotion/vim-easymotion', config = function() require('plugins.easymotion') end}
  use {'scrooloose/nerdcommenter', config = function() require('plugins.nerdcommenter') end}
  use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end}
  use {'ntpeters/vim-better-whitespace', config = function() require('plugins.whitespace') end}
  use {'junegunn/vim-easy-align', config = function() require('plugins.easyalign') end}
  use {'kylechui/nvim-surround', tag = 'main', config = function() require('nvim-surround').setup() end}
  -- use {'github/copilot.vim', config = function() require('plugins.copilot') end}
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
  use {'petertriho/nvim-scrollbar', config = function() require('scrollbar').setup() end}
  use {'shiyanhui/vista.vim', config = function() require('plugins.vista') end}
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = function() require('gitsigns').setup() end}
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, config = function() require('plugins.lualine') end}
  use {'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('todo-comments').setup() end}
  use {'folke/lsp-colors.nvim', config = function() require('lsp-colors').setup() end}
  use {'folke/which-key.nvim', config = function() require('plugins.whichkey') end}
  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require('plugins.bufferline') end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function() require('plugins.treesitter') end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'},
    tag = 'nightly',
    config = function() require('plugins.nvimtree') end
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
