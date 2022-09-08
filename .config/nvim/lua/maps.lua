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
keymap("", "<C-w><C-j>", "<C-w>-", opts)
keymap("", "<C-w><C-k>", "<C-w>+", opts)
keymap("", "<C-w><C-h>", "<C-w><", opts)
keymap("", "<C-w><C-l>", "<C-w>>", opts)
