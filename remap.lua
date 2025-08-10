-- remap.lua
-- Key remappings for Neovim

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Visual mode line movement
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Join line
map("n", "J", "mzJ`z", { desc = "Join current line with next line" })

-- Scroll and center
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Search and center
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Paste over selection
map("x", "<leader>p", [["_dP]], { desc = "Paste over selection (no clipboard)" })

-- Delete without yanking
map("n", "<leader>d", [["_d]], { desc = "Delete without yanking" })
map("v", "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })

-- Location list navigation
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- Search and replace word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor in the ENTIRE file" })

-- Make file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Reload config
map("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Reload Neovim config" })

-- Go error handling
map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "Go: Insert error handling block" })

-- Disable Ex mode
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Tmux sessionizer
--map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Tmux: New window with sessionizer" })

map("n", "<leader>lg", "<cmd>LazyGit<cr>", {desc = "LazyGit"})

