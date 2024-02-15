return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		local icons = require("nvim-web-devicons")
		icons.setup({
			override_by_extension = {
				["js"] = {
					icon = "",
					color = "#f7c81e",
					name = "JavaScript",
				},
			},
		})
	end,
}
