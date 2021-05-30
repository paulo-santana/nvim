vim.g.mapleader = " "

vim.o.ruler = true
vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.encoding = 'utf-8'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.t_Co = '256'
vim.o.background = 'dark'
vim.o.smarttab = true
vim.o.laststatus = 2
vim.o.showtabline = 2
vim.o.scrolloff = 4
vim.o.sidescrolloff = 6
vim.o.showmode = false
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.inccommand = 'nosplit'

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.cursorline = true
vim.wo.colorcolumn = '80,120'
vim.wo.wrap = false

vim.api.nvim_exec([[
	set fileencoding=utf-8
	set tabstop=4
	set shiftwidth=4
	set noexpandtab
	set smartindent
]], true);
vim.cmd('highlight Search ctermfg=180 ctermbg=59 guifg=#e5c07b guibg=#5c6370')
--vim.bo.fileencoding = 'utf-8'
--vim.bo.tabstop = 4
--vim.bo.shiftwidth = 4
--vim.bo.expandtab = false
--vim.bo.smartindent = true
