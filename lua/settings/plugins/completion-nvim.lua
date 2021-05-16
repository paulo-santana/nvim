-- Use completion-nvim in every buffer
vim.api.nvim_exec('autocmd BufEnter * lua require"completion".on_attach()', false)

vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt = vim.o.completeopt .. ',menuone,noinsert,noselect'
