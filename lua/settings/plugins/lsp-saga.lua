local saga = require 'lspsaga'

saga.init_lsp_saga({
	server_filetype_map = {
		clangd = { 'c', 'cpp' },
		sumneko_lua = { 'lua' }
	}
})

vim.api.nvim_exec([[
	nnoremap <silent> gh :Lspsaga lsp_finder<CR>
	nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
	"code action
	nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
	vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

	"scroll down hover doc or scroll in definition preview
	nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
	"scroll up hover doc
	nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

	"rename
	nnoremap <silent> <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>

]], false)
