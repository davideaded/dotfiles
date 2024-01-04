require('bufferline').setup{}

vim.cmd("nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>")
vim.cmd("nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>")
vim.cmd("nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>")
vim.cmd("nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>")
vim.cmd("nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>")
vim.api.nvim_set_keymap('n', '<Leader>q', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<tab>', ':BufferLineCycleNext<CR>', { silent = true, noremap = true })
