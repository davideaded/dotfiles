-- keymaps
vim.g.mapleader = " "
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', 'O<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', 'zz', 'q:', { noremap = true, silent = true })

-- windows
vim.keymap.set('t', 'jj', [[<C-\><C-n>]])
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-n>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')

vim.keymap.set('n', '<A-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<A-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>')
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>')

-- configs
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""

-- configs/tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- load packer
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'          -- Packer

    use 'nvim-treesitter/nvim-treesitter'   -- Treesitter
    use 'nvim-tree/nvim-tree.lua'           -- Nvim Tree
    use 'nvim-tree/nvim-web-devicons'       -- Icons (required by nvimtree)
    use 'nvim-telescope/telescope.nvim'     -- Telescope
    use 'nvim-lua/plenary.nvim'             -- Telescope dependency
    use 'neovim/nvim-lspconfig'             -- LSP
    use 'dasupradyumna/midnight.nvim'       -- Theme
    use 'zootedb0t/citruszest.nvim'         -- Theme
    use { 'uloco/bluloco.nvim',             -- Theme
    requires = { 'rktjmp/lush.nvim' }
}
    use 'nordtheme/vim'                     -- Theme
    use 'neovim/nvim-lspconfig'             -- LSP,
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

-- LSP config
local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>z', vim.diagnostic.open_float)
end

lspconfig.vtsls.setup {
  on_attach = on_attach,
}


-- themes and visual
vim.o.background = "light"
vim.cmd("colorscheme codedark")
