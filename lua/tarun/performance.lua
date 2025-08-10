return {
    {
        "lewis6991/impatient.nvim",
        priority = 1000,
        config = function()
            require("impatient")
        end,
    },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
}