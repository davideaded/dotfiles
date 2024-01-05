-- configs

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.cmd.colorscheme('256_noir')
vim.cmd("filetype plugin indent on")
vim.cmd("set clipboard=unnamedplus")

-- keybindings

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})
vim.cmd("inoremap ii <Esc>")

-- telescope

vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- For 256 theme
vim.cmd 'set cursorline'
vim.cmd 'highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212'
vim.cmd 'autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c'
vim.cmd 'autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212'
