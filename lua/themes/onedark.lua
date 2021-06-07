local shade_color = require('../utils').shade_color
						
local M = {}

local colors = {
  bg = '#282c34',
  yellow = '#e5c07b',
  cyan = '#56b6c2',
  green = '#98c379',
  orange = '#d19a66',
  purple = '#c678dd',
  magenta = '#c678dd',
  grey = '#abb2bf',
  blue = '#61afef',
  red = '#e06c75'
}
colors.darker_bg = shade_color(colors.bg, -8)
colors.lighter_bg = shade_color(colors.bg, 24)
colors.darkblue = shade_color(colors.blue, -74)
colors.diag_error = shade_color(colors.red, -30)
colors.diag_warning = shade_color(colors.yellow, -30)

local diag_colors = {
	error = '{ "fg": { "gui": "' .. colors.diag_error ..'" } }',
	warning = '{ "fg": { "gui": "' .. colors.diag_warning ..'" } }'
}

if vim.fn.has('nvim') then
  vim.api.nvim_exec([[
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1

    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif

	if (has("autocmd"))
		augroup colorextend
			autocmd!
			" Make `Function`s bold in GUI mode
			autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
			" Override the `Search` background and foreground colors in GUI mode
			autocmd ColorScheme * call onedark#extend_highlight("Search", { "bg": { "gui": "#5c6370" }, "fg": { "gui": "#e5c07b" } })
			" Override the LSP Diagnostic virtual text messages
			autocmd ColorScheme * call onedark#extend_highlight("LspDiagnosticsDefaultError", ]] .. diag_colors.error ..[[)
			autocmd ColorScheme * call onedark#extend_highlight("LspDiagnosticsDefaultWarning", ]] .. diag_colors.warning ..[[)
		augroup END
	endif


  ]], false)
end

vim.g.onedark_terminal_italics = 1

vim.cmd('colorscheme onedark')

M.colors = colors
return M
