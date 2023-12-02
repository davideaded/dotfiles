-- configs

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.cmd.colorscheme('GruberDarker')

-- keybindings

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})
vim.cmd("inoremap ii <Esc>")

-- plugin

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	{'nvim-lualine/lualine.nvim'},
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{'numToStr/Comment.nvim', opts = {}, lazy = false},
	{"nvim-tree/nvim-tree.lua", version = "*", lazy = false, dependencies = {"nvim-tree/nvim-web-devicons"}},
	{'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' }},
	{"kylechui/nvim-surround", version = "*", event = "VeryLazy", config = {}},
	{'akinsho/toggleterm.nvim', version = "*", config = true},
})

require('lualine').setup{
	options = { theme = 'gruvbox_dark' }
}
require('bufferline').setup{}
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
	textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  },

	ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'json',
    'lua',
		'ruby',
		'html',
  },
})

require('Comment').setup()
require('nvim-tree').setup({
  hijack_cursor = false,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end

    -- See :help nvim-tree.api
    local api = require('nvim-tree.api')
   
    bufmap('L', api.node.open.edit, 'Expand folder or go to file')
    bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end
})

-- plugins keybindings
-- tree 
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- telescope
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- bufferline
vim.cmd("nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>")
vim.cmd("nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>")
vim.cmd("nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>")
vim.cmd("nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>")
vim.cmd("nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>")
vim.api.nvim_set_keymap('n', '<Leader>q', ':bdelete<CR>', { noremap = true, silent = true })

require("nvim-surround").setup()
require("toggleterm").setup{
	open_mapping = '<C-l>',
	direction = 'horizontal',
	shade_terminals = true,
	}
