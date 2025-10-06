return {
	-- Performance optimizations
	require("tarun.performance"),

	-- Mason - LSP/DAP/Linter installer (must load before LSP)
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 50,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "[+]",
						package_pending = "[~]",
						package_uninstalled = "[-]",
					},
				},
			})
		end,
	},

	-- Mason LSP integration
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		lazy = false,
		priority = 49,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"ts_ls",
					"pyright",
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"cssls",
					"tailwindcss",
					"bashls",
					"jsonls",
					"yamlls",
					"html",
					"dockerls",
				},
				automatic_installation = true,
			})
		end,
	},

	-- Mason DAP integration
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		lazy = false,
		priority = 48,
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"delve",            -- Go debugger
					"python",           -- Python debugger
					"js-debug-adapter", -- JavaScript/TypeScript debugger
				},
				automatic_installation = true,
			})
		end,
	},

	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Load LSP server configurations
			require("tarun.lsp")
		end,
	},

	-- LSP Enhancements
	require("tarun.lsp-enhancements"),

	-- Autocompletion
	require("tarun.autocomplete"),

	-- Syntax highlighting and code analysis
	require("tarun.treesitter"),

	-- Language specific
	-- Removed vim-go: conflicts with gopls LSP (gopls provides all functionality)
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
