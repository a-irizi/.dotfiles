vim.g.mapleader = ","

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap("n", "<C-s>", "<LEADER>w:w<CR>", {silent = true})
keymap("i", "<C-s>", "<ESC><LEADER>w:w<CR>a", {silent = true})

keymap("n", "<C-h>", "<C-w><C-h>", opts)
keymap("n", "<C-j>", "<C-w><C-j>", opts)
keymap("n", "<C-k>", "<C-w><C-k>", opts)
keymap("n", "<C-l>", "<C-w><C-l>", opts)

keymap("n", "<LEADER>t", ":$tabnew<CR>", opts)
keymap("n", "<LEADER>s", ":split<CR>", opts)
keymap("n", "<LEADER>v", ":vsplit<CR>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "]", "]]zz", opts)
keymap("n", "[", "[[zz", opts)
keymap("n", ")", ")zz", opts)
keymap("n", "(", "(zz", opts)

keymap("n", "<LEADER>w", "mm:%s/\\s*$//<CR>`m", opts)
keymap("i", "<LEADER>w", "<ESC>mm:%s/\\s*$//<CR>`ma", opts)
keymap("v", "<LEADER>w", "<ESC>mmgv:s/\\s*$//<CR>`m", opts)

keymap("i", "<C-g>", "<ESC>", opts)
keymap("n", "<C-g>", "<ESC>", opts)
keymap("v", "<C-g>", "<ESC>", opts)
keymap("c", "<C-g>", "<ESC>", opts)
