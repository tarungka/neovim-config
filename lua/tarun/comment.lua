return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy", -- Load when needed
        config = function()
            require("Comment").setup({
                padding = true, -- Adds space after comment delimiters
                sticky = true, -- Keeps the cursor in place
                toggler = {
                    line = "gcc", -- Toggle line comment
                    block = "gbc", -- Toggle block comment
                },
                opleader = {
                    line = "gc", -- Line comment in operator mode
                    block = "gb", -- Block comment in operator mode
                },
                mappings = {
                    basic = true, -- Enables basic mappings (gcc, gbc)
                    extra = false, -- Disables extra mappings
                },
                pre_hook = function(ctx)
                    -- Try Treesitter to detect the commentstring
                    local U = require("Comment.utils")
                    local ts_context = require("ts_context_commentstring.integrations.comment_nvim")

                    -- Use Treesitter-based commentstring if available
                    return ts_context and ts_context.create_pre_hook()(ctx) or nil
                end,
            })
        end,
    }
}
