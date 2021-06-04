require('dapui').setup()

vim.api.nvim_exec([[
    nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
    nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
    nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
    nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
]], false)

-- In a file lua/my_debug.lua
vim.cmd( [[
    command! -complete=file -nargs=* DebugC lua require "settings.plugins.nvim-dap-setup.c_debugger".start_c_debugger({<f-args>}, "gdb")
]])
vim.cmd [[
    command! -complete=file -nargs=* DebugRust lua require "c_debugger".start_c_debugger({<f-args>}, "gdb", "rust-gdb")
]]
