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
        build = ":GoUpdateBinaries"
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
    "nvim-lualine/lualine.nvim",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", name = "catppuccin" },

    -- Debugging
    require("tarun.dap"),

    -- Code quality tools
    "mfussenegger/nvim-lint",
    "stevearc/conform.nvim",

    -- Editing enhancements
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup({
                -- Optional configuration options
                padding = true,
                sticky = true,
                ignore = nil,
                toggler = {
                    line = 'gcc',
                    block = 'gbc',
                },
                opleader = {
                    line = 'gc',
                    block = 'gb',
                },
            })
        end
    },

    "windwp/nvim-autopairs",
    require("tarun.git"),
}
