local has = vim.fn.has

function GetFileNameFromPath(filepath, replace_dash)
	replace_dash = replace_dash or false
	local filename = filepath
	if has("unix") or has("linux") or has("mac") then
		filename = filepath:match("^.+/(.+)%..+$")
	elseif has("win32") then
		filename = filepath:match("^.+\\(.+)%..+$")
	end
	if replace_dash then
		filename = filename:gsub("-", "_")
	end
	return filename
end

function GetCurrentFileName(replace_dash)
	return GetFileNameFromPath(vim.api.nvim_buf_get_name(0), replace_dash)
end
