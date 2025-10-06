return {
    -- Flash.nvim for better motion
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- Oil.nvim for file management
    {
        "stevearc/oil.nvim",
        opts = {
            default_file_explorer = false,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = false,
            prompt_save_on_select_new_entry = true,
            cleanup_delay_ms = 2000,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            use_default_keymaps = true,
            view_options = {
                show_hidden = false,
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
            float = {
                padding = 2,
                max_width = 0,
                max_height = 0,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
                override = function(conf)
                    return conf
                end,
            },
            preview = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = 0.9,
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            progress = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = { 10, 0.9 },
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                minimized_border = "none",
                win_options = {
                    winblend = 0,
                },
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Oil",
        keys = {
            { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
        },
    },

    -- Trouble.nvim for better diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            auto_open = false,
            auto_close = false,
            auto_preview = true,
            win = { position = "bottom", height = 10 },
        },
        cmd = { "Trouble" },
        keys = {
            {
                "<leader>xx",
                function()
                    require("trouble").toggle()
                end,
                desc = "Toggle Trouble",
            },
            {
                "<leader>xw",
                function()
                    require("trouble").toggle("diagnostics")
                end,
                desc = "Workspace Diagnostics",
            },
            {
                "<leader>xd",
                function()
                    require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } })
                end,
                desc = "Document Diagnostics",
            },
            {
                "<leader>xq",
                function()
                    require("trouble").toggle("qflist")
                end,
                desc = "Quickfix",
            },
            {
                "<leader>xl",
                function()
                    require("trouble").toggle("loclist")
                end,
                desc = "Location List",
            },
            {
                "gR",
                function()
                    require("trouble").toggle("lsp_references")
                end,
                desc = "LSP References",
            },
        },
    },
}
