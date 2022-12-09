
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
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({
				-- your configuration
			})
		end,
	})

	-- themes
	use 'folke/tokyonight.nvim'

	-- git
	use 'kdheepak/lazygit.nvim'
	-- use {'akinsho/toggleterm.nvim', tag = '*', config = function()
	--   require("toggleterm").setup()
	-- end}

	-- telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- startup time monitoring
	use 'dstein64/vim-startuptime'

end)


