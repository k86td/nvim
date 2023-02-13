local function activate(func)
	if type(func) == 'table' then
		for ind, val in pairs(func) do
			if type(ind) == 'number' then
				vim.opt[val] = true
			else
				vim.opt[ind] = val
			end

		end
	elseif type(func) == 'string' then
		vim.opt[func] = true
	end
end

activate {
	syntax = 'off',
	tabstop = 4, shiftwidth = 4, softtabstop = 4, mouse = 'a',
	'smarttab',
	'number',
	'cursorline'
}

vim.cmd('colorscheme moonbow')

vim.cmd('set laststatus=0')
