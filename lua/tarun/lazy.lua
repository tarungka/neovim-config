return {
	-- Plugin specification
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	-- Autocompletion
	require("tarun.autocomplete"),

	-- Syntax highlighting and code analysis
	require("tarun.treesitter"),

	-- Language specific
	{
		"fatih/vim-go",
		build = ":GoUpdateBinaries",
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
	-- "nvim-lualine/lualine.nvim",
	require("tarun.lualine"),
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },

	-- Debugging
	require("tarun.dap"),

	-- Code quality tools
	"mfussenegger/nvim-lint",
	-- TODO: move this to a different file
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofmt" },
					python = { "black" },
					javascript = { "prettier" },
				},
			})
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

	require("tarun.diffview"),
	require("tarun.nvim-notify"),
	require("tarun.bufferline"),
	require("tarun.llm"),
	require("tarun.lazygit"),
}
