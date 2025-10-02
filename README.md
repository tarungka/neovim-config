# Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua and lazy.nvim. This setup provides a complete IDE-like experience with LSP support, debugging capabilities, Git integration, AI assistance, and a beautiful UI.

## Features

- 🚀 **Fast startup** with lazy loading via lazy.nvim
- 🔧 **LSP Support** for 15+ languages with Mason auto-installation
- 🐛 **Debugging** with nvim-dap (Python, Go, JavaScript/TypeScript)
- 🎨 **Modern UI** with Catppuccin theme, Lualine, and Bufferline
- 📝 **Smart Autocompletion** with nvim-cmp and snippets
- 🔍 **Fuzzy Finding** with Telescope
- 🌲 **File Explorer** with nvim-tree and Oil
- 🎯 **Git Integration** with Gitsigns, Fugitive, Lazygit, and Diffview
- 🤖 **AI Assistant** with GitHub Copilot
- ⚡ **Enhanced Navigation** with Flash, Harpoon, and smart motions
- 🧪 **Testing** with Neotest (Python, Go, Jest, Vitest)
- 📊 **Code Quality** with none-ls formatters and linters

## Requirements

- Neovim >= 0.9.0
- Git
- Node.js and npm (for language servers)
- ripgrep (for Telescope live grep)
- A Nerd Font (for icons)
- Optional: gh CLI (for GitHub integration)

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone <your-repo-url> ~/.config/nvim

# Run the install script (if available)
cd ~/.config/nvim
./install.sh

