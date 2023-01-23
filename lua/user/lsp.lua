require('mason').setup()

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
	return
end

local cmp_nl_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nl_status_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = {
	'sumneko_lua',
	'tsserver',
	'pyright',
	'rust_analyzer',
	'ansiblels',
	'csharp_ls',
}
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup {
		capabilities = capabilities,
	}
end


-- linters

local lint_ok, lint = pcall(require, 'lint')
if not lint_ok then
	return
end

lint.linters_by_ft = {
	sh = "shellcheck"
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_ok then
	return
end

lspsaga.init_lsp_saga()

local keymap = vim.keymap.set
keymap("n", "fD", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "fd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

keymap("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>")

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- change file type depending on directory
local _home = vim.fn.expand("~")
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { _home .. "*/ansible/*.yml" },
	callback = function(ev)
		vim.cmd [[echo 'ansible loaded...']]
		vim.cmd [[set filetype=yaml.ansible]]
	end
})
