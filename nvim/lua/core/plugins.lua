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
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'L3MON4D3/LuaSnip'},
	{"saadparwaiz1/cmp_luasnip"},
	{"rafamadriz/friendly-snippets"},
	{'kyoto-shift/film-noir'},
})
