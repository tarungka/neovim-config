-- lua/theprimeagen/remap.lua
-- Key remappings for Neovim

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Basic operations
map("n", "<leader>s", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>w", ":set wrap!<CR>", { desc = "Toggle line wrap" })

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

-- Buffer management
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
map("n", "<leader>bl", ":ls<CR>", { desc = "List buffers" })

-- Search
map("n", "<leader>h", ":noh<CR>", { desc = "Clear search highlighting" })

-- File explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- LSP keybindings
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show LSP hover info" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Formatting
map("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

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
map(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Search and replace word under cursor" }
)

-- Make file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Go error handling
map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "Go: Insert error handling block" })

-- Disable Ex mode
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Enhanced Telescope keymaps
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
map("n", "<leader>fs", builtin.grep_string, { desc = "Find string under cursor" })
map("n", "<leader>fc", builtin.commands, { desc = "Find commands" })

-- Comments keymaps (using Comment.nvim API)
map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
map(
	"v",
	"<leader>/",
	'<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ desc = "Toggle comment for selection" }
)

-- DAP UI keymaps
map("n", "<leader>dt", function()
	require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
map("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
map("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Start/continue debugging" })
map("n", "<leader>do", function()
	require("dap").step_over()
end, { desc = "Step over" })
map("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "Step into" })
map("n", "<leader>dx", function()
	require("dap").terminate()
end, { desc = "Terminate debug session" })

-- Keybindings for git diff
map("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Diffview Close" })
map("n", "<leader>df", ":DiffviewToggleFiles<CR>", { desc = "Toggle Diff Files" })

-- Keymaps bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Close Buffer" })

return {}
