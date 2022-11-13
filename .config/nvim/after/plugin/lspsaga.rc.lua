local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
	saga_winblend = 0,
	max_preview_lines = 20,
	finder_request_timeout = 2000,
	finder_action_keys = {
		open = "o",
		vsplit = "v",
		split = "s",
		tabe = "t",
		quit = { "<esc>", "<C-g>", "q" },
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
	rename_action_quit = "<esc>",
})

local keymap = vim.keymap.set
local opts = { silent = true }
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)

-- Code action
keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
keymap("v", "ga", "<cmd><C-u>Lspsaga range_code_action<CR>", opts)

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

-- Show line diagnostics
keymap("n", "gh", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Outline
keymap("n", "go", "<cmd>LSoutlineToggle<CR>", opts)

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
