return {
	{
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function ()
		require('telescope').setup {
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require('telescope').load_extension('fzf')
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")

			local keymap = vim.keymap.set
			local opts = {noremap = true, silent = true}

			local builtin = require 'telescope.builtin'

			-- telescope keymaps
			keymap("n", "<leader>ff", builtin.find_files, opts)
			keymap("n", "<leader>fg", builtin.live_grep, opts)
			keymap("n", "<leader>sd", builtin.diagnostics, opts)
		end
	},
	'nvim-telescope/telescope-ui-select.nvim'
}
