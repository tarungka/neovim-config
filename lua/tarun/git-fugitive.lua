return {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread", "Gblame" },
    keys = {
        { "<leader>gs", ":Git<CR>", desc = "Git Status (Fugitive)" },
        { "<leader>gc", ":Git commit<CR>", desc = "Git Commit" },
        { "<leader>gp", ":Git push<CR>", desc = "Git Push" },
        { "<leader>gl", ":Git pull<CR>", desc = "Git Pull" },
        { "<leader>gf", ":Git fetch<CR>", desc = "Git Fetch" },
        { "<leader>gb", ":Git blame<CR>", desc = "Git Blame" },
        { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git Diff (Horizontal)" },
        { "<leader>gD", ":Gvdiffsplit<CR>", desc = "Git Diff (Vertical)" },
        { "<leader>gr", ":Gread<CR>", desc = "Reset file (Git Read)" },
        { "<leader>gw", ":Gwrite<CR>", desc = "Stage file (Git Write)" },
    },
}

