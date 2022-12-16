vim.cmd [[ au BufEnter *.tpp setlocal filetype=cpp ]]
vim.cmd [[ au BufEnter *.c setlocal tabstop=8 ]]
vim.cmd [[ au BufEnter *.cpp setlocal tabstop=2 ]]
vim.cmd [[ au BufEnter *.cpp setlocal shiftwidth=2 ]]
vim.cmd [[ au BufEnter *.hpp setlocal tabstop=2 ]]
vim.cmd [[ au BufEnter *.hpp setlocal shiftwidth=2 ]]

vim.cmd [[ au BufEnter *.js setlocal tabstop=2 ]]
vim.cmd [[ au BufEnter *.ts setlocal shiftwidth=2 ]]
vim.cmd [[ au BufEnter *.jsx setlocal tabstop=2 ]]
vim.cmd [[ au BufEnter *.tsx setlocal shiftwidth=2 ]]

local autocmd = vim.api.nvim_create_autocmd

local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
