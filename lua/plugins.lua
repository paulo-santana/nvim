vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- make the plugin manage itself
  use { 'wbthomason/packer.nvim', opt = true }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- eclipse jdt client
  use { 'mfussenegger/nvim-jdtls' }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- colorscheme
  use { 'joshdick/onedark.vim' }

  -- preview css colors
  use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }

  -- nvim-lspconfig recommended completion
  use { 'hrsh7th/nvim-compe' }

  -- c/cpp gdb debugger wrapper
  use { 'sakhnik/nvim-gdb', run = ':!bash ./install.sh' }

  -- status line
  use { 'glepnir/galaxyline.nvim',
    branch = 'main',
	-- try to load config here
	--config = function() require'settings.plugins.galaxyline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

  use { 'edluffy/hologram.nvim' }

  use { 'vinicius507/norme.nvim', requires = { 'mfussenegger/nvim-lint' } }

  use { 'tjdevries/nlua.nvim' }

  use { 'eduardomosko/header42.nvim' }

end)
