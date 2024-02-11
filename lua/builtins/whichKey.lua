local function whichKeyConfig()
	lvim.builtin.which_key.setup.icons = {
		breadcrumb = "»",
		separator = " 󰁔 ",
		group = "+",
		get_lvim_base_dir,
	}

	lvim.builtin.which_key.setup.window = {
		border = "none",
		margin = { 0, 45, 0, 45 },
		padding = { 1, 1, 1, 1 },
		winblend = 10,
	}

	lvim.builtin.which_key.setup.show_help = false
end

return whichKeyConfig()
