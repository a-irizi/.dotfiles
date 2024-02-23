return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
		config = function()
			local ls = require("luasnip")
			local keymap = vim.keymap.set
			keymap({ "i" }, "<M-e>", function()
				ls.expand()
			end, { silent = true })

			keymap({ "i", "s" }, "<M-l>", function()
				ls.jump(1)
			end, { silent = true })

			keymap({ "i", "s" }, "<M-h>", function()
				ls.jump(-1)
			end, { silent = true })

			keymap({ "i", "s" }, "<M-j>", function()
				if ls.choice_active() then
					ls.change_choice(-1)
				end
			end, { silent = true })

			keymap({ "i", "s" }, "<M-k>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end,
	},
}
