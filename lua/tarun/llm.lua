return {
	"robitx/gp.nvim",
	lazy = false,
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

		-- Shortcuts
		-- local map = vim.keymap.set
		-- local opts = { noremap = true, silent = true }
		local opts = { }
		local function map(mode, lhs, rhs, lopts)
			local options = { noremap = true, silent = true }
			if lopts then
				options = vim.tbl_extend("force", options, lopts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		map("v", "<leader>ge", ":<C-u>GpExplain<CR>", opts) -- Explain selection
		map("v", "<leader>gr", ":<C-u>GpRewrite<CR>", opts) -- Rewrite selection
		map("v", "<leader>ga", ":<C-u>GpAppend<CR>", opts) -- Append to selection
		map("v", "<leader>gp", ":<C-u>GpPrepend<CR>", opts) -- Prepend to selection

		map("n", "<leader>gc", ":GpChatToggle<CR>", opts) -- Toggle Chat window
		map("n", "<leader>gg", ":GpChatNew<CR>", opts) -- New Chat
	end,
}
