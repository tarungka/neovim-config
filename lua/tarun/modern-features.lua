return {
    -- GitHub Copilot
    {
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
            
            vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)")
            vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")  -- Changed from <C-[> which is Escape!
            vim.keymap.set("i", "<C-\\>", "<Cmd>vertical Copilot panel<CR>")
        end,
    },

    -- Alternative: Codeium (free AI assistant)
    {
        "Exafunction/codeium.vim",
        enabled = false, -- Enable this and disable Copilot if you prefer Codeium
        event = "BufEnter",
        config = function()
            vim.g.codeium_disable_bindings = 1
            vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
            vim.keymap.set("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
            vim.keymap.set("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
            vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
        end,
    },

    -- Session management
    {
        "rmagatti/auto-session",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "rmagatti/session-lens",
        },
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                auto_session_use_git_branch = false,
                auto_session_enable_last_session = false,
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = true,
                auto_session_create_enabled = true,
                session_lens = {
                    buftypes_to_ignore = {},
                    load_on_setup = true,
                    theme_conf = { border = true },
                    previewer = false,
                },
            })

            local ok, session_lens = pcall(require, "session-lens")
            if ok then
                session_lens.setup({
                    theme_conf = { border = true },
                    previewer = false,
                })
                vim.keymap.set("n", "<leader>ss", session_lens.search_session, {
                    noremap = true,
                    desc = "Search sessions",
                })
            else
                vim.notify("session-lens.nvim not available", vim.log.levels.WARN)
            end
        end,
    },

    -- REST client for API testing
    -- DISABLED: Complex luarocks dependencies causing installation issues
    -- Use curl, httpie, or Postman for REST API testing instead
    -- {
    --     "rest-nvim/rest.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     ft = "http",
    --     config = function()
    --         require("rest-nvim").setup({
    --             result_split_horizontal = false,
    --             result_split_in_place = false,
    --             skip_ssl_verification = false,
    --             encode_url = true,
    --             highlight = {
    --                 enabled = true,
    --                 timeout = 150,
    --             },
    --             result = {
    --                 show_url = true,
    --                 show_http_info = true,
    --                 show_headers = true,
    --                 formatters = {
    --                     json = "jq",
    --                     html = function(body)
    --                         return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
    --                     end,
    --                 },
    --             },
    --             jump_to_request = false,
    --             env_file = ".env",
    --             custom_dynamic_variables = {},
    --             yank_dry_run = true,
    --         })
    --
    --         vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run REST request" })
    --         vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview REST request" })
    --         vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "Run last REST request" })
    --     end,
    -- },

    -- Better marks
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {
            default_mappings = true,
            builtin_marks = { ".", "<", ">", "^" },
            cyclic = true,
            force_write_shada = false,
            refresh_interval = 250,
            sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
            excluded_filetypes = {},
            bookmark_0 = {
                sign = "⚑",
                virt_text = "hello world",
                annotate = false,
            },
            mappings = {},
        },
    },
}
