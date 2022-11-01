local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }
vim.g.mapleader = ","
-- increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")
-- escape
keymap({ "n", "i", "v", "s", "c" }, "<C-g>", "<ESC>")
-- save buffer
keymap("n", "<C-s>", ":w<CR>")
keymap("i", "<C-s>", "<esc>:w<CR>a")
keymap("v", "<C-s>", "<esc>:w<CR>gv")
-- formatting
keymap("n", "<C-M-i>", function()
	vim.lsp.buf.format()
end, opts)
keymap({ "s", "n" }, "<C-M-i>", function()
	vim.lsp.buf.format()
end, opts)
-- new tab
keymap("n", "te", ":tabedit<CR>", opts)
-- split window
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)
-- move window
keymap("", "<C-h>", "<C-w>h", opts)
keymap("", "<C-j>", "<C-w>j", opts)
keymap("", "<C-k>", "<C-w>k", opts)
keymap("", "<C-l>", "<C-w>l", opts)
keymap("", "<C-w><C-j>", "5<C-w>-", opts)
keymap("", "<C-w><C-k>", "5<C-w>+", opts)
keymap("", "<C-w><C-h>", "5<C-w><", opts)
keymap("", "<C-w><C-l>", "5<C-w>>", opts)
-- auto center
keymap({ "n", "v", "s" }, "n", "nzz")
keymap({ "n", "v", "s" }, "N", "Nzz")
keymap({ "n", "v", "s" }, "{", "{zz")
keymap({ "n", "v", "s" }, "}", "}zz")
keymap({ "n", "v", "s" }, "<C-d>", "<C-d>zz")
keymap({ "n", "v", "s" }, "<C-u>", "<C-u>zz")
