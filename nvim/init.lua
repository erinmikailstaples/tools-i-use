-- Basic Neovim configuration
-- This is a starter config - customize to your preferences

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = 'unnamedplus'

-- Install lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
require("lazy").setup({
  -- Color scheme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
  },

  -- Treesitter for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Git integration
  { 'lewis6991/gitsigns.nvim' },
  { 'tpope/vim-fugitive' },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Auto pairs
  { 'windwp/nvim-autopairs' },

  -- Comment plugin
  { 'numToStr/Comment.nvim' },

  -- Which-key for keybinding hints
  { 'folke/which-key.nvim' },
})

-- Basic plugin configurations
require('nvim-tree').setup()
require('gitsigns').setup()
require('lualine').setup()
require('nvim-autopairs').setup()
require('Comment').setup()

-- Mason setup for LSP servers
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'lua_ls', 'ts_ls', 'gopls', 'rust_analyzer' }
})

-- LSP configuration
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
lspconfig.pyright.setup({ capabilities = capabilities })

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  }
})

-- TypeScript/JavaScript
lspconfig.ts_ls.setup({ capabilities = capabilities })

-- Go
lspconfig.gopls.setup({ capabilities = capabilities })

-- Rust
lspconfig.rust_analyzer.setup({ capabilities = capabilities })

-- Autocompletion setup
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Treesitter configuration
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'python', 'javascript', 'typescript', 'go', 'rust', 'json', 'yaml', 'markdown' },
  highlight = { enable = true },
  indent = { enable = true },
})

-- Keymaps
local keymap = vim.keymap.set

-- File explorer
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Live grep' })
keymap('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'Find buffers' })
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = 'Help tags' })

-- LSP keymaps
keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })

-- Buffer navigation
keymap('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
keymap('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Save and quit
keymap('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
keymap('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
