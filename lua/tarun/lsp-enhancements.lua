return {
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            text = {
                spinner = "dots",
                done = "✔",
                commenced = "Started",
                completed = "Completed",
            },
            align = {
                bottom = true,
                right = true,
            },
            window = {
                relative = "win",
                blend = 0,
                zindex = nil,
                border = "none",
            },
            timer = {
                spinner_rate = 125,
                fidget_decay = 2000,
                task_decay = 1000,
            },
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded"
            },
            floating_window = true,
            hint_enable = false,
            hi_parameter = "LspSignatureActiveParameter",
        },
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end
    },
}