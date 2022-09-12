local status, mason = pcall(require, "mason")
if not status then
	return
end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

mason.setup()
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"eslint_d",
		"css-lsp",
		"cssmodules-language-server",
		"emmet-ls",
		"lua-language-server",
		"stylua",
		"tailwindcss-language-server",
	},
})
