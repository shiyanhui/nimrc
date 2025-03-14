local M = {}

M.opts = {
  provider = "copilot",
  auto_suggestions_provider = "copilot",
  -- cursor_applying_provider = "copilot",
  copilot = {
    model = "gpt-4o",
    proxy = "http://127.0.0.1:7897",
    allow_insecure = true,
    timeout = 10000,
    temperature = 0,
    max_tokens = 8192,
  },
  behaviour = {
    auto_suggestions = true,
    auto_set_keymaps = true,
    enable_cursor_planning_mode = false,
  },
  mappings = {
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      accept = "<C-e>",
      next = "<C-n>",
      prev = "<C-p>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      apply_all = "A",
      apply_cursor = "a",
      retry_user_request = "r",
      edit_user_request = "e",
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
      remove_file = "d",
      add_file = "@",
      close = {},
      close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
    },
  },
  suggestion = {
    debounce = 50,
    throttle = 50,
  },
  vendors = {
    deepseek = {
      __inherited_from = "openai",
      disable_tools = true,
      api_key_name = "DEEPSEEK_API_KEY",
      endpoint = "https://api.deepseek.com",
      model = "deepseek-coder",
    },
    deepseek_r1 = {
      __inherited_from = "openai",
      disable_tools = true,
      api_key_name = "DEEPSEEK_API_KEY",
      endpoint = "https://api.deepseek.com",
      model = "deepseek-reasoner",
    },
  }
}

M.dependencies = {
  "nvim-treesitter/nvim-treesitter",
  "stevearc/dressing.nvim",
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  --- The below dependencies are optional,
  "echasnovski/mini.pick",
  "nvim-telescope/telescope.nvim",
  "hrsh7th/nvim-cmp",
  "ibhagwan/fzf-lua",
  "nvim-tree/nvim-web-devicons",
  'MeanderingProgrammer/render-markdown.nvim',
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
        },
      })
    end
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = true,
      },
    },
  },
}

vim.keymap.set({"n", "i"}, "<Leader>t", "<Esc>:AvanteToggle<CR>")
vim.keymap.set({"n", "i"}, "<Leader>at", "<Esc>:AvanteToggle<CR>")

return M
