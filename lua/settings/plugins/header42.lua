local header = require 'header42'

header.user = 'psergio-'
header.mail = '@students.42sp.org.br'

-- Add support to other languages:
-- header.types['/regex/'] = {'begin-comment', 'filler', 'end-comment'}

--header.types['\\.sh$\\|\\.py$'] = {'#', '*', '#'}

vim.cmd('nnoremap <F2> <cmd>Stdheader<cr>')
vim.cmd('autocmd BufNewFile *.c,*.h <cmd>Stdheader<cr>')
