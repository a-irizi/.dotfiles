local status, surround = pcall(require, "nvim-surround")
if not status then
	return
end

surround.setup({
	keymaps = {
		insert = "<M-g>s",
		insert_line = "<M-g>S",
	},
})
