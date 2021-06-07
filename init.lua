require('plugins')                             -- ~/.config/nvim/lua/plugins.lua
require('settings.general')                    -- ~/.config/nvim/lua/settings/general.lua
require('settings.mappings')                   -- ~/.config/nvim/lua/settings/mappings.lua
--require('themes.onedark')                      -- ~/.config/nvim/lua/themes/onedark.lua
require('themes.tokyonight')
require('settings.plugins.lsp-setup')          -- ~/.config/nvim/lua/settings/plugins/lsp-setup.lua
--require('settings.plugins.completion-nvim')  -- ~/.config/nvim/lua/settings/plugins/completion-nvim.lua
require('settings.plugins.nvim-compe')         -- ~/.config/nvim/lua/settings/plugins/nvim-compe.lua
require('settings.plugins.tree-sitter')        -- ~/.config/nvim/lua/settings/plugins/tree-sitter.lua
require('settings.plugins.telescope')          -- ~/.config/nvim/lua/settings/plugins/telescope.lua
require('settings.plugins.galaxyline')         -- ~/.config/nvim/lua/settings/plugins/galaxyline.lua
require('settings.plugins.bufferline')         -- ~/.config/nvim/lua/settings/plugins/bufferline.lua
require('settings.plugins.nvim-norme')     -- ~/.config/nvim/lua/settings/plugins/nvim-norme.lua
require('settings.plugins.header42')     -- ~/.config/nvim/lua/settings/plugins/header42.lua
require('settings.plugins.auto-pairs')
require('settings.plugins.lsp-saga')
require('settings.plugins.lsp-colors')
require('settings.plugins.gitsigns-setup')
require('settings.plugins.nvim-dap-setup')
require('settings.plugins.neogit-setup')

-- colorizer setup;
-- needs to be called after other plugins are set
require'colorizer'.setup()

print('Welcome, Paulo!')
