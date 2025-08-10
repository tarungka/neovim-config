return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	priority = 1000,
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin", -- Use catppuccin theme to match colorscheme
				icons_enabled = true,
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" }, -- Git branch
				lualine_c = {
					{ "filename", path = 1 }, -- Show filename with relative path
					{
						"diff",
						symbols = {
							added = " ",
							modified = "📝",
							removed = " ",
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