# Or just start Neovim - plugins will auto-install
nvim
```

## Plugins

### Plugin Manager & Performance
| Plugin | Description |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Modern plugin manager with lazy loading |
| [impatient.nvim](https://github.com/lewis6991/impatient.nvim) | Speed up startup time |

### LSP & Language Support
| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Quickstart configs for LSP |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Portable package manager for LSP servers |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between mason and lspconfig |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress notifications |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) | Function signature hints |
| [vim-go](https://github.com/fatih/vim-go) | Go language support |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown preview in browser |

**Configured Language Servers:**
- Python (pyright)
- Go (gopls)
- TypeScript/JavaScript (ts_ls)
- Lua (lua_ls)
- Rust (rust_analyzer)
- C/C++ (clangd)
- CSS (cssls)
- Tailwind CSS (tailwindcss)
- Bash (bashls)
- JSON (jsonls)
- YAML (yamlls)
- HTML (html)
- Docker (dockerls)

### Autocompletion
| Plugin | Description |
|--------|-------------|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer completion source |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Path completion source |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) | Command line completion |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Collection of snippets |
| [cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator) | Better sorting for completion |

### Syntax Highlighting & Code Analysis
| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and code analysis |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Show code context at top |
| [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) | Context-aware commenting |
| [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2) | Rainbow parentheses |

### File Navigation & Fuzzy Finding
| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder and picker |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit filesystem like a buffer |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file navigation |
| [flash.nvim](https://github.com/folke/flash.nvim) | Enhanced motion and search |

### UI Enhancements
| Plugin | Description |
|--------|-------------|
| [catppuccin](https://github.com/catppuccin/nvim) | Catppuccin Mocha colorscheme |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Alternative Tokyo Night theme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer/tab line |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons |
| [noice.nvim](https://github.com/folke/noice.nvim) | Better UI for messages and cmdline |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | Notification manager |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) | Color code highlighter |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding popup helper |

### Git Integration
| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations and hunk operations |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git command wrapper |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer |

### Debugging
| Plugin | Description |
|--------|-------------|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI for nvim-dap |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Virtual text for DAP |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Auto-install debug adapters |

**Configured Debug Adapters:**
- Python (debugpy)
- Go (delve)
- JavaScript/TypeScript (js-debug-adapter)

### Code Quality & Testing
| Plugin | Description |
|--------|-------------|
| [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) | Formatting and linting |
| [neotest](https://github.com/nvim-neotest/neotest) | Testing framework |
| [neotest-python](https://github.com/nvim-neotest/neotest-python) | Python test adapter |
| [neotest-go](https://github.com/nvim-neotest/neotest-go) | Go test adapter |
| [neotest-jest](https://github.com/nvim-neotest/neotest-jest) | Jest test adapter |
| [neotest-vitest](https://github.com/marilari88/neotest-vitest) | Vitest test adapter |
| [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) | Better quickfix list |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Pretty diagnostics list |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline window |

### Editing Enhancements
| Plugin | Description |
|--------|-------------|
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart commenting |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close pairs |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text objects |
| [vim-repeat](https://github.com/tpope/vim-repeat) | Repeat plugin actions with . |
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | Better code folding |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO comments |
| [marks.nvim](https://github.com/chentoast/marks.nvim) | Better mark management |

### AI & Modern Features
| Plugin | Description |
|--------|-------------|
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot AI assistant |
| [gp.nvim](https://github.com/Robitx/gp.nvim) | ChatGPT integration (optional) |
| [auto-session](https://github.com/rmagatti/auto-session) | Session management |
| [rest.nvim](https://github.com/rest-nvim/rest.nvim) | HTTP REST client |

### Terminal
| Plugin | Description |
|--------|-------------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Floating terminal |

## Keyboard Shortcuts

**Leader Key:** `Space`

### Insert Mode
| Shortcut | Description |
|----------|-------------|
| `jk` / `jj` | Exit insert mode |
| `<C-J>` | Accept Copilot suggestion |
| `<C-]>` | Next Copilot suggestion |
| `<M-[>` | Previous Copilot suggestion |
| `<Tab>` | Next completion item / expand snippet |
| `<S-Tab>` | Previous completion item |
| `<CR>` | Confirm completion |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |

### File Operations
| Shortcut | Description |
|----------|-------------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>Q` | Quit all without saving |
| `<leader>x` | Make file executable |
| `<leader><leader>` | Reload config |
| `<leader>e` | Toggle file explorer (nvim-tree) |
| `-` | Open parent directory (Oil) |

### Window Management
| Shortcut | Description |
|----------|-------------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

### Buffer Management
| Shortcut | Description |
|----------|-------------|
| `<leader>bd` | Delete buffer |
| `<leader>bn` | New buffer |
| `<leader>bl` | List buffers |
| `[b` / `<S-h>` | Previous buffer |
| `]b` / `<S-l>` | Next buffer |
| `<Tab>` | Next buffer (BufferLine) |
| `<S-Tab>` | Previous buffer (BufferLine) |

### Navigation
| Shortcut | Description |
|----------|-------------|
| `<C-d>` | Page down (centered) |
| `<C-u>` | Page up (centered) |
| `n` | Next search result (centered) |
| `N` | Previous search result (centered) |
| `s` | Flash jump |
| `S` | Flash Treesitter |

### Search & Replace
| Shortcut | Description |
|----------|-------------|
| `<leader>s` | Replace word under cursor |
| `<leader>nh` | Clear search highlights |

### Editing
| Shortcut | Description |
|----------|-------------|
| `J` (visual) | Move selected lines down |
| `K` (visual) | Move selected lines up |
| `<A-j>` | Move line down |
| `<A-k>` | Move line up |
| `J` | Join lines without cursor move |
| `<` (visual) | Indent left (stay in visual) |
| `>` (visual) | Indent right (stay in visual) |
| `<leader>p` (visual) | Paste without yanking |
| `<leader>d` | Delete without yanking |
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>/` | Toggle comment |

### LSP
| Shortcut | Description |
|----------|-------------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `gR` | LSP references (Trouble) |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `<leader>D` | Type definition |
| `<leader>rn` / `<leader>vrn` | Rename symbol |
| `<leader>ca` / `<leader>vca` | Code action |
| `<leader>f` | Format buffer |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>de` / `<leader>vd` | Show diagnostic |
| `<leader>dl` | Diagnostics to location list |
| `<leader>vws` | Workspace symbol |
| `<leader>wa` | Add workspace folder |
| `<leader>wr` | Remove workspace folder |
| `<leader>wl` | List workspace folders |

### Telescope
| Shortcut | Description |
|----------|-------------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fs` | Find string under cursor |
| `<leader>fc` | Find commands |
| `<leader>st` | Search TODOs |

### Git (Gitsigns)
| Shortcut | Description |
|----------|-------------|
| `[c` | Previous hunk |
| `]c` | Next hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` / `<leader>hl` | Blame line |
| `<leader>hd` | Diff this |
| `<leader>ht` / `<leader>tb` | Toggle blame |
| `ih` | Select hunk (text object) |

### Git (Other)
| Shortcut | Description |
|----------|-------------|
| `<leader>lg` | LazyGit |
| `<leader>do` | Diffview open |
| `<leader>dc` | Diffview close |
| `<leader>df` | Toggle diff files |

### Debugging (DAP)
| Shortcut | Description |
|----------|-------------|
| `<leader>dbb` | Toggle breakpoint |
| `<leader>dbc` | Start/continue debugging |
| `<leader>dbo` | Step over |
| `<leader>dbi` | Step into |
| `<leader>dbr` | Open REPL |
| `<leader>dbx` | Terminate debug session |
| `<leader>dbu` | Toggle DAP UI |

### Testing (Neotest)
| Shortcut | Description |
|----------|-------------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run file tests |
| `<leader>td` | Debug nearest test |
| `<leader>ts` | Stop test |
| `<leader>ta` | Attach to test |
| `<leader>to` | Open test output |
| `<leader>tO` | Toggle test output panel |
| `<leader>tS` | Toggle test summary |

### Diagnostics (Trouble)
| Shortcut | Description |
|----------|-------------|
| `<leader>xx` | Toggle Trouble |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `<leader>xt` | TODOs (Trouble) |

### Quickfix & Location Lists
| Shortcut | Description |
|----------|-------------|
| `<leader>co` | Open quickfix list |
| `<leader>cc` | Close quickfix list |
| `<leader>cn` | Next quickfix item |
| `<leader>cp` | Previous quickfix item |
| `<leader>lo` | Open location list |
| `<leader>lc` | Close location list |
| `<leader>ln` / `<leader>k` | Next location item |
| `<leader>lp` / `<leader>j` | Previous location item |

### Terminal
| Shortcut | Description |
|----------|-------------|
| `<C-\>` | Toggle floating terminal |
| `jk` (terminal) | Exit terminal mode |
| `<C-h/j/k/l>` (terminal) | Navigate to window from terminal |

### Other
| Shortcut | Description |
|----------|-------------|
| `<leader>tw` | Toggle line wrap |
| `<leader>to` | Toggle outline (Aerial) |
| `<leader>a` | Harpoon add file |
| `<C-e>` | Harpoon menu |
| `<leader>ss` | Search sessions |
| `<leader>rr` | Run REST request |
| `]t` | Next TODO comment |
| `[t` | Previous TODO comment |

### Language Specific
**Go:**
| Shortcut | Description |
|----------|-------------|
| `<leader>ee` | Insert error handling (if err != nil) |

## Editor Settings

### UI Settings
- Line numbers with relative numbers
- Cursor line highlighting
- Sign column always visible
- 24-bit colors (termguicolors)
- Scroll offset: 8 lines
- Color column at 100 characters

### Editing Behavior
- Tabs: 4 spaces
- Auto and smart indenting
- System clipboard integration (`unnamedplus`)
- Timeout for key sequences: 500ms

### Search Behavior
- Case-insensitive search (smart case)
- Incremental search with highlighting

### File Behavior
- No swap files
- No backup files
- Persistent undo history
- Hidden buffers allowed

## Theme & Appearance

**Colorscheme:** Catppuccin Mocha (auto-detects light/dark mode)

**Statusline (Lualine):**
- Mode indicator
- Git branch and diff stats
- File path
- Diagnostics
- File encoding and format
- Progress and location

**Buffer/Tab Line (Bufferline):**
- Buffer numbers (ordinal)
- LSP diagnostics integration
- Slant separators

## Health Check

Run `:checkhealth` to verify all dependencies are installed correctly.

## Formatters & Linters (none-ls)

**Formatters:**
- Prettier (JS/TS/CSS/HTML/JSON/YAML/Markdown)
- Black (Python)
- Stylua (Lua)
- gofmt/goimports (Go)
- rustfmt (Rust)
- shfmt (Shell)

**Linters:**
- eslint_d (JavaScript/TypeScript)
- flake8 (Python)
- golangci-lint (Go)
- shellcheck (Shell)
- yamllint (YAML)

## Customization

Edit configuration files in `lua/tarun/`:
- `keymaps.lua` - Keyboard shortcuts
- `set.lua` - Editor settings
- `lsp.lua` - LSP configuration
- `lazy.lua` - Plugin list
- `theme.lua` - Colorscheme
- Other plugin-specific configs

## Credits

Configuration inspired by ThePrimeagen, Neovim community, and various dotfiles.

## License

MIT License - Feel free to use and modify!
