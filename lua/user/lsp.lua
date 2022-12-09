
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
	callback = function ()
		lint.try_lint()
	end,
})
