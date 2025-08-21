-- Centralized Keymaps Configuration
local M = {}

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

M.setup = function()
    -- Leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    map("n", "<Space>", "<Nop>")

    -- Alternative escape mappings (in case Escape is slow or problematic)
    map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
    map("i", "jj", "<Esc>", { desc = "Exit insert mode (alternative)" })

    -- Better window navigation
    map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
    map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
    map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
    map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

    -- Window resizing
    map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
    map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
    map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
    map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

    -- Basic operations
    map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
    map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
    map("n", "<leader>Q", ":qa!<CR>", { desc = "Quit all without saving" })

    -- Buffer navigation
    map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
    map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
    map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
    map("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })

    -- Better indenting
    map("v", "<", "<gv", { desc = "Indent left" })
    map("v", ">", ">gv", { desc = "Indent right" })

    -- Move text up and down
    map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
    map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
    map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
    map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

    -- Better paste
    map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
    map("n", "<leader>d", [["_d]], { desc = "Delete without yanking" })
    map("v", "<leader>d", [["_d]], { desc = "Delete without yanking" })

    -- Search improvements
    map("n", "n", "nzzzv", { desc = "Next search result centered" })
    map("n", "N", "Nzzzv", { desc = "Previous search result centered" })
    map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

    -- Scrolling
    map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
    map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

    -- Join lines
    map("n", "J", "mzJ`z", { desc = "Join lines and maintain cursor position" })

    -- Quickfix and location list
    map("n", "<leader>co", ":copen<CR>", { desc = "Open quickfix list" })
    map("n", "<leader>cc", ":cclose<CR>", { desc = "Close quickfix list" })
    map("n", "<leader>cn", ":cnext<CR>zz", { desc = "Next quickfix item" })
    map("n", "<leader>cp", ":cprev<CR>zz", { desc = "Previous quickfix item" })
    map("n", "<leader>lo", ":lopen<CR>", { desc = "Open location list" })
    map("n", "<leader>lc", ":lclose<CR>", { desc = "Close location list" })
    map("n", "<leader>ln", ":lnext<CR>zz", { desc = "Next location list item" })
    map("n", "<leader>lp", ":lprev<CR>zz", { desc = "Previous location list item" })

    -- Replace word under cursor
    map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

    -- Make file executable
    map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })

    -- Reload config
    map("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Reload config" })

    -- Disable Ex mode
    map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

    -- Telescope keymaps
    local telescope_ok, builtin = pcall(require, "telescope.builtin")
    if telescope_ok then
        map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
        map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
        map("n", "<leader>fs", builtin.grep_string, { desc = "Find string under cursor" })
        map("n", "<leader>fc", builtin.commands, { desc = "Find commands" })
    end

    -- Terminal mappings
    -- Use <C-\><C-n> or jk to exit terminal mode instead of Esc to avoid conflicts
    map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    map("t", "<C-\\><C-n>", [[<C-\><C-n>]], { desc = "Exit terminal mode (alternate)" })
    map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window from terminal" })
    map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to window below from terminal" })
    map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to window above from terminal" })
    map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window from terminal" })

    -- Go specific (if in Go file)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
            map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { buffer = true, desc = "Go: Insert error handling" })
        end,
    })
end

-- LSP Keymaps (to be called on LspAttach)
M.lsp_keymaps = function(bufnr)
    local opts = { buffer = bufnr }
    
    map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
    map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    map("n", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))
    map("n", "<leader>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Type definition" }))
    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
    map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
    map("n", "<leader>f", function()
        vim.lsp.buf.format { async = true }
    end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
    
    -- Diagnostic keymaps
    map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
    map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
    map("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
    map("n", "<leader>dl", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Diagnostics to location list" }))
end

return M