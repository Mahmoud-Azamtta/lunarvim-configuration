return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			background_colour = "#1c1c1c", -- I don't know what this does :) but it is recommended when the backtround is transparent
			stages = "fade",
			render = "compact",
		})
	end,
}
