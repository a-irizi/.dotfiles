return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function ()
		local keymap = vim.keymap
		local opts = {noremap = true, silent = true}


		-- neotree keymaps
		keymap.set("n", "<leader>e",
			function ()
				vim.cmd('Neotree filesystem reveal left')
			end,
		opts)
		keymap.set("n", "<C-n>",
			function ()
				vim.cmd('Neotree filesystem toggle left')
			end,
		opts)
	end

}
