local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

autopairs.setup({
	disable_filetype = { "Telescope_prompt", "vim" },
	map_c_h = true,
})
