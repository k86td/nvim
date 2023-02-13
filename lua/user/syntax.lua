local ts_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ts_status_ok then
	return
end

treesitter.setup {
	ensure_installed = { "lua", "vim", "javascript", "markdown" },
	sync_install = true,
	highlight = {
		enable = true,
	},
}
