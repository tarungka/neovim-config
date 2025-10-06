return {
	"robitx/gp.nvim",
	cmd = {
		"GpChatToggle",
		"GpChatNew",
		"GpExplain",
		"GpRewrite",
		"GpAppend",
		"GpPrepend",
	},
	keys = {
		{ "<leader>gC", "<cmd>GpChatToggle<CR>", desc = "Toggle GP Chat" },
		{ "<leader>gg", "<cmd>GpChatNew<CR>", desc = "New GP Chat" },
		{ "<leader>ge", ":<C-u>GpExplain<CR>", mode = "v", desc = "Explain selection" },
		{ "<leader>gr", ":<C-u>GpRewrite<CR>", mode = "v", desc = "Rewrite selection" },
		{ "<leader>ga", ":<C-u>GpAppend<CR>", mode = "v", desc = "Append via GP" },
		{ "<leader>gp", ":<C-u>GpPrepend<CR>", mode = "v", desc = "Prepend via GP" },
	},
	config = function()
		local conf = {
			-- Please start with minimal config possible.
			-- Just openai_api_key if you don't have OPENAI_API_KEY env set up.
			-- Defaults change over time to improve things, options might get deprecated.
			-- It's better to change only things where the default doesn't fit your needs.

			-- required openai api key (string or table with command and arguments)
			-- openai_api_key = { "cat", "path_to/openai_api_key" },
			-- openai_api_key = { "bw", "get", "password", "OPENAI_API_KEY" },
			-- openai_api_key: "sk-...",
			-- openai_api_key = os.getenv("env_name.."),
			openai_api_key = os.getenv("OPENAI_API_KEY"),

			-- at least one working provider is required
			-- to disable a provider set it to empty table like openai = {}
			providers = {
				-- secrets can be strings or tables with command and arguments
				-- secret = { "cat", "path_to/openai_api_key" },
				-- secret = { "bw", "get", "password", "OPENAI_API_KEY" },
				-- secret : "sk-...",
				-- secret = os.getenv("env_name.."),
				openai = {
					disable = false,
					endpoint = "https://api.openai.com/v1/chat/completions",
					secret = os.getenv("OPENAI_API_KEY"),
				},
			},
		}
		require("gp").setup(conf)

	end,
}
