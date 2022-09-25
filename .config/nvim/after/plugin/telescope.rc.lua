local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")

function telescope_buf_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["<C-g>"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- replace netrw with telescope-file-browser
			hijack_netrw = true,
			mappings = {
				i = {
					["<C-g>"] = function()
						vim.cmd("stopinsert")
					end,
				},
				n = {
					["<C-g>"] = actions.close,
					["l"] = actions.select_default,
					["h"] = fb_actions.goto_parent_dir,
					["i"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("n", "<leader><leader>", "<cmd>lua require('telescope.builtin').resume()<CR>", opts)
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require('telescope.builtin').find_files({ no_ignore = false, hidden = true, })<CR>",
	opts
)
keymap("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>r", "<cmd>lua require('telescope.builtin').registers()<CR>", opts)
keymap("n", "\\\\", "<cmd>lua require('telescope.builtin').buffers({initial_mode = 'normal',})<CR>", opts)
-- keymap('n', '<leader>t',
--   "<cmd>lua require('telescope.builtin').help_tags()<CR>",
--   opts)
keymap("n", "<leader>d", "<cmd>lua require('telescope.builtin').diagnostics({initial_mode = 'normal',})<CR>", opts)
keymap(
	"n",
	"<C-e>",
	"<cmd>lua require('telescope').extensions.file_browser.file_browser({path = '%:p:h', cwd = telescope_buf_dir(), respect_git_ignore = false, hidden = true, grouped = true, initial_mode = 'normal',})<CR>",
	opts
)
--  layout_config = {height = 40}
