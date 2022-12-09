
local ts_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ts_status_ok then
	return
end

treesitter.setup {
	ensure_installed = { "lua", "vim", "javascript" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true
	}
}

