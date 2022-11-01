---@diagnostic disable: redundant-parameter
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.code_actions.proselint,
		null_ls.builtins.diagnostics.proselint,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.autopep8,
	},
})
