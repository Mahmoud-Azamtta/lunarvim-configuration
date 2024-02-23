-- function to find current time (hh:mm)
local function getTime()
	local time = os.date("*t")
	local hour = time.hour
	local am_pm = "AM"

	if hour >= 12 then
		am_pm = "PM"
		if hour > 12 then
			hour = hour - 12
		end
	elseif hour == 0 then
		hour = 12
	end

	local result = string.format("  %d:%02d %s", hour, time.min, am_pm)
	return result
end

lvim.builtin.lualine.options = {
	icons_enabled = true,
	theme = "gruvbox-material",
	component_separators = { left = "", right = "" }, -- 
	section_separators = { left = "", right = "" }, -- 
}

lvim.builtin.lualine.sections = {
	lualine_a = {
		"mode",
	},
	lualine_b = {
		"branch",
		"diff",
	},
	lualine_c = {
		"filename",
		{
			"diagnostics",
			symbols = {
				error = " ",
				warn = " ",
				info = " ",
				hint = " ",
			},
		},
	},
	lualine_x = { "fileformat", "filetype" },
	lualine_y = { "progress" },
	lualine_z = { getTime },
}
