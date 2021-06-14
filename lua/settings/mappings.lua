-- vim.api.nvim_set_keymap('n', 'gf', ':e <cfile><CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Up>', '<cmd>resize -5<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Down>', '<cmd>resize +5<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Left>', '<cmd>vert resize -10<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Right>', '<cmd>vert resize +10<cr>', {noremap = true})

-- go back to the last file
vim.api.nvim_set_keymap('n', '<c-l>', '<c-^>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>nh', '<CMD>nohlsearch<CR>', {noremap = true})

-- quickfix list commands
vim.api.nvim_set_keymap('n', '<leader>cc', '<CMD>cc<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', '<CMD>cnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', '<CMD>cprevious<CR>', {noremap = true})
