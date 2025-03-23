return {
	"akinsho/toggleterm.nvim",
	version = "*",
    event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			size = 20, -- Default terminal height
			-- open_mapping = [[<C-\>]], -- Open with Ctrl + \

            -- open_mapping = "<C-a>",
            open_mapping = "<C-\\>",
			hide_numbers = true, -- Hide line numbers
			shade_terminals = true,
			start_in_insert = true,
			direction = "float", -- Options: "horizontal", "vertical", "float", "tab"
			close_on_exit = true, -- Auto-close when process exits
			shell = vim.o.shell, -- Use system shell
		})
	end,
}
