require("lazy").setup({
  -- theme
  -- { "ellisonleao/gruvbox.nvim",        priority = 1000 },
  { "tanvirtin/monokai.nvim",          priority = 1000 },

  -- which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  -- LSP and Autocompletion
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'onsails/lspkind-nvim' }, -- Optional
      { 'hrsh7th/cmp-buffer' },   -- Optional
    }
  },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- rest client
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    }
  },

  -- fast block comments
  { 'numToStr/Comment.nvim' },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  { "xiyaowong/transparent.nvim" },
})
