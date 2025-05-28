-- keymaps
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', 'O<Esc>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set('t', 'jj', [[<C-\><C-n>]])
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')

-- configs
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""

-- load packer
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'          -- Packer

  use 'nvim-treesitter/nvim-treesitter' -- Treesitter
  use 'nvim-tree/nvim-tree.lua'         -- Nvim Tree
  use 'nvim-tree/nvim-web-devicons'     -- Icons (required by nvimtree)
  use 'nvim-telescope/telescope.nvim'   -- Telescope
  use 'nvim-lua/plenary.nvim'           -- Telescope dependency
  use 'neovim/nvim-lspconfig'           -- LSP
  use 'dasupradyumna/midnight.nvim'     -- Theme
end)

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript", "html", "css" },
  highlight = {
    enable = true,
  },
}

-- Tree
require('nvim-tree').setup {}
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})

-- LSP
-- local lspconfig = require('lspconfig')
--
-- -- Python
-- lspconfig.pyright.setup{}
--
-- -- Lua
-- lspconfig.lua_ls.setup{
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = {'vim'}
--       }
--     }
--   }
-- }

-- themes and visual
vim.o.background = "dark"
vim.cmd.colorscheme 'midnight'
