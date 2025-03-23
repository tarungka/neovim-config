return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					separator_style = "slant",
				},
			})
		end,
	},
}
