return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = function()
			require("diffview").setup()
			-- Setup Diffview keymaps
			require("tarun.keymaps").diffview_keymaps()
		end,
	},
}
