return {
	-- Performance optimizations
	require("tarun.performance"),

	-- Plugin specification
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	-- LSP Enhancements
	require("tarun.lsp-enhancements"),

	-- Autocompletion
	require("tarun.autocomplete"),

	-- Syntax highlighting and code analysis
	require("tarun.treesitter"),

	-- Language specific
	{
		"fatih/vim-go",
		build = ":GoUpdateBinaries",
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_auto_start = 0
		end,
	},

	-- File navigation and fuzzy finding
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	require("tarun.telescope"),

	-- UI Enhancements
	require("tarun.lualine"),
	require("tarun.ui-enhancements"),
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },

	-- Debugging
	require("tarun.dap"),

	-- Code quality tools
	require("tarun.code-quality"),
	{
		"stevearc/aerial.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			layout = { default_direction = "right", min_width = 28 },
			show_guides = true,
		},
		config = function(_, opts)
			require("aerial").setup(opts)
			vim.keymap.set("n", "<leader>to", "<cmd>AerialToggle! right<CR>", { noremap = true, silent = true, desc = "Toggle Outline" })
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},

	-- Editing enhancements
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = false,
	},
	require("tarun.comment"),

	require("tarun.autopairs"),
	require("tarun.git"),

	require("tarun.which-key"),
	require("tarun.toggleterm"),
	require("tarun.git-fugitive"),
	require("tarun.harpoon"),

	-- Navigation improvements
	require("tarun.navigation"),

	require("tarun.diffview"),
	require("tarun.nvim-notify"),
	require("tarun.bufferline"),
	require("tarun.llm"),
	require("tarun.lazygit"),

	-- Modern features
	require("tarun.modern-features"),
}
