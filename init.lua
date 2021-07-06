require('plugins')
require('settings.general')
require('settings.mappings')
require('settings.plugins.telescope')
require('settings.plugins.nvim-tree-setup')
require('settings.plugins.tree-sitter')
require('settings.plugins.lualine')

require('themes.onedark')
require('settings.plugins.bufferline')

require('settings.plugins.lsp-setup')
require('settings.plugins.nvim-compe')
----require('settings.plugins.galaxyline')
require('settings.plugins.nvim-norme')
require('settings.plugins.header42')
require('settings.plugins.auto-pairs')
require('settings.plugins.lsp-saga')
require('settings.plugins.lsp-colors')
require('settings.plugins.gitsigns-setup')
require('settings.plugins.nvim-dap-setup')
require('settings.plugins.neogit-setup')
require('settings.plugins.pressence-setup')
require('settings.plugins.toggleterm-setup')
-- colorizer setup;
-- needs to be called after other plugins are set
require'colorizer'.setup()

