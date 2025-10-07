local M = {}

function M.setup()
    -- Set leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- ============================================
    -- INSERT MODE
    -- ============================================
    map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
    map("i", "jj", "<Esc>", { desc = "Exit insert mode (alternative)" })

    -- ============================================
    -- FILE OPERATIONS
    -- ============================================
    map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
    map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
    map("n", "<leader>Q", ":qa!<CR>", { desc = "Quit all without saving" })
    map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })
    map("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Reload config" })

    -- ============================================
    -- WINDOW MANAGEMENT
    -- ============================================
    -- Window navigation
    map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
    map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
    map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
    map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

    -- Window resizing
    map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
    map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
    map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
    map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

    -- ============================================
    -- BUFFER MANAGEMENT
    -- ============================================
    map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
    map("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
    map("n", "<leader>bl", ":ls<CR>", { desc = "List buffers" })
    map("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
    map("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
    map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
    map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
    -- Removed Tab/Shift-Tab: conflicts with nvim-cmp autocomplete navigation

    -- ============================================
    -- HARPOON (FILE MARKS)
    -- ============================================
    map("n", "<leader>ha", function()
        require("harpoon"):list():add()
    end, { desc = "Harpoon: Add file" })

    map("n", "<leader>ho", function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Open menu" })

    map("n", "<leader>h1", function()
        require("harpoon"):list():select(1)
    end, { desc = "Harpoon: Jump to file 1" })

    map("n", "<leader>h2", function()
        require("harpoon"):list():select(2)
    end, { desc = "Harpoon: Jump to file 2" })

    map("n", "<leader>h3", function()
        require("harpoon"):list():select(3)
    end, { desc = "Harpoon: Jump to file 3" })

    map("n", "<leader>h4", function()
        require("harpoon"):list():select(4)
    end, { desc = "Harpoon: Jump to file 4" })

    map("n", "<leader>hn", function()
        require("harpoon"):list():next()
    end, { desc = "Harpoon: Next file" })

    map("n", "<leader>hp", function()
        require("harpoon"):list():prev()
    end, { desc = "Harpoon: Previous file" })

    -- ============================================
    -- NAVIGATION
    -- ============================================
    map("n", "<C-d>", "<C-d>zz", { desc = "Page down centered" })
    map("n", "<C-u>", "<C-u>zz", { desc = "Page up centered" })
    map("n", "n", "nzzzv", { desc = "Next search result centered" })
    map("n", "N", "Nzzzv", { desc = "Previous search result centered" })
    map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

    -- ============================================
    -- SEARCH & REPLACE
    -- ============================================
    map("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
    -- Removed <leader>h (conflicts with git hunks and harpoon) - use <leader>nh instead

    -- ============================================
    -- EDITING
    -- ============================================
    -- Move lines in visual mode
    map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
    map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

    -- Move lines in normal mode
    map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
    map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

    -- Join lines
    map("n", "J", "mzJ`z", { desc = "Join lines without cursor move" })

    -- Better indenting (stay in visual mode)
    map("v", "<", "<gv", { desc = "Indent left" })
    map("v", ">", ">gv", { desc = "Indent right" })

    -- Paste and delete without yanking
    map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
    map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

    -- System clipboard
    map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
    map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

    -- Disable Ex mode
    map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

    -- ============================================
    -- QUICKFIX & LOCATION LISTS
    -- ============================================
    map("n", "<leader>co", ":copen<CR>", { desc = "Open quickfix list" })
    map("n", "<leader>cc", ":cclose<CR>", { desc = "Close quickfix list" })
    map("n", "<leader>cn", ":cnext<CR>zz", { desc = "Next quickfix item" })
    map("n", "<leader>cp", ":cprev<CR>zz", { desc = "Previous quickfix item" })
    -- Modern bracket-style navigation
    map("n", "[q", ":cprev<CR>zz", { desc = "Previous quickfix item" })
    map("n", "]q", ":cnext<CR>zz", { desc = "Next quickfix item" })

    map("n", "<leader>lo", ":lopen<CR>", { desc = "Open location list" })
    map("n", "<leader>lc", ":lclose<CR>", { desc = "Close location list" })
    map("n", "<leader>ln", ":lnext<CR>zz", { desc = "Next location list item" })
    map("n", "<leader>lp", ":lprev<CR>zz", { desc = "Previous location list item" })
    -- Removed <leader>j/k: duplicates of ln/lp above

    -- ============================================
    -- TOGGLE OPTIONS
    -- ============================================
    map("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle line wrap" })

    -- ============================================
    -- TELESCOPE (if loaded)
    -- ============================================
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

    -- ============================================
    -- TERMINAL
    -- ============================================
    map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    map("t", "<C-\\><C-n>", [[<C-\><C-n>]], { desc = "Exit terminal mode (alternate)" })

    -- Terminal window navigation
    map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window from terminal" })
    map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to window below from terminal" })
    map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to window above from terminal" })
    map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window from terminal" })

    -- ============================================
    -- COMMENTS (handled by Comment.nvim)
    -- ============================================
    map("n", "<leader>/", function()
        require('Comment.api').toggle.linewise.current()
    end, { desc = "Toggle comment" })
    map("v", "<leader>/", function()
        require('Comment.api').toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment for selection" })

    -- ============================================
    -- LANGUAGE SPECIFIC
    -- ============================================
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
            map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { buffer = true, desc = "Go: Insert error handling" })
        end,
    })

    -- ============================================
    -- GIT / LAZYGIT
    -- ============================================
    map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

    -- ============================================
    -- LSP KEYMAPS (attached to LSP clients)
    -- ============================================
    -- These are defined in the on_attach function for LSP
end

-- LSP-specific keymaps (to be called in on_attach)
function M.lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local map = vim.keymap.set

    -- Go to commands
    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
    -- Keep window navigation on <C-k>; expose signature help via insert mode and leader binding
    map("i", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
    map("n", "<leader>K", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

    -- Workspace commands
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))

    -- Code actions and refactoring
    map("n", "<leader>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Type definition" }))
    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))

    -- Formatting
    map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))

    -- Diagnostics - using 'd' prefix for diagnostics
    map("n", "<leader>de", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
    map("n", "<leader>dl", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Diagnostics to location list" }))
    map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
    map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))

    -- Additional LSP functionality
    map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, vim.tbl_extend("force", opts, { desc = "Workspace symbol" }))
end

-- DAP (Debug Adapter Protocol) keymaps - using 'db' prefix to avoid conflicts
function M.dap_keymaps()
    local map = vim.keymap.set

    map("n", "<leader>dbb", function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
    map("n", "<leader>dbc", function() require('dap').continue() end, { desc = "Start/continue debugging" })
    map("n", "<leader>dbo", function() require('dap').step_over() end, { desc = "Step over" })
    map("n", "<leader>dbi", function() require('dap').step_into() end, { desc = "Step into" })
    map("n", "<leader>dbr", function() require('dap').repl.open() end, { desc = "Open REPL" })
    map("n", "<leader>dbx", function() require('dap').terminate() end, { desc = "Terminate debug session" })
    map("n", "<leader>dbu", function() require('dapui').toggle() end, { desc = "Toggle DAP UI" })
end

-- Diffview keymaps - no conflicts with 'do' and 'dc' anymore
function M.diffview_keymaps()
    local map = vim.keymap.set

    map("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
    map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Diffview Close" })
    map("n", "<leader>df", ":DiffviewToggleFiles<CR>", { desc = "Toggle Diff Files" })
end

return M
