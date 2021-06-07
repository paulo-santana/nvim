local setopt = vim.opt

vim.g.mapleader = " "

local options = {
	ruler = true,
	mouse = 'a',
	hidden = true,
	encoding = 'utf-8',
	splitbelow = true,
	splitright = true,
	--t_Co = '256',
	background = 'dark',
	smarttab = true,
	laststatus = 2,
	showtabline = 2,
	scrolloff = 4,
	sidescrolloff = 6,
	showmode = false,
	cmdheight = 2,
	updatetime = 300,
	inccommand = 'nosplit',

	number = true,
	relativenumber = true,
	signcolumn = 'yes',
	cursorline = true,
	colorcolumn = '80,120',
	wrap = false,

	fileencoding = 'utf-8',
	tabstop = 4,
	shiftwidth = 4,
	expandtab = false,
	smartindent = true,
}

local set_options = function(opt)
	for option, value in pairs(opt) do
		setopt[option] = value
	end
end

set_options(options)

--vim.api.nvim_exec([[
--fileencoding=utf-8
--tabstop=4
--shiftwidth=4
--noexpandtab
--smartindent
--]], true);
--vim.cmd('highlight Search ctermfg=180 ctermbg=59 guifg=#e5c07b guibg=#5c6370')
--vim.bo.fileencoding = 'utf-8'
--vim.bo.tabstop = 4
--vim.bo.shiftwidth = 4
--vim.bo.expandtab = false
--vim.bo.smartindent = true
