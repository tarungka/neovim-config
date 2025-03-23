return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "HiPhish/nvim-ts-rainbow2",
        },
        lazy = false, -- Treesitter benefits from being loaded early
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "go",
                    "javascript",
                    "typescript",
                    "lua",
                    "python",
                    "bash",
                    "c",
                    "cpp",
                    "json",
                    "yaml",
                    "html",
                    "css",
                    -- Add any other languages you use frequently
                },
                modules = {},
                ignore_install = {},
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "markdown" }, -- Keep or remove based on your needs
                },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = true,
        config = function()
            require("treesitter-context").setup({
                enable = true,
                multiwindow = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
}
