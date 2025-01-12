local keymap = vim.keymap.set

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Navigate vim panes better
keymap('n', '<C-k>', ':wincmd k<CR>')
keymap('n', '<C-j>', ':wincmd j<CR>')
keymap('n', '<C-h>', ':wincmd h<CR>')
keymap('n', '<C-l>', ':wincmd l<CR>')

-- Navigate tabs
keymap('n', '<M-t>', function()
  vim.cmd.tabnew()
end)
keymap({ 'n', 'i' }, '<M-Left>', function()
  vim.cmd.tabprevious()
end)

keymap({ 'n', 'i' }, '<M-Right>', function()
  vim.cmd.tabnext()
end)
