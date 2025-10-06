" === Vim-Plug Initialization ===
call plug#begin('~/.config/nvim/plugged')

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Snippet Support
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Syntax Highlighting & Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
" Plug 'HiPhish/nvim-ts-rainbow2'  " DISABLED: Has query errors in Neovim 0.12

" Golang Support: Using gopls LSP instead of vim-go (removed to avoid conflicts)

" File Explorer
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'  " for file icons
" Plug 'kyazdani42/nvim-material-icon'

" Fuzzy Finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" Status Line
Plug 'nvim-lualine/lualine.nvim'

" Colorscheme
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Misc
Plug 'mfussenegger/nvim-dap'            " Debugging
Plug 'rcarriga/nvim-dap-ui'             " Debugging UI
Plug 'williamboman/mason.nvim'          " LSP/DAP Installer
Plug 'williamboman/mason-lspconfig.nvim'" Lsp
Plug 'jay-babu/mason-nvim-dap.nvim'     " Mason for DAP
Plug 'mfussenegger/nvim-lint'           " Linting
Plug 'stevearc/conform.nvim'            " Formatting
Plug 'windwp/nvim-autopairs'            " brackets matcing

call plug#end()

" ===============================
" Settings
" ===============================

" General Settings
set number             " Show absolute line numbers
set relativenumber     " Show relative line numbers (useful for jumping)
set expandtab          " Use spaces instead of tabs
set shiftwidth=4       " Number of spaces used for indentation
set tabstop=4          " Number of spaces a tab character represents
set softtabstop=4      " Number of spaces when hitting <Tab> in insert mode
set autoindent         " Copy indentation from the previous line
set smartindent        " Smarter indentation for new lines
set termguicolors      " Enable true color support
set cursorline         " Highlight the current line for better visibility
set hidden             " Allow switching buffers without saving
set mouse=a            " Enable mouse support
set scrolloff=8        " Keep 8 lines above/below the cursor while scrolling
set sidescrolloff=8    " Keep 8 columns at the sides while scrolling horizontally
set ignorecase         " Case-insensitive search...
set smartcase          " ... unless uppercase is used in search
set incsearch          " Show search results as you type
set hlsearch           " Highlight search matches
set clipboard=unnamedplus  " Use system clipboard for copy-paste
set splitbelow         " Open horizontal splits below
set splitright         " Open vertical splits to the right
set wildmode=longest,list,full " Better command-line completion
set timeoutlen=500     " Reduce key sequence timeout for faster response

" Quality of Life
set undofile           " Enable persistent undo
set backup             " Enable backups
set backupdir=~/.config/nvim/backup/  " Set backup directory
set swapfile           " Enable swap file (useful for recovery)
set directory=~/.config/nvim/swap/    " Set swap directory

" UI Improvements
set showcmd            " Show incomplete commands
set showmode           " Display mode (insert, normal, etc.)
set ruler              " Show cursor position
set cmdheight=1        " Reduce command-line height
set laststatus=2       " Always show statusline
set signcolumn=yes     " Show sign column (useful for diagnostics)
set list               " Show invisible characters (tabs, spaces, etc.)
set listchars=tab:»·,trail:·,nbsp:␣ " Define symbols for invisible characters

"" Color Scheme
colorscheme catppuccin-mocha " OTHER INSTLLED: tokyonight-night


" ===============================
" Keybindings
" ===============================


" === Keybindings ===
" Note: All keybindings have been moved to lua/tarun/keymaps.lua for better organization
" and to avoid conflicts. This file is kept for legacy purposes only.


" === LSP Configuration ===
lua << EOF
local status, mason = pcall(require, "mason")
if not status then
  print("Failed to load mason: " .. mason)
  return
end
mason.setup()

local status_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_lspconfig then
  print("Failed to load mason-lspconfig: " .. mason_lspconfig)
  return
end
mason_lspconfig.setup({
  ensure_installed = { "pyright", "gopls", "ts_ls" }
})

local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
  settings = {
    gopls = {
      formatting = {
        gofumpt = true,
      },
    },
  },
})

lspconfig.ts_ls.setup({})
lspconfig.pyright.setup({})


local cmp = require('cmp')
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Ensure luasnip works properly
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger completion
    ['<C-e>'] = cmp.mapping.abort(),  -- Abort completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection

    -- 🚀 Faster navigation in autocomplete menu
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- 🔹 LSP suggestions
    { name = 'luasnip' },   -- 🔹 Snippet suggestions
    { name = 'buffer' },    -- 🔹 Buffer words
    { name = 'path' },      -- 🔹 Path completion
  }),
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "javascript", "typescript", "lua", "python" },
  highlight = { enable = true },
  -- rainbow = {
  --     enable = true,
  --     extended_mode = true,
  --     strategy= require("ts-rainbow.strategy.global")
  -- },  -- DISABLED: Has query errors in Neovim 0.12
  indent = { enable = true },
  folds = { enable = true },
  textobjects = { enable = true },
})


require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = true, -- Enable multiwindow support.
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

require("nvim-tree").setup({
  view = {
    width = 30,  -- Adjust width of the file explorer
    side = "left",  -- Set file tree on the left
    adaptive_size = false,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false, -- Directly open files without selecting a window
      },
    },
  },
})


local icons = require("nvim-material-icon").get_icons()

require("nvim-web-devicons").setup({
  override = icons,
})
-- require("nerdfont").setup()

require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        preview_width = 0.6,  -- 60% of the window
        width = 0.9,  -- 90% of the window
        height = 0.8,  -- 80% of the window
      },
    },
    mappings = {
      i = { -- Insert mode keybindings
        ["<C-s>"] = require("telescope.actions").select_horizontal, -- Open in horizontal split
        ["<C-v>"] = require("telescope.actions").select_vertical, -- Open in vertical split
        ["<C-t>"] = require("telescope.actions").select_tab, -- Open in new tab
      },
      n = { -- Normal mode keybindings
        ["<C-s>"] = require("telescope.actions").select_horizontal,
        ["<C-v>"] = require("telescope.actions").select_vertical,
        ["<C-t>"] = require("telescope.actions").select_tab,
      }
    },
    -- Nicer UI with borders
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- Controls if the preview window should close when a selection is made
    previewer = true,
    preview_cutoff = 120,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  },
  picker = {
    find_files = {
        previwer = true
    }
  }
})

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- Keybinding to toggle file tree
-- vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

EOF
