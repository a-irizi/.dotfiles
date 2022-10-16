local status, colorscheme = pcall(require, "dracula")
if not status then
	return
end
colorscheme.setup({
	-- show the '~' characters after the end of buffers
	show_end_of_buffer = true, -- default false
	-- use transparent background
	transparent_bg = true, -- default false
	-- set italic comment
	italic_comment = true, -- default false
})

vim.g.termguicolors = true
vim.cmd([[colorscheme dracula]])
