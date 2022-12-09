
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- optimization
	use 'nathom/filetype.nvim'
	use 'lewis6991/impatient.nvim'

	-- tree-sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
	}

	-- snippets
	use 'L3MON4D3/LuaSnip'

	-- completion libraries
	use "ii14/emmylua-nvim" -- neovim 

	-- linter
	use 'mfussenegger/nvim-lint'

	-- cmp
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip" -- snippet completions

	-- lsps
	use { 'williamboman/mason.nvim' }
	use { 'neovim/nvim-lspconfig' }

	-- themes
	use 'folke/tokyonight.nvim'

	-- git
	--use {'akinsho/toggleterm.nvim', tag = '*', config = function()
	--  require("toggleterm").setup()
	--end}

	-- startup time monitoring
	use 'dstein64/vim-startuptime'

end)


