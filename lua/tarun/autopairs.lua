return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Load only when entering insert mode
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- Enable treesitter-based pairing
        })
    end
}
