return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signcolumn = true,         -- Toggle with `:Gitsigns toggle_signs`
            numhl = false,             -- Disable number column highlighting
            linehl = false,            -- Disable line highlighting
            word_diff = false,         -- Disable word diff
            attach_to_untracked = true,
            current_line_blame = true, -- Enable inline blame for current line
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- end of line
                virt_text_priority = 100,
                virt_text_format = " <author> • <summary> ",
            },
            on_attach = function(bufnr)
                if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
                    return
                end

                local gs = package.loaded.gitsigns or gitsigns

                local function map(mode, lhs, rhs, opts)
                    local options = { noremap = true, silent = true }
                    if opts then
                        options = vim.tbl_extend("force", options, opts)
                    end
                    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", options, { buffer = bufnr }))
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Next Hunk" })

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Prev Hunk" })

                -- Actions
                map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
                map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
                map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
                map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })
                map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
                map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
                map("n", "<leader>hl", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame Line" })
                map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff This" })
                map("n", "<leader>ht", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Blame" })
            end,
        })
    end,
}
