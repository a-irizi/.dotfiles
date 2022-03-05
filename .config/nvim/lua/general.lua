-- return the output of an OS command
function os_command_output(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end
HOME = os_command_output("echo $HOME")
RUNTIME = HOME.."/.config/nvim"

vim.bo.syntax = "ON"
vim.o.splitright = true

vim.bo.complete = vim.bo.complete..",kspell"
vim.o.completeopt = "menuone,longest"

vim.bo.undofile = true
vim.o.undodir = RUNTIME.."/tmp/undo//"
vim.o.directory = RUNTIME.."/tmp/swp//"

vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.autoindent = true
vim.bo.shiftwidth = 4

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.list = true
vim.wo.listchars = "trail:-,tab:| "
vim.o.incsearch = true
vim.o.hlsearch = false
