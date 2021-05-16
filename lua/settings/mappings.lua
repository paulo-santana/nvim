-- vim.api.nvim_set_keymap('n', 'gf', ':e <cfile><CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Up>', '<cmd>resize -5<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Down>', '<cmd>resize +5<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Left>', '<cmd>vert resize -10<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Right>', '<cmd>vert resize +10<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<c-l>', '<c-^>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>cc', '<CMD>cc<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cn', '<CMD>cnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cp', '<CMD>cprevious<CR>', {noremap = true})
