local status, cmp = pcall(require, "cmp")
if not status then
	return
end
local status2, luasnip = pcall(require, "luasnip")
if not status2 then
	return
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local lspkind = require("lspkind")
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			local luasnip = require("luasnip")
			if not luasnip then
				return
			end
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-g>"] = cmp.mapping.close(),
		["<C-j>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = cmp.config.sources(
		{
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- For luasnip users.
		}
		--  {
		--    { name = 'buffer' },
		--  }
	),
	formatting = {
		format = lspkind.cmp_format({ wirth_text = false, max_width = 50 }),
	},
})
vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
