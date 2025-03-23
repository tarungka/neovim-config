return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "fade_in_slide_out",
			timeout = 3000,
			render = "default",
			background_colour = "#282c34",
			max_width = 80,
			max_height = 10,
		})
		vim.notify = notify
	end,
}
