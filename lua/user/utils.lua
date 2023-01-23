vim.api.nvim_set_keymap('n', 'gG', ':LazyGit<CR>', {})
vim.g.lazygit_floating_window_corner_chars = { '┌', '┐', '└', '┘' }

local telescope_ok, telescope = pcall(require, 'telescope.builtin')
if not telescope_ok then
	return
end
local set = vim.keymap.set

set('n', 'ff', telescope.find_files, {})
set('n', 'fg', telescope.live_grep, {})
set('n', 'fb', telescope.buffers, {})
set('n', 'fh', telescope.help_tags, {})

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
local tree_ok, nvim_tree = pcall(require, 'nvim-tree')
if not tree_ok then
	return
end

nvim_tree.setup()
