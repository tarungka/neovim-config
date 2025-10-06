return {
    -- None-ls for additional linting and formatting
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local code_actions = null_ls.builtins.code_actions

            null_ls.setup({
                sources = {
                    -- Formatting
                    formatting.prettier.with({
                        filetypes = {
                            "javascript",
                            "typescript",
                            "javascriptreact",
                            "typescriptreact",
                            "vue",
                            "css",
                            "scss",
                            "less",
                            "html",
                            "json",
                            "jsonc",
                            "yaml",
                            "markdown",
                            "markdown.mdx",
                            "graphql",
                            "handlebars",
                        },
                    }),
                    formatting.black.with({
                        extra_args = { "--fast" },
                    }),
                    formatting.stylua,
                    formatting.goimports,
                    formatting.rustfmt,
                    formatting.shfmt,

                    -- Diagnostics
                    diagnostics.eslint_d.with({
                        condition = function(utils)
                            return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
                        end,
                    }),
                    diagnostics.flake8.with({
                        extra_args = { "--max-line-length", "100" },
                    }),
                    diagnostics.golangci_lint,
                    diagnostics.shellcheck,
                    diagnostics.yamllint,

                    -- Code Actions
                    code_actions.eslint_d,
                    code_actions.gitsigns,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.keymap.set("n", "<leader>lf", function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end, { buffer = bufnr, desc = "Format buffer" })
                    end
                end,
            })
        end,
    },

    -- Neotest for test runner integration
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            -- Test adapters
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-jest",
            "marilari88/neotest-vitest",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                        runner = "pytest",
                    }),
                    require("neotest-go"),
                    require("neotest-jest")({
                        jestCommand = "npm test --",
                        jestConfigFile = "custom.jest.config.ts",
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    }),
                    require("neotest-vitest"),
                },
                status = {
                    enabled = true,
                    signs = true,
                    virtual_text = false,
                },
                icons = {
                    expanded = "▾",
                    collapsed = "▸",
                    failed = "✖",
                    passed = "✔",
                    running = "⟳",
                    skipped = "➜",
                    unknown = "?",
                },
            })
        end,
        keys = {
            { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
            { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug nearest test" },
            { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop test" },
            { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to test" },
            { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
            { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle test output panel" },
            { "<leader>tS", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
        },
    },

    -- Better quickfix
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        opts = {
            auto_enable = true,
            preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = { "│", "│", "─", "─", "╭", "╮", "╰", "╯", "█" },
            },
            func_map = {
                vsplit = "",
                ptogglemode = "z,",
                stoggleup = "",
            },
            filter = {
                fzf = {
                    action_for = { ["ctrl-s"] = "split" },
                    extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                },
            },
        },
    },
}
