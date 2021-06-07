vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- make the plugin manage itself
	use { 'wbthomason/packer.nvim', opt = true }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use { 'neovim/nvim-lspconfig' }

	use { 'glepnir/lspsaga.nvim' }

	use { "ray-x/lsp_signature.nvim" }

	-- eclipse jdt client
	use { 'mfussenegger/nvim-jdtls' }

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	-- colorscheme
	use { 'joshdick/onedark.vim' }
	use { 'folke/tokyonight.nvim' }

	-- nvim-lspconfig recommended completion
	use { 'hrsh7th/nvim-compe' }

	-- status line
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- try to load config here
		--config = function() require'settings.plugins.galaxyline' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

	use { 'vinicius507/norme.nvim', requires = { 'mfussenegger/nvim-lint' } }

	use { 'tjdevries/nlua.nvim' }

	use { 'eduardomosko/header42.nvim' }

	--use {'Th3Whit3Wolf/onebuddy', requires = 'tjdevries/colorbuddy.vim'}
	use { 'norcalli/nvim-colorizer.lua' } 

	use { 'lunarWatcher/auto-pairs' }

	use { 'folke/lsp-colors.nvim' }

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use { "norcalli/snippets.nvim" }

	use { 'mfussenegger/nvim-dap' }

	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

	use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim' } }

	use { 'sindrets/diffview.nvim' }

end)
