return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"angular",
				"bash",
				"go",
				"go",
				"java",
				"javascript",
				"json",
				"json5",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<M-space>",
				},
			},
		})
	end,
}
