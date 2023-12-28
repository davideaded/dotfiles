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
	sync_install = false,
	auto_install = true,
})
