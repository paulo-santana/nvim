local lint = require('lint')
local norme_linter = require('norme').linter

lint.linters.norme = norme_linter

lint.linters_by_ft = {
	c = { 'norme', },
	cpp = { 'norme', }, -- for header and C++ files
	python = { 'pylint', },
}

vim.api.nvim_exec([[
		autocmd BufEnter		*.c,*.h lua require('norme').lint()
		autocmd BufWritePost	*.c,*.h lua require('norme').lint()
		autocmd TextChanged		*.c,*.h lua require('norme').lint()
		autocmd InsertLeave		*.c,*.h lua require('norme').lint()
]], false)
