local status, config = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

config.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 79,
				},
			},
		},
	},
})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

config.html.setup({
	capabilities = capabilities,
})

config.cssls.setup({
	capabilities = capabilities,
})

config.cssmodules_ls.setup({})

config.emmet_ls.setup({})

config.tsserver.setup({})
