require("toggleterm").setup{
	open_mapping = '<C-l>',
	direction = 'horizontal',
	shade_terminals = true,
}

vim.api.nvim_set_keymap('n', '<C-p>', ':ToggleTerm direction=vertical size=55<CR>', { noremap = true, silent = true })
