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
			require("lspsaga").setup({})
		end,
		requires = { { "nvim-tree/nvim-web-devicons" } }
	})

	-- themes
	use 'folke/tokyonight.nvim'
	use { "arturgoms/moonbow.nvim" }

	-- git
	use 'kdheepak/lazygit.nvim'
	-- use {'akinsho/toggleterm.nvim', tag = '*', config = function()
	--   require("toggleterm").setup()
	-- end}

	-- telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- startup time monitoring
	use 'dstein64/vim-startuptime'

	-- comments
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- file explorer
	-- use {
	-- 	'nvim-tree/nvim-tree.lua',
	-- 	requires = {
	-- 		'nvim-tree/nvim-web-devicons', -- optional, for file icons
	-- 	},
	-- }
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				enable_diagnostics = true,
				sources = {
					"filesystem",
					"git_status",
				},
				source_selector = {
					winbar = true,
					content_layout = "center",
					tab_labels = {
						filesystem = " File",
						git_status = " Git",
						diagnostics = "󰃤 Bugs",
					},
				},
				default_component_configs = {
					indent = {
						padding = 0,
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "",
					},
					git_status = {
						symbols = {
							added = "",
							deleted = "",
							modified = "",
							renamed = "",
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					width = 30,
					mappings = {
						["o"] = "open",
						["v"] = "open_vsplit",
					},
				},
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = true,
					},
				},
			})
		end
	}

	-- icons
	use 'nvim-tree/nvim-web-devicons'
end)
