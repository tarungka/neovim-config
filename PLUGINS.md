# Neovim Plugin Documentation

Complete documentation of all plugins in this Neovim configuration, including capabilities, keybindings, commands, and integrations.

**Last Updated:** 2025-10-06

---

## Table of Contents

1. [Core Infrastructure](#1-core-infrastructure)
   - [lazy.nvim](#lazynvim)
   - [plenary.nvim](#pleniarynvim)
   - [nui.nvim](#nuinvim)
   - [nvim-web-devicons](#nvim-web-devicons)
2. [LSP & Language Support](#2-lsp--language-support)
   - [nvim-lspconfig](#nvim-lspconfig)
   - [Mason](#mason)
   - [mason-lspconfig](#mason-lspconfig)
   - [mason-nvim-dap](#mason-nvim-dap)
   - [fidget.nvim](#fidgetnvim)
   - [lsp_signature.nvim](#lsp_signaturenvim)
3. [Completion & Snippets](#3-completion--snippets)
   - [nvim-cmp](#nvim-cmp)
   - [LuaSnip](#luasnip)
   - [cmp-nvim-lsp](#cmp-nvim-lsp)
   - [cmp-buffer](#cmp-buffer)
   - [cmp-path](#cmp-path)
   - [cmp-cmdline](#cmp-cmdline)
   - [cmp_luasnip](#cmp_luasnip)
   - [friendly-snippets](#friendly-snippets)
   - [cmp-under-comparator](#cmp-under-comparator)
4. [Debugging](#4-debugging)
   - [nvim-dap](#nvim-dap)
   - [nvim-dap-ui](#nvim-dap-ui)
   - [nvim-nio](#nvim-nio)
   - [nvim-dap-virtual-text](#nvim-dap-virtual-text)
5. [Git Integration](#5-git-integration)
   - [gitsigns.nvim](#gitsignsnvim)
   - [vim-fugitive](#vim-fugitive)
   - [diffview.nvim](#diffviewnvim)
   - [lazygit.nvim](#lazygit-nvim)
6. [File Navigation](#6-file-navigation)
   - [telescope.nvim](#telescopenvim)
   - [nvim-tree.lua](#nvim-treelua)
   - [oil.nvim](#oilnvim)
   - [harpoon](#harpoon)
7. [UI Enhancements](#7-ui-enhancements)
   - [lualine.nvim](#lualinenvim)
   - [bufferline.nvim](#bufferlinenvim)
   - [noice.nvim](#noicenvim)
   - [nvim-notify](#nvim-notify)
   - [which-key.nvim](#which-keynvim)
   - [aerial.nvim](#aerialnvim)
   - [indent-blankline.nvim](#indent-blanklinenvim)
   - [nvim-colorizer.lua](#nvim-colorizerlua)
   - [nvim-ufo](#nvim-ufo)
   - [todo-comments.nvim](#todo-commentsnvim)
8. [Code Quality](#8-code-quality)
   - [none-ls.nvim](#none-lsnvim)
   - [neotest](#neotest)
   - [trouble.nvim](#troublenvim)
   - [nvim-bqf](#nvim-bqf)
9. [Editing](#9-editing)
   - [nvim-autopairs](#nvim-autopairs)
   - [nvim-surround](#nvim-surround)
   - [Comment.nvim](#commentnvim)
   - [flash.nvim](#flashnvim)
   - [vim-repeat](#vim-repeat)
10. [Treesitter](#10-treesitter)
    - [nvim-treesitter](#nvim-treesitter)
    - [nvim-treesitter-context](#nvim-treesitter-context)
    - [nvim-ts-context-commentstring](#nvim-ts-context-commentstring)
11. [Terminal](#11-terminal)
    - [toggleterm.nvim](#toggletermnvim)
12. [AI & LLM](#12-ai--llm)
    - [copilot.vim](#copilotvim)
    - [codeium.vim](#codeiumvim)
    - [gp.nvim](#gpnvim)
13. [Modern Features](#13-modern-features)
    - [auto-session](#auto-session)
    - [session-lens](#session-lens)
    - [rest.nvim](#restnvim)
    - [marks.nvim](#marksnvim)
14. [Themes](#14-themes)
    - [catppuccin](#catppuccin)
    - [tokyonight.nvim](#tokyonightnvim)
15. [Performance](#15-performance)
    - [vim-startuptime](#vim-startuptime)
16. [Quick Reference](#16-quick-reference)

---

## 1. Core Infrastructure

### lazy.nvim
**GitHub:** [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
**Category:** Plugin Manager
**Load Strategy:** Bootstrap on startup
**Description:** Modern plugin manager for Neovim with lazy loading support

#### Capabilities
- Lazy loading plugins by event, command, filetype, or keys
- Automatic plugin installation and updates
- Lock file support for reproducible plugin versions
- Built-in UI for managing plugins
- Performance profiling and startup time optimization
- Parallel installation and updates
- Plugin cleanup of unused plugins
- Support for local plugin development
- Structured config with spec files
- Automatic dependency resolution
- Conditional plugin loading
- Plugin version pinning and rollback
- Built-in health check integration

#### Key Features in Your Config
- Modular plugin configuration with separate files per plugin category
- Lazy loading most plugins for optimal startup performance
- Priority-based loading for critical plugins (Mason, LSP)
- Structured with individual config files in `lua/tarun/` directory

#### Commands
- `:Lazy` - Open lazy.nvim UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing plugins and update
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for updates
- `:Lazy profile` - Show startup profiling
- `:Lazy restore` - Restore plugins to lockfile state
- `:Lazy log` - Show recent updates
- `:Lazy build` - Rebuild plugins

### plenary.nvim
**GitHub:** [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
**Category:** Core Library
**Load Strategy:** Dependency (loaded as needed)
**Description:** Utility library providing common functions for Neovim plugins

#### Capabilities
- Async/await functionality for Lua
- File I/O operations (reading, writing, scanning directories)
- Path manipulation utilities
- Job control for running external commands
- Functional programming utilities (map, filter, reduce)
- Window management helpers
- Test harness for plugin development
- JSON and YAML parsing
- Curl wrapper for HTTP requests
- Popup API for creating floating windows

#### Key Features in Your Config
- Used as dependency for Telescope, Gitsigns, Diffview, and many other plugins
- Provides async operations for better performance

### nui.nvim
**GitHub:** [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)
**Category:** Core Library
**Load Strategy:** Dependency (loaded as needed)
**Description:** UI component library for Neovim plugins

#### Capabilities
- Popup windows with borders and styling
- Input prompts with validation
- Menu components with selection
- Split windows with custom layouts
- Tree components for hierarchical data
- Line and text utilities
- Event handling system
- Layout management
- Virtual text rendering

#### Key Features in Your Config
- Required by Noice.nvim for enhanced UI components
- Provides consistent UI styling across plugins

### nvim-web-devicons
**GitHub:** [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
**Category:** Core Library
**Load Strategy:** Dependency (loaded as needed)
**Description:** File type icons for Neovim plugins

#### Capabilities
- Over 1000+ file type icons
- Filetype detection and icon assignment
- Color-coded icons per file type
- Custom icon definitions
- Default icon fallback
- Support for popular programming languages and tools
- Integration with lualine, nvim-tree, telescope, aerial

#### Key Features in Your Config
- Used by nvim-tree, bufferline, lualine, aerial, trouble, oil
- Provides visual file type identification

---

## 2. LSP & Language Support

### nvim-lspconfig
**GitHub:** [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
**Category:** LSP Configuration
**Load Strategy:** `lazy = false` (loads on startup)
**Description:** Quickstart configurations for Neovim's built-in LSP client

#### Capabilities
- Pre-configured setups for 100+ language servers
- Automatic filetype detection and server activation
- Root directory detection using markers (.git, package.json, etc.)
- Server capability advertisement to clients
- Diagnostic configuration and display
- Code actions, formatting, and refactoring
- Hover documentation and signature help
- Go to definition, references, implementation
- Workspace symbol search
- Inlay hints support (Neovim 0.10+)
- Multiple server support per filetype

#### Key Features in Your Config
- Modern Neovim 0.11+ pattern using `vim.lsp.config()` and `vim.lsp.enable()`
- LspAttach autocmd for keybinding setup
- Enhanced capabilities from nvim-cmp integration

#### Configured Language Servers
| Server | Language | Features Enabled |
|--------|----------|------------------|
| `gopls` | Go | unusedparams, shadow analysis, staticcheck, gofumpt |
| `ts_ls` | TypeScript/JavaScript | Full inlay hints support |
| `pyright` | Python | Type checking (basic), auto search paths |
| `lua_ls` | Lua | Neovim API awareness, workspace library |
| `rust_analyzer` | Rust | Clippy on save, proc macro support |
| `clangd` | C/C++ | Background indexing, clang-tidy, IWYU |
| `cssls` | CSS | Standard features |
| `html` | HTML | Standard features |
| `jsonls` | JSON | Standard features |
| `yamlls` | YAML | Standard features |
| `bashls` | Bash | Standard features |
| `dockerls` | Docker | Standard features |
| `tailwindcss` | Tailwind CSS | Standard features |

#### LSP Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gr` | n | Go to references |
| `K` | n | Hover documentation |
| `<C-k>` | i | Signature help (insert mode) |
| `<leader>K` | n | Signature help (normal mode) |
| `<leader>wa` | n | Add workspace folder |
| `<leader>wr` | n | Remove workspace folder |
| `<leader>wl` | n | List workspace folders |
| `<leader>D` | n | Type definition |
| `<leader>rn` | n | Rename symbol |
| `<leader>ca` | n, v | Code action |
| `<leader>f` | n | Format buffer |
| `<leader>de` | n | Show diagnostic in float |
| `<leader>dl` | n | Diagnostics to location list |
| `[d` | n | Previous diagnostic |
| `]d` | n | Next diagnostic |
| `<leader>vws` | n | Workspace symbol search |

#### Diagnostic Configuration
- Virtual text with source attribution
- Floating windows with rounded borders
- Custom signs: E (Error), W (Warn), H (Hint), I (Info)
- Severity sorting enabled
- Diagnostic auto-popup on cursor hold

### Mason
**GitHub:** [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
**Category:** LSP/DAP/Linter Installer
**Load Strategy:** `lazy = false`, `priority = 50`
**Description:** Portable package manager for LSP servers, DAP adapters, linters, and formatters

#### Capabilities
- Install 200+ LSP servers, DAP adapters, linters, formatters
- Cross-platform support (Windows, macOS, Linux)
- Automatic dependency resolution
- Version management and updates
- Built-in UI for browsing and installing packages
- Health check integration
- Uninstall and cleanup utilities
- Automatic PATH configuration
- Registry system for package definitions

#### Key Features in Your Config
- Loads early with high priority (50) to ensure LSP servers are available
- Simple ASCII icons for package status
- Automatic installation enabled via mason-lspconfig

#### Commands
- `:Mason` - Open Mason UI
- `:MasonUpdate` - Update Mason registry
- `:MasonInstall <package>` - Install a package
- `:MasonUninstall <package>` - Uninstall a package
- `:MasonUninstallAll` - Uninstall all packages
- `:MasonLog` - Show Mason log

### mason-lspconfig
**GitHub:** [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
**Category:** LSP Integration
**Load Strategy:** `lazy = false`, `priority = 49`
**Description:** Bridge between mason.nvim and nvim-lspconfig

#### Capabilities
- Automatic LSP server installation
- Mapping between lspconfig server names and Mason package names
- Ensure installed list for required servers
- Automatic server setup
- Server availability checks

#### Key Features in Your Config
- Ensures 14 LSP servers are installed automatically
- Loads right after Mason with priority 49

#### Auto-installed Servers
- gopls, ts_ls, pyright, lua_ls, rust_analyzer
- clangd, cssls, tailwindcss, bashls
- jsonls, yamlls, html, dockerls

### mason-nvim-dap
**GitHub:** [jay-babu/mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)
**Category:** DAP Integration
**Load Strategy:** `lazy = false`, `priority = 48`
**Description:** Bridge between mason.nvim and nvim-dap

#### Capabilities
- Automatic DAP adapter installation
- Mapping between DAP adapter names and Mason packages
- Ensure installed list for debug adapters
- Automatic adapter configuration

#### Key Features in Your Config
- Ensures 3 debug adapters are installed: delve (Go), python, js-debug-adapter
- Loads after mason-lspconfig with priority 48

### fidget.nvim
**GitHub:** [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
**Category:** LSP Enhancement
**Load Strategy:** `event = "LspAttach"`
**Description:** Standalone UI for LSP progress notifications

#### Capabilities
- Real-time LSP progress messages
- Non-intrusive bottom-right notifications
- Animated spinner during LSP operations
- Automatic cleanup on completion
- Multiple concurrent progress tracking
- Configurable display timing and styling
- Integration with nvim-notify
- Low performance overhead

#### Key Features in Your Config
- Legacy tag for stable version
- Dots spinner animation
- Positioned at bottom-right corner
- No background blend
- 2000ms decay for completed tasks

#### LSP Operations Tracked
- Server initialization
- Workspace indexing
- File analysis
- Code actions computation
- Diagnostics generation

### lsp_signature.nvim
**GitHub:** [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
**Category:** LSP Enhancement
**Load Strategy:** `event = "VeryLazy"`
**Description:** Function signature hint as you type

#### Capabilities
- Floating signature help window
- Parameter highlighting
- Real-time signature updates as you type
- Multiple signature support for overloaded functions
- Customizable appearance
- Integration with LSP signature help
- Automatic positioning near cursor
- Virtual text hints (disabled in config)

#### Key Features in Your Config
- Rounded border style
- Floating window enabled
- Active parameter highlighting
- Hint text disabled for cleaner UI
- Auto-triggered on parameter changes

---

## 3. Completion & Snippets

### nvim-cmp
**GitHub:** [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
**Category:** Completion Engine
**Load Strategy:** Loaded via autocomplete module
**Description:** Completion plugin with extensible source system

#### Capabilities
- Multiple completion sources (LSP, buffer, path, snippets)
- Customizable completion menu
- Snippet expansion support
- Fuzzy matching
- LSP kind icons
- Documentation preview
- Ghost text for suggestions
- Cmdline completion (/, :, ?)
- Sorting and filtering
- Custom comparators
- Buffer-local sources
- Completion triggers

#### Key Features in Your Config
- Tab/Shift-Tab for navigation
- Integration with LuaSnip for snippet expansion
- Rounded borders on completion window
- Custom sorting with underscore comparator
- Source indicators: [LSP], [Snip], [Buf], [Path]

#### Completion Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<C-b>` | i | Scroll docs up |
| `<C-f>` | i | Scroll docs down |
| `<C-Space>` | i | Trigger completion |
| `<C-e>` | i | Abort completion |
| `<CR>` | i | Confirm selection |
| `<Tab>` | i, s | Next item / snippet jump |
| `<S-Tab>` | i, s | Previous item / snippet jump |

#### Cmdline Completion Features
- **Search (/)**: Buffer completion with 3-char minimum
- **Command (:)**: Path and command completion with custom icons
- Icon indicators for different command types (Telescope, Mason, Lazy, etc.)
- Ghost text in command mode
- Tab/Shift-Tab navigation

### LuaSnip
**GitHub:** [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
**Category:** Snippet Engine
**Load Strategy:** Dependency of nvim-cmp
**Description:** Snippet engine written in Lua

#### Capabilities
- VSCode-style snippets support
- Dynamic snippet creation
- Nested snippets
- Choice nodes for alternatives
- Function nodes for dynamic text
- Regex transformations
- Multi-language support
- Jump to snippet placeholders
- Snippet expansion in completion
- Custom snippet loading

#### Key Features in Your Config
- Loaded from friendly-snippets collection
- Integrated with nvim-cmp
- Tab to expand and jump forward
- Shift-Tab to jump backward

### cmp-nvim-lsp
**GitHub:** [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
**Category:** Completion Source
**Load Strategy:** Dependency of nvim-cmp
**Description:** LSP completion source for nvim-cmp

#### Capabilities
- LSP completion items
- Method signatures
- Variable types
- Documentation strings
- Additional text edits
- Snippet support
- Kind icons for completion items
- Priority sorting
- Preselect support

### cmp-buffer
**GitHub:** [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
**Category:** Completion Source
**Load Strategy:** Dependency of nvim-cmp
**Description:** Buffer word completion source

#### Capabilities
- Current buffer word completion
- All visible buffers option
- Keyword extraction
- Configurable keyword length
- Indexing strategies

### cmp-path
**GitHub:** [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
**Category:** Completion Source
**Load Strategy:** Dependency of nvim-cmp
**Description:** File path completion source

#### Capabilities
- File and directory path completion
- Relative and absolute paths
- Trailing slash for directories
- Home directory expansion
- Environment variable expansion

#### Key Features in Your Config
- Trailing slash enabled for directories
- Label trailing slash for visual clarity

### cmp-cmdline
**GitHub:** [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
**Category:** Completion Source
**Load Strategy:** Dependency of nvim-cmp
**Description:** Command-line completion source

#### Capabilities
- Ex command completion
- Command arguments
- Custom command support
- Ignore specific commands

#### Key Features in Your Config
- Ignores Man and ! commands
- 2-character minimum for activation
- Custom icons for common commands

### cmp_luasnip
**GitHub:** [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
**Category:** Completion Source
**Load Strategy:** Dependency of nvim-cmp
**Description:** LuaSnip completion source for nvim-cmp

#### Capabilities
- Snippet completion items
- Snippet previews
- Integration with snippet engine
- Snippet priority handling

### friendly-snippets
**GitHub:** [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
**Category:** Snippet Collection
**Load Strategy:** Dependency of nvim-cmp
**Description:** Collection of VSCode-style snippets for multiple languages

#### Capabilities
- 40+ language snippet collections
- Common programming patterns
- Framework-specific snippets (React, Vue, etc.)
- Documentation templates
- Test boilerplate
- Import statements

### cmp-under-comparator
**GitHub:** [lukas-reineke/cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator)
**Category:** Completion Utility
**Load Strategy:** Dependency of nvim-cmp
**Description:** Sorts completion items with underscores lower

#### Capabilities
- Better sorting for items with underscores
- Prioritizes non-underscore items
- Commonly used for LSP private members

---

## 4. Debugging

### nvim-dap
**GitHub:** [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
**Category:** Debug Adapter Protocol
**Load Strategy:** Loaded via dap module
**Description:** Debug Adapter Protocol client for Neovim

#### Capabilities
- Debug multiple languages through DAP
- Breakpoint management
- Step debugging (over, into, out)
- Variable inspection
- Watch expressions
- REPL console
- Call stack navigation
- Conditional breakpoints
- Log points
- Exception breakpoints
- Multi-session debugging
- Remote debugging

#### Key Features in Your Config
- Auto-open dap-ui on debug start
- Auto-close dap-ui on debug end
- Configured for Python (debugpy), Go (delve), JavaScript/TypeScript (js-debug-adapter)

#### Debug Adapters Configured
| Language | Adapter | Configuration |
|----------|---------|---------------|
| Python | debugpy | Launch file mode |
| Go | delve | Debug and test modes |
| JavaScript | pwa-node | Launch file mode |
| TypeScript | pwa-node | Same as JavaScript |

#### DAP Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>dbb` | n | Toggle breakpoint |
| `<leader>dbc` | n | Start/continue debugging |
| `<leader>dbo` | n | Step over |
| `<leader>dbi` | n | Step into |
| `<leader>dbr` | n | Open REPL |
| `<leader>dbx` | n | Terminate session |
| `<leader>dbu` | n | Toggle DAP UI |

### nvim-dap-ui
**GitHub:** [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
**Category:** Debug UI
**Load Strategy:** Dependency of nvim-dap
**Description:** UI for nvim-dap with scopes, breakpoints, stack frames, and console

#### Capabilities
- Scopes view for variables
- Watch expressions window
- Stack frames navigation
- Breakpoints list
- Console output
- REPL integration
- Hover evaluation
- Customizable layouts
- Multiple window configurations
- Element inspection

#### Key Features in Your Config
- Simple ASCII icons (>, v, *)
- Expand with Enter or double-click
- Keyboard shortcuts for common operations
- Auto-opens on debug start

#### UI Components
- **Scopes**: Local and global variables
- **Breakpoints**: All breakpoints across files
- **Stacks**: Call stack frames
- **Console**: Debug output and REPL
- **Watches**: Custom watch expressions

### nvim-nio
**GitHub:** [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio)
**Category:** Async Library
**Load Strategy:** Dependency of nvim-dap-ui
**Description:** Async I/O library for Neovim plugins

#### Capabilities
- Async/await for Lua
- Non-blocking I/O operations
- Coroutine management
- Process spawning
- File system operations
- Testing utilities

### nvim-dap-virtual-text
**GitHub:** [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
**Category:** Debug Enhancement
**Load Strategy:** Dependency of nvim-dap
**Description:** Virtual text support for nvim-dap

#### Capabilities
- Inline variable values during debugging
- Expression evaluation in virtual text
- Customizable text format
- Highlight groups
- Auto-refresh on debug events

---

## 5. Git Integration

### gitsigns.nvim
**GitHub:** [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
**Category:** Git Signs
**Load Strategy:** `event = "BufReadPre"`
**Description:** Git integration with signs, hunks, and blame

#### Capabilities
- Git diff signs in sign column
- Hunk navigation and preview
- Stage and reset hunks
- Inline git blame
- Hunk text objects
- Status line integration
- Diff view for hunks
- Line/file staging
- Integration with trouble.nvim and telescope
- Real-time git status updates
- Untracked file indicators
- Word diff support

#### Key Features in Your Config
- Simple line characters for signs (│, _, ‾, ~, ┆)
- Inline blame enabled by default
- Blame format: " <author> • <summary> "
- Hunk navigation with ]c and [c

#### Git Sign Indicators
| Sign | Meaning |
|------|---------|
| │ | Added line |
| │ | Changed line |
| _ | Deleted line |
| ‾ | Top delete |
| ~ | Change delete |
| ┆ | Untracked |

#### Gitsigns Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `]c` | n | Next hunk |
| `[c` | n | Previous hunk |
| `<leader>hs` | n, v | Stage hunk |
| `<leader>hr` | n, v | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hR` | n | Reset buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hl` | n | Blame line |
| `<leader>hd` | n | Diff this |
| `<leader>ht` | n | Toggle blame |

#### Commands
- `:Gitsigns stage_hunk` - Stage current hunk
- `:Gitsigns reset_hunk` - Reset current hunk
- `:Gitsigns stage_buffer` - Stage entire buffer
- `:Gitsigns reset_buffer` - Reset entire buffer
- `:Gitsigns preview_hunk` - Preview hunk in float
- `:Gitsigns blame_line` - Show blame for line
- `:Gitsigns diffthis` - Diff current file
- `:Gitsigns toggle_signs` - Toggle signs
- `:Gitsigns toggle_current_line_blame` - Toggle inline blame

### vim-fugitive
**GitHub:** [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
**Category:** Git Command Interface
**Load Strategy:** `cmd` (lazy loaded on Git commands)
**Description:** Premier Git plugin for Vim - the Git command wrapper

#### Capabilities
- Complete Git command interface from Neovim
- Git status browser with file staging
- Commit interface
- Diff split views (horizontal/vertical)
- Git blame annotations
- Branch management
- Merge conflict resolution
- Git log browsing
- Rebase interactive support
- Git object browsing (:Gedit, :Gread)
- Ggrep for git-aware searching
- Tab completion for git commands
- Integration with quickfix and location lists

#### Fugitive Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>gs` | n | Git status |
| `<leader>gc` | n | Git commit |
| `<leader>gp` | n | Git push |
| `<leader>gl` | n | Git pull |
| `<leader>gf` | n | Git fetch |
| `<leader>gb` | n | Git blame |
| `<leader>gd` | n | Git diff (horizontal) |
| `<leader>gD` | n | Git diff (vertical) |
| `<leader>gr` | n | Reset file (Git read) |
| `<leader>gw` | n | Stage file (Git write) |

#### Commands
- `:Git` or `:G` - Run any git command
- `:Git status` - Open git status window
- `:Git commit` - Open commit window
- `:Git push` - Push to remote
- `:Git pull` - Pull from remote
- `:Git blame` - Show blame annotations
- `:Gdiffsplit` - Horizontal diff split
- `:Gvdiffsplit` - Vertical diff split
- `:Gread` - Reset file to index version
- `:Gwrite` - Stage current file
- `:Ggrep` - Git grep
- `:Gmove` - Git mv
- `:Gdelete` - Git rm
- `:Gbrowse` - Open in browser (with rhubarb.vim)

#### Git Status Window Shortcuts
- `s` - Stage file/hunk
- `u` - Unstage file/hunk
- `-` - Toggle stage/unstage
- `=` - Toggle inline diff
- `dd` - Perform diff
- `cc` - Create commit
- `ca` - Amend commit
- `<CR>` - Open file

### diffview.nvim
**GitHub:** [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)
**Category:** Git Diff Viewer
**Load Strategy:** `cmd` (lazy loaded on commands)
**Description:** Single tabpage interface for cycling through diffs

#### Capabilities
- Tabpage-based diff viewer
- File history browsing
- Merge conflict resolution UI
- Multiple diff layouts
- File panel with tree view
- Cycle through changed files
- View diffs for any git revision
- Compare branches
- Stage/unstage from diff view
- Fold unchanged sections
- Integration with gitsigns
- Customizable views and layouts

#### Diffview Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>do` | n | Diffview open |
| `<leader>dc` | n | Diffview close |
| `<leader>df` | n | Toggle diff files |

#### Commands
- `:DiffviewOpen` - Open diff view
- `:DiffviewOpen HEAD~2` - Diff against specific commit
- `:DiffviewOpen HEAD~4..HEAD~2` - Diff range
- `:DiffviewClose` - Close diff view
- `:DiffviewToggleFiles` - Toggle file panel
- `:DiffviewFocusFiles` - Focus file panel
- `:DiffviewRefresh` - Refresh view
- `:DiffviewFileHistory` - File history
- `:DiffviewFileHistory %` - Current file history
- `:DiffviewFileHistory --range=origin/main` - History from branch

#### Diff View Navigation
- `]c` - Next hunk
- `[c` - Previous hunk
- `<tab>` - Cycle through files
- `<S-tab>` - Cycle backwards

### lazygit.nvim
**GitHub:** [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
**Category:** Git TUI Integration
**Load Strategy:** `cmd` and `keys`
**Description:** Plugin for calling lazygit from within Neovim

#### Capabilities
- Full lazygit TUI in floating window
- File-specific lazygit views
- Filter commits by file
- Integration with Neovim's terminal
- Return to Neovim on exit
- Project root detection
- Custom lazygit config support

#### Lazygit Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>lg` | n | Open LazyGit |

#### Commands
- `:LazyGit` - Open lazygit in floating window
- `:LazyGitConfig` - Open lazygit config
- `:LazyGitCurrentFile` - Open lazygit for current file
- `:LazyGitFilter` - Open lazygit with commit filter
- `:LazyGitFilterCurrentFile` - Filter commits for current file

---

## 6. File Navigation

### telescope.nvim
**GitHub:** [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
**Category:** Fuzzy Finder
**Load Strategy:** Loaded via telescope module
**Description:** Highly extendable fuzzy finder over lists

#### Capabilities
- Fuzzy file finding
- Live grep with regex support
- Buffer switching
- Help tag search
- Command palette
- Git integration (commits, branches, status)
- LSP integration (references, symbols, diagnostics)
- Quickfix and location list
- Vim options and highlights
- Colorscheme picker
- Extensible with custom pickers
- Preview window for most pickers
- Multi-selection support
- Smart history
- Custom layouts and themes

#### Key Features in Your Config
- Horizontal layout with 60% preview width
- 90% screen width, 80% height
- Custom border characters (rounded style)
- File ignore patterns: node_modules, .git, vendor, __pycache__, dist
- Hidden files enabled in find_files
- Hidden files in live_grep with --hidden flag

#### Telescope Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Live grep |
| `<leader>fb` | n | Find buffers |
| `<leader>fh` | n | Help tags |
| `<leader>fr` | n | Recent files |
| `<leader>fs` | n | Find string under cursor |
| `<leader>fc` | n | Find commands |

#### Telescope Window Mappings
| Key | Mode | Action |
|-----|------|--------|
| `<C-s>` | i, n | Open in horizontal split |
| `<C-v>` | i, n | Open in vertical split |
| `<C-t>` | i, n | Open in new tab |
| `<Esc>` | i | Close telescope |

#### Commands
- `:Telescope find_files` - Find files
- `:Telescope live_grep` - Live grep
- `:Telescope buffers` - List buffers
- `:Telescope help_tags` - Search help
- `:Telescope oldfiles` - Recent files
- `:Telescope commands` - Command palette
- `:Telescope git_commits` - Git commits
- `:Telescope git_branches` - Git branches
- `:Telescope git_status` - Git status
- `:Telescope lsp_references` - LSP references
- `:Telescope lsp_definitions` - LSP definitions
- `:Telescope lsp_workspace_symbols` - Workspace symbols
- `:Telescope diagnostics` - LSP diagnostics
- `:Telescope treesitter` - Treesitter symbols
- `:Telescope colorscheme` - Preview colorschemes

### nvim-tree.lua
**GitHub:** [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
**Category:** File Explorer
**Load Strategy:** Loaded via lazy.nvim
**Description:** File explorer tree for Neovim

#### Capabilities
- Tree-style file explorer
- File operations (create, delete, rename, copy, paste)
- Git integration with status icons
- Diagnostics integration
- Buffer-synced file highlighting
- Bookmarks and recent files
- Trash support
- Custom filters
- Live folder tracking
- Custom sorting
- Collapse/expand folders
- Search in tree
- System actions (open with default app)

#### Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | n | Toggle nvim-tree |

#### Default Tree Mappings
- `<CR>` - Open file/expand folder
- `o` - Open file/folder
- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `x` - Cut file
- `c` - Copy file
- `p` - Paste file
- `y` - Copy name
- `Y` - Copy relative path
- `gy` - Copy absolute path
- `R` - Refresh tree
- `I` - Toggle ignored files
- `H` - Toggle hidden files
- `W` - Collapse all

### oil.nvim
**GitHub:** [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
**Category:** File Manager
**Load Strategy:** `cmd` and `keys`
**Description:** Edit your filesystem like a buffer

#### Capabilities
- Buffer-like file editing interface
- Modify multiple files in bulk
- Create/delete/rename with normal mode editing
- Trash integration
- Column display (permissions, size, mtime)
- Preview files before opening
- Split/vsplit/tab opening
- Hidden file toggle
- Sort by type/name/size/mtime
- Undo/redo file operations
- Change directory navigation
- External program integration

#### Key Features in Your Config
- Trash deletion enabled
- Columns: icon, permissions, size, mtime
- 2-second cleanup delay
- Not set as default file explorer (nvim-tree is default)

#### Oil Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `-` | n | Open parent directory |

#### Oil Internal Mappings
| Key | Action |
|-----|--------|
| `<CR>` | Select entry |
| `<C-s>` | Open in vertical split |
| `<C-h>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `<C-p>` | Preview file |
| `<C-c>` | Close oil |
| `<C-l>` | Refresh |
| `-` | Go to parent directory |
| `_` | Open cwd |
| `` ` `` | Change directory |
| `~` | Change directory (tab-local) |
| `gs` | Change sort order |
| `gx` | Open with external program |
| `g.` | Toggle hidden files |
| `g\` | Toggle trash |
| `g?` | Show help |

### harpoon
**GitHub:** [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
**Branch:** harpoon2
**Category:** File Navigation
**Load Strategy:** Loaded via harpoon module
**Description:** Quick file navigation marks

#### Capabilities
- Mark files for quick access
- Quick menu for marked files
- Per-project file lists
- Numbered file navigation
- Persistent marks across sessions
- Terminal integration
- Custom mark lists
- Branch-aware marking

#### Key Features in Your Config
- Using harpoon2 branch (latest version)
- Simple add and toggle menu bindings

#### Harpoon Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>a` | n | Add file to harpoon |
| `<C-e>` | n | Toggle harpoon menu |

#### Harpoon Workflow
1. Mark frequently accessed files with `<leader>a`
2. Open quick menu with `<C-e>`
3. Navigate between marked files instantly
4. Remove marks from menu
5. Marks persist per project

---

## 7. UI Enhancements

### lualine.nvim
**GitHub:** [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
**Category:** Statusline
**Load Strategy:** `lazy = false`, `priority = 1000`
**Description:** Fast and easy to configure statusline plugin

#### Capabilities
- Modular statusline components
- Git integration (branch, diff)
- LSP diagnostics
- File encoding and format
- Mode indicator
- Custom components
- Themes support
- Inactive window statusline
- Tab line support
- Per-filetype customization

#### Key Features in Your Config
- Catppuccin theme
- Minimal separators (clean look)
- Icons enabled
- Relative path for filename

#### Statusline Sections
| Section | Components |
|---------|------------|
| A | Mode |
| B | Git branch |
| C | Filename (relative path), diff (git changes) |
| X | Diagnostics, encoding, fileformat, filetype |
| Y | Progress |
| Z | Location (line:col) |

#### Diff Indicators
- Added:
- Modified: 📝
- Removed:

### bufferline.nvim
**GitHub:** [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
**Category:** Buffer Tabs
**Load Strategy:** Loaded via bufferline module
**Description:** Snazzy buffer line with tabpage integration

#### Capabilities
- Buffer tabs display
- LSP diagnostics per buffer
- Git status per buffer
- Ordinal/absolute/both numbering
- Buffer reordering
- Groups and pinning
- Custom sorting
- Close buttons
- Separator styles
- Click to select buffer
- Right-click menu
- Duplicate file indicators

#### Key Features in Your Config
- Ordinal numbers (1, 2, 3...)
- LSP diagnostics integration
- Buffer and close icons enabled
- Slant separator style

#### Buffer Navigation
| Key | Mode | Action |
|-----|------|--------|
| `<S-h>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `[b` | n | Previous buffer |
| `]b` | n | Next buffer |

### noice.nvim
**GitHub:** [folke/noice.nvim](https://github.com/folke/noice.nvim)
**Category:** UI Replacement
**Load Strategy:** `event = "VeryLazy"`
**Description:** Experimental plugin that replaces UI for messages, cmdline, and popupmenu

#### Capabilities
- Enhanced command line UI
- Better message display
- LSP progress integration
- Search UI improvements
- Notification routing
- Signature help enhancement
- Documentation views
- Message history
- Redirect long messages to split
- Customizable views
- Message filtering and routing

#### Key Features in Your Config
- Bottom search enabled
- Command palette enabled
- Long messages to split
- LSP hover and documentation enabled
- LSP signature disabled (using lsp_signature.nvim instead)
- LSP progress disabled (using fidget.nvim instead)
- Popupmenu disabled (using cmp-cmdline instead)
- Classic cmdline view
- Notifications through nvim-notify

#### Commands
- `:Noice` - Show message history
- `:Noice history` - Show message history in split
- `:Noice last` - Show last message
- `:Noice errors` - Show error messages
- `:Noice dismiss` - Dismiss all notifications
- `:Noice telescope` - Browse messages in telescope

### nvim-notify
**GitHub:** [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
**Category:** Notification Manager
**Load Strategy:** `event = "VeryLazy"`
**Description:** Fancy notification manager for Neovim

#### Capabilities
- Animated notifications
- Multiple notification stages (fade, slide, static)
- Icons for notification levels
- Timeout configuration
- Notification history
- Custom renderers
- Background color support
- Max dimensions
- Integration with noice.nvim
- LSP progress notifications
- Plugin notifications

#### Key Features in Your Config
- Fade in slide out animation
- 3-second timeout
- Default renderer
- Dark background color
- 80-char max width, 10-line max height
- Set as default vim.notify

#### Notification Levels
- ERROR - Critical errors
- WARN - Warnings
- INFO - Information
- DEBUG - Debug messages
- TRACE - Verbose trace

### which-key.nvim
**GitHub:** [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
**Category:** Key Helper
**Load Strategy:** `event = "VeryLazy"`
**Description:** Displays popup with possible keybindings

#### Capabilities
- Automatic keybinding popup
- Custom descriptions
- Group labels
- Operator-pending hints
- Built-in mappings support
- Spelling suggestions
- Custom delay configuration
- Icon support
- Hierarchical display
- Search in which-key
- Integration with all plugins

#### Key Features in Your Config
- Spelling plugin enabled
- Rounded border
- Auto-displays after typing leader key

#### Key Groups (Auto-detected)
- `<leader>f` - Find (Telescope)
- `<leader>g` - Git
- `<leader>h` - Git Hunks
- `<leader>d` - Diagnostics/Debug/Diffview
- `<leader>l` - LSP/Location
- `<leader>t` - Test/Toggle
- `<leader>x` - Trouble/Diagnostics
- `<leader>w` - Workspace
- `<leader>c` - Code/Quickfix
- `<leader>b` - Buffer
- `<leader>s` - Search/Session

### aerial.nvim
**GitHub:** [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)
**Category:** Code Outline
**Load Strategy:** `lazy = false`
**Description:** Code outline window for skimming and quick navigation

#### Capabilities
- Symbol tree view
- LSP symbol support
- Treesitter symbol support
- Jump to symbol
- Symbol filtering by type
- Automatic outline updates
- Highlight current symbol
- Guide lines
- Custom symbol icons
- Fold/unfold sections
- Search symbols
- Integration with telescope and fzf-lua

#### Key Features in Your Config
- Right-side layout
- 28-character minimum width
- Guide lines enabled

#### Aerial Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>to` | n | Toggle outline |

#### Aerial Window Mappings
- `<CR>` - Jump to symbol
- `o` - Jump to symbol
- `q` - Close aerial
- `[y` - Jump to previous symbol
- `]y` - Jump to next symbol
- `{` - Jump to previous symbol (same level)
- `}` - Jump to next symbol (same level)
- `za` - Toggle fold
- `zM` - Close all folds
- `zR` - Open all folds

#### Commands
- `:AerialToggle` - Toggle aerial window
- `:AerialOpen` - Open aerial window
- `:AerialClose` - Close aerial window
- `:AerialNavToggle` - Toggle navigation mode
- `:AerialInfo` - Show aerial information

### indent-blankline.nvim
**GitHub:** [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
**Category:** Visual Aid
**Load Strategy:** Loaded via ui-enhancements
**Description:** Indentation guides with scope highlighting

#### Capabilities
- Indent guides for all lines
- Current scope highlighting
- Custom characters per level
- Treesitter integration
- Multiple indent levels
- Exclude specific filetypes
- Rainbow indents
- Animation support
- Context-aware indentation

#### Key Features in Your Config
- Vertical bar character (│)
- Scope enabled with start/end highlighting
- Excluded filetypes: help, dashboard, neo-tree, Trouble, lazy, mason, notify, toggleterm

### nvim-colorizer.lua
**GitHub:** [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)
**Category:** Color Preview
**Load Strategy:** `event = { "BufReadPre", "BufNewFile" }`
**Description:** High-performance color highlighter

#### Capabilities
- RGB color highlighting (#RGB)
- RRGGBB color highlighting (#RRGGBB)
- Named colors (red, blue, etc.)
- Tailwind color support
- CSS functions (rgb(), hsl())
- SASS color variables
- Background or foreground coloring
- Virtual text mode
- Custom filetypes
- Real-time updates

#### Key Features in Your Config
- Enabled for all filetypes
- RGB and RRGGBB support
- Named colors enabled
- Background mode highlighting
- Virtual text marker: ■

### nvim-ufo
**GitHub:** [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
**Category:** Folding
**Load Strategy:** Loaded via ui-enhancements
**Description:** Ultra fold with modern folding capabilities

#### Capabilities
- Treesitter-based folding
- LSP folding support
- Indent-based fallback
- Fold preview
- Virtual text for folded content
- Customizable fold text
- Performance optimizations
- Multi-provider folding
- Peek into folds without opening

#### Key Features in Your Config
- Fold column enabled (1 char wide)
- Folds start fully open (level 99)
- Treesitter provider with indent fallback
- Custom K mapping: peek fold or LSP hover

#### UFO Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `zR` | n | Open all folds |
| `zM` | n | Close all folds |
| `zr` | n | Open folds (except specific kinds) |
| `zm` | n | Close folds with level |
| `K` | n | Peek fold or LSP hover |

### todo-comments.nvim
**GitHub:** [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
**Category:** Visual Aid
**Load Strategy:** `event = { "BufReadPost", "BufNewFile" }`
**Description:** Highlight and search TODO comments

#### Capabilities
- Highlight TODO, FIXME, HACK, etc.
- Custom keywords and colors
- Search across workspace
- Telescope integration
- Trouble integration
- Jump to next/previous todo
- List all todos
- Quickfix integration
- Custom patterns
- Multi-line comment support

#### Key Features in Your Config
- Keywords: FIX, TODO, HACK, WARN, PERF, NOTE, TEST
- Custom icons and colors per keyword
- ripgrep integration for search
- 400-char max line length

#### Todo Comment Keywords
| Keyword | Icon | Color | Aliases |
|---------|------|-------|---------|
| FIX |   | error | FIXME, BUG, FIXIT, ISSUE |
| TODO |   | info | - |
| HACK |   | warning | - |
| WARN |   | warning | WARNING, XXX |
| PERF |   | - | OPTIM, PERFORMANCE, OPTIMIZE |
| NOTE |   | hint | INFO |
| TEST | ⏲  | test | TESTING, PASSED, FAILED |

#### Todo Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `]t` | n | Next todo comment |
| `[t` | n | Previous todo comment |
| `<leader>xt` | n | Todos in Trouble |
| `<leader>xT` | n | TODO/FIX/FIXME in Trouble |
| `<leader>st` | n | Search todos in Telescope |
| `<leader>sT` | n | Search TODO/FIX/FIXME |

#### Commands
- `:TodoTrouble` - Open todos in Trouble
- `:TodoTelescope` - Search todos in Telescope
- `:TodoQuickFix` - Open todos in quickfix
- `:TodoLocList` - Open todos in location list

---

## 8. Code Quality

### none-ls.nvim
**GitHub:** [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
**Category:** Linting & Formatting
**Load Strategy:** Loaded via code-quality module
**Description:** Use Neovim as a language server for linting and formatting

#### Capabilities
- Multiple formatter support
- Linter integration
- Code actions from external tools
- Custom source creation
- Conditional source enabling
- Integration with LSP
- Format on save
- Range formatting
- Diagnostics from external tools

#### Key Features in Your Config
- Formatters: prettier, black, stylua, goimports, rustfmt, shfmt
- Diagnostics: eslint_d, flake8, golangci_lint, shellcheck, yamllint
- Code actions: eslint_d, gitsigns
- Conditional eslint_d based on config file presence

#### Formatters Configured
| Tool | Languages |
|------|-----------|
| prettier | JavaScript, TypeScript, React, Vue, CSS, HTML, JSON, YAML, Markdown, GraphQL |
| black | Python (with --fast flag) |
| stylua | Lua |
| goimports | Go |
| rustfmt | Rust |
| shfmt | Shell scripts |

#### Linters Configured
| Tool | Language | Notes |
|------|----------|-------|
| eslint_d | JavaScript/TypeScript | Only if .eslintrc exists |
| flake8 | Python | Max line length 100 |
| golangci_lint | Go | - |
| shellcheck | Bash/Shell | - |
| yamllint | YAML | - |

#### None-ls Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>lf` | n | Format buffer |

### neotest
**GitHub:** [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest)
**Category:** Test Runner
**Load Strategy:** Loaded via code-quality module
**Description:** Extensible framework for interacting with tests

#### Capabilities
- Run tests from Neovim
- Test discovery
- Real-time test results
- Test debugging with DAP
- Test output viewing
- Test summary panel
- Virtual text results
- Status signs
- Multi-adapter support
- Watch mode
- File tree view of tests

#### Key Features in Your Config
- Adapters: Python (pytest), Go, Jest, Vitest
- Status signs enabled
- Virtual text disabled
- Custom icons for test states

#### Test Adapters
| Adapter | Language/Framework | Config |
|---------|-------------------|--------|
| neotest-python | Python | pytest runner, DAP debugging |
| neotest-go | Go | Standard setup |
| neotest-jest | Jest | Custom config support, CI env |
| neotest-vitest | Vitest | Standard setup |

#### Neotest Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>tt` | n | Run nearest test |
| `<leader>tf` | n | Run file tests |
| `<leader>td` | n | Debug nearest test |
| `<leader>ts` | n | Stop test |
| `<leader>ta` | n | Attach to test |
| `<leader>to` | n | Open test output |
| `<leader>tO` | n | Toggle output panel |
| `<leader>tS` | n | Toggle test summary |

#### Commands
- `:Neotest run` - Run nearest test
- `:Neotest run file` - Run current file
- `:Neotest run suite` - Run entire suite
- `:Neotest stop` - Stop running test
- `:Neotest attach` - Attach to running test
- `:Neotest output` - Show test output
- `:Neotest output-panel` - Toggle output panel
- `:Neotest summary` - Toggle summary
- `:Neotest jump` - Jump to test

### trouble.nvim
**GitHub:** [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
**Category:** Diagnostics List
**Load Strategy:** `cmd` and `keys`
**Description:** Pretty list for diagnostics, references, and more

#### Capabilities
- LSP diagnostics list
- Quickfix integration
- Location list integration
- LSP references
- LSP definitions
- Document symbols
- Workspace diagnostics
- Custom filtering
- Preview mode
- Auto-update
- Sorting and grouping
- Multi-workspace support

#### Key Features in Your Config
- Auto-preview enabled
- Bottom position
- 10-line height
- Not auto-opening or closing

#### Trouble Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>xx` | n | Toggle Trouble |
| `<leader>xw` | n | Workspace diagnostics |
| `<leader>xd` | n | Document diagnostics |
| `<leader>xq` | n | Quickfix list |
| `<leader>xl` | n | Location list |
| `gR` | n | LSP references |

#### Trouble Window Mappings
- `<CR>` - Jump to item
- `o` - Jump and close trouble
- `q` - Close trouble
- `K` - Preview item
- `P` - Toggle preview
- `zo` - Fold open
- `zc` - Fold close
- `za` - Toggle fold
- `]q` - Next item
- `[q` - Previous item

#### Commands
- `:Trouble diagnostics` - Show workspace diagnostics
- `:Trouble quickfix` - Show quickfix list
- `:Trouble loclist` - Show location list
- `:Trouble lsp_references` - Show LSP references
- `:Trouble lsp_definitions` - Show LSP definitions
- `:Trouble document_diagnostics` - Show document diagnostics

### nvim-bqf
**GitHub:** [kevinhwang91/nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)
**Category:** Quickfix Enhancement
**Load Strategy:** `ft = "qf"`
**Description:** Better quickfix window

#### Capabilities
- Preview in quickfix
- Filter quickfix items
- Fuzzy search in quickfix
- Syntax highlighting in preview
- Auto-resize preview
- Custom mappings
- Integration with fzf
- History navigation
- Context display
- Multi-line preview

#### Key Features in Your Config
- 12-line preview height
- 80ms syntax delay
- Rounded border
- fzf integration with custom bindings

#### BQF Mappings
| Key | Action |
|-----|--------|
| `z,` | Toggle preview mode |
| `<C-s>` | Split selected item |
| `<C-o>` | Toggle all items |

---

## 9. Editing

### nvim-autopairs
**GitHub:** [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
**Category:** Auto-pairing
**Load Strategy:** `event = "InsertEnter"`
**Description:** Autopairs for Neovim with Treesitter support

#### Capabilities
- Auto-close pairs ((), [], {}, "", '', ``)
- Treesitter-based intelligent pairing
- Language-specific rules
- Fast wrap
- Multi-line support
- Custom rules
- Integration with nvim-cmp
- Auto-delete pairs
- Custom pairs per filetype

#### Key Features in Your Config
- Treesitter integration enabled
- Only loads in insert mode for performance

### nvim-surround
**GitHub:** [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
**Category:** Surround Text
**Load Strategy:** `event = "VeryLazy"`
**Description:** Add/change/delete surrounding delimiter pairs

#### Capabilities
- Add surroundings (ys)
- Change surroundings (cs)
- Delete surroundings (ds)
- Visual mode support
- Custom surroundings
- HTML/XML tag support
- Function call wrapping
- Indent handling
- Repeat with vim-repeat

#### Default Mappings
| Mapping | Action | Example |
|---------|--------|---------|
| `ys{motion}{char}` | Add surround | `ysiw"` - surround word with " |
| `cs{old}{new}` | Change surround | `cs"'` - change " to ' |
| `ds{char}` | Delete surround | `ds"` - delete " surrounds |
| `yss{char}` | Surround line | `yss)` - surround line with () |
| `ySS{char}` | Surround line (indented) | `ySS}` - surround with {} on new lines |

#### Visual Mode
- `S{char}` - Surround selection

#### Common Surroundings
- `"` - Double quotes
- `'` - Single quotes
- `` ` `` - Backticks
- `(` or `)` - Parentheses (with/without space)
- `[` or `]` - Brackets
- `{` or `}` - Braces
- `<` or `>` - Angle brackets
- `t` - HTML/XML tag

### Comment.nvim
**GitHub:** [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
**Category:** Commenting
**Load Strategy:** `event = "VeryLazy"`
**Description:** Smart and powerful comment plugin

#### Capabilities
- Line commenting
- Block commenting
- Comment string detection
- Treesitter integration for embedded languages
- Motion support (gc{motion})
- Count support
- Dot-repeat support
- Custom comment strings
- Hook system

#### Key Features in Your Config
- Padding after comment delimiters
- Sticky cursor position
- Integration with nvim-ts-context-commentstring for JSX/TSX
- Custom leader key mapping

#### Comment Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `gcc` | n | Toggle line comment |
| `gbc` | n | Toggle block comment |
| `gc` | n | Line comment (operator) |
| `gb` | n | Block comment (operator) |
| `<leader>/` | n | Toggle line comment |
| `<leader>/` | v | Toggle comment for selection |

#### Comment Motions
- `gcap` - Comment paragraph
- `gc3j` - Comment 3 lines down
- `gcG` - Comment to end of file
- `gc$` - Comment to end of line

### flash.nvim
**GitHub:** [folke/flash.nvim](https://github.com/folke/flash.nvim)
**Category:** Navigation
**Load Strategy:** `event = "VeryLazy"`
**Description:** Navigate your code with search labels

#### Capabilities
- Label-based navigation
- Multi-window jumping
- Treesitter integration
- Search integration
- Remote operations
- Character search
- Pattern search
- Jump to anywhere on screen
- Customizable labels
- Smart case matching

#### Flash Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `s` | n, x, o | Flash jump |
| `S` | n, x, o | Flash treesitter |
| `r` | o | Remote flash |
| `R` | o, x | Treesitter search |
| `<C-s>` | c | Toggle flash search |

#### Usage Examples
1. Press `s` and type 2 chars to see labels
2. Press label character to jump
3. Use `S` for treesitter-aware jumps
4. Use in operator-pending for powerful edits (e.g., `ds` to delete to label)

### vim-repeat
**GitHub:** [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
**Category:** Editing Enhancement
**Load Strategy:** `event = "VeryLazy"`
**Description:** Enable repeating supported plugin maps with "."

#### Capabilities
- Repeat plugin operations with `.`
- Support for nvim-surround
- Support for Comment.nvim
- Custom repeat definitions
- Map silent operations

#### Supported Plugins in Your Config
- nvim-surround (cs, ds, ys)
- Comment.nvim (gcc, gbc)

---

## 10. Treesitter

### nvim-treesitter
**GitHub:** [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
**Category:** Syntax Parsing
**Load Strategy:** `lazy = false` (loads early)
**Description:** Treesitter configurations and abstraction layer

#### Capabilities
- Syntax highlighting with AST
- Incremental selection
- Indentation
- Folding
- Text objects
- Auto-tag closing
- Context-aware operations
- Multiple language support in single file
- Query-based operations
- Playground for debugging

#### Key Features in Your Config
- Auto-install enabled
- 13 languages ensured installed
- Highlighting enabled
- Indent enabled
- Additional regex highlighting for Go and Markdown
- Incremental selection with custom keymaps

#### Installed Languages
- go, javascript, typescript, lua, python
- bash, c, cpp, json, yaml, html, css

#### Incremental Selection
| Key | Action |
|-----|--------|
| `gnn` | Init selection |
| `grn` | Increment to next node |
| `grc` | Increment to next scope |
| `grm` | Decrement to previous node |

#### Commands
- `:TSUpdate` - Update parsers
- `:TSUpdate {language}` - Update specific parser
- `:TSInstall {language}` - Install parser
- `:TSUninstall {language}` - Uninstall parser
- `:TSBufEnable {module}` - Enable module for buffer
- `:TSBufDisable {module}` - Disable module for buffer
- `:TSModuleInfo` - Show module information

### nvim-treesitter-context
**GitHub:** [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
**Category:** Context Display
**Load Strategy:** `lazy = true`
**Description:** Show code context at top of window

#### Capabilities
- Show function/class context
- Sticky scroll effect
- Multi-window support
- Line numbers in context
- Configurable context size
- Treesitter-based accuracy
- Jump to context
- Highlight current context

#### Key Features in Your Config
- Enabled for all buffers
- Multi-window support
- Unlimited context lines
- Line numbers shown
- 20-line multiline threshold
- Cursor mode (shows context of cursor position)

#### Context Features
- Shows current function/class/method
- Updates as you scroll
- Sticky header effect
- Click to jump to context start

### nvim-ts-context-commentstring
**GitHub:** [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
**Category:** Comment Enhancement
**Load Strategy:** `lazy = false`
**Description:** Set commentstring based on cursor location in file

#### Capabilities
- JSX/TSX comment support
- Vue template comments
- Svelte template comments
- Context-aware comment strings
- Integration with Comment.nvim
- Treesitter query-based detection
- Embedded language support

#### Key Features in Your Config
- Integrated with Comment.nvim pre_hook
- Automatically detects JSX/TSX regions
- Switches between `//` and `{/* */}` in React

#### Supported Contexts
- JavaScript in JSX
- TypeScript in TSX
- JavaScript in HTML
- CSS in styled-components
- GraphQL in template literals

---

## 11. Terminal

### toggleterm.nvim
**GitHub:** [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
**Category:** Terminal
**Load Strategy:** `event = "VeryLazy"`
**Description:** Persist and toggle multiple terminals

#### Capabilities
- Multiple terminal instances
- Floating, horizontal, vertical, and tab terminals
- Terminal persistence
- Send commands to terminal
- Terminal-specific settings
- Custom terminal functions
- Integration with lazygit and other TUI apps
- Auto-close on exit
- Insert mode on open

#### Key Features in Your Config
- 20-line default height
- Floating direction
- Opens in insert mode
- Shaded terminal background
- Auto-closes on process exit

#### Toggleterm Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>T` | n | Toggle terminal |
| `jk` | t | Exit terminal mode |
| `<C-h>` | t | Move to left window |
| `<C-j>` | t | Move to window below |
| `<C-k>` | t | Move to window above |
| `<C-l>` | t | Move to right window |

#### Commands
- `:ToggleTerm` - Toggle terminal
- `:ToggleTerm direction=float` - Toggle floating terminal
- `:ToggleTerm direction=horizontal` - Toggle horizontal split
- `:ToggleTerm direction=vertical` - Toggle vertical split
- `:ToggleTerm direction=tab` - Toggle terminal in new tab
- `:TermExec cmd="command"` - Execute command in terminal
- `:{count}ToggleTerm` - Toggle specific terminal number

#### Terminal Workflow
1. Open floating terminal with `<leader>T`
2. Run commands in insert mode
3. Exit to normal mode with `jk`
4. Navigate between windows with Ctrl+hjkl
5. Toggle terminal visibility as needed
6. Create multiple terminals with count prefix

---

## 12. AI & LLM

### copilot.vim
**GitHub:** [github/copilot.vim](https://github.com/github/copilot.vim)
**Category:** AI Code Completion
**Load Strategy:** `event = "InsertEnter"`
**Description:** GitHub Copilot integration for Neovim

#### Capabilities
- AI-powered code suggestions
- Context-aware completions
- Multi-line suggestions
- Function generation
- Documentation generation
- Cycle through suggestions
- Panel view for alternatives
- Language-specific suggestions
- Comment-to-code generation

#### Key Features in Your Config
- Tab mapping disabled (prevents conflict with cmp)
- Custom accept with Ctrl-J
- Next/previous suggestion cycling
- Panel view available

#### Copilot Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<C-J>` | i | Accept suggestion |
| `<C-]>` | i | Next suggestion |
| `<M-[>` | i | Previous suggestion |
| `<C-\>` | i | Open panel |

#### Commands
- `:Copilot` - Show Copilot status
- `:Copilot setup` - Setup Copilot authentication
- `:Copilot status` - Show authentication status
- `:Copilot panel` - Open panel with alternatives
- `:Copilot disable` - Disable Copilot
- `:Copilot enable` - Enable Copilot

### codeium.vim
**GitHub:** [Exafunction/codeium.vim](https://github.com/Exafunction/codeium.vim)
**Category:** AI Code Completion
**Load Strategy:** Disabled (alternative to Copilot)
**Description:** Free AI-powered code completion

#### Capabilities
- Free AI code suggestions
- Similar to Copilot
- Multi-language support
- Context-aware completions
- No subscription required
- Privacy-focused options

#### Key Features in Your Config
- Currently disabled (Copilot is active)
- Can be enabled as Copilot alternative
- Custom keybindings configured if enabled

#### Codeium Keybindings (if enabled)
| Key | Mode | Action |
|-----|------|--------|
| `<C-g>` | i | Accept suggestion |
| `<C-;>` | i | Next suggestion |
| `<C-,>` | i | Previous suggestion |
| `<C-x>` | i | Clear suggestion |

### gp.nvim
**GitHub:** [robitx/gp.nvim](https://github.com/robitx/gp.nvim)
**Category:** ChatGPT Integration
**Load Strategy:** `cmd` and `keys`
**Description:** ChatGPT integration for Neovim

#### Capabilities
- ChatGPT conversations in Neovim
- Code explanation
- Code rewriting
- Code generation
- Append/prepend code
- Multi-turn conversations
- Custom prompts
- Context-aware responses
- Chat history
- Multiple chat sessions

#### Key Features in Your Config
- OpenAI API integration
- API key from environment variable
- Custom keybindings for common operations

#### GP Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>gC` | n | Toggle GP chat |
| `<leader>gg` | n | New GP chat |
| `<leader>ge` | v | Explain selection |
| `<leader>gr` | v | Rewrite selection |
| `<leader>ga` | v | Append via GP |
| `<leader>gp` | v | Prepend via GP |

#### Commands
- `:GpChatToggle` - Toggle chat window
- `:GpChatNew` - Start new chat
- `:GpExplain` - Explain selected code
- `:GpRewrite` - Rewrite selected code
- `:GpAppend` - Append code after selection
- `:GpPrepend` - Insert code before selection
- `:GpChatFinder` - Find previous chats
- `:GpChatDelete` - Delete current chat

---

## 13. Modern Features

### auto-session
**GitHub:** [rmagatti/auto-session](https://github.com/rmagatti/auto-session)
**Category:** Session Management
**Load Strategy:** Loaded via modern-features
**Description:** Automatic session management

#### Capabilities
- Automatic session saving
- Automatic session restoration
- Directory-based sessions
- Session hooks (pre/post save/restore)
- Custom session directory
- Suppress specific directories
- Integration with telescope
- Git branch awareness (disabled in config)
- Last session restoration (disabled in config)

#### Key Features in Your Config
- Auto-save and auto-restore enabled
- Sessions stored in Neovim data directory
- Suppressed for: ~/, ~/Projects, ~/Downloads, /
- Git branch tracking disabled
- Last session restore disabled

#### Session Workflow
1. Open Neovim in a project directory
2. Work on your project
3. Session auto-saves on exit
4. Reopening same directory restores session
5. Search sessions with telescope integration

#### Commands
- `:SaveSession` - Save current session
- `:RestoreSession` - Restore session
- `:DeleteSession` - Delete a session
- `:Autosession search` - Search sessions (telescope)
- `:Autosession delete` - Delete session

### session-lens
**GitHub:** [rmagatti/session-lens](https://github.com/rmagatti/session-lens)
**Category:** Session Browser
**Load Strategy:** Dependency of auto-session
**Description:** Telescope integration for auto-session

#### Capabilities
- Browse sessions in Telescope
- Preview session contents
- Quick session switching
- Session deletion from picker
- Custom theme support

#### Key Features in Your Config
- Bordered theme
- No preview (for faster browsing)
- Integrated with auto-session

#### Session-lens Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>ss` | n | Search sessions |

### rest.nvim
**GitHub:** [rest-nvim/rest.nvim](https://github.com/rest-nvim/rest.nvim)
**Category:** HTTP Client
**Load Strategy:** `ft = "http"`
**Description:** Fast REST client for Neovim

#### Capabilities
- Send HTTP requests from .http files
- Support for all HTTP methods (GET, POST, PUT, DELETE, etc.)
- Request headers and body
- Environment variables
- Dynamic variables
- Response formatting (JSON with jq, HTML with tidy)
- Response viewing in split
- URL and HTTP info display
- SSL verification
- Request history

#### Key Features in Your Config
- jq for JSON formatting
- tidy for HTML formatting
- .env file support
- URL encoding enabled
- Response info displayed

#### Rest.nvim Keybindings
| Key | Mode | Action |
|-----|------|--------|
| `<leader>rr` | n | Run REST request |
| `<leader>rp` | n | Preview request |
| `<leader>rl` | n | Run last request |

#### HTTP File Format
```http
### Request name
GET https://api.example.com/users
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "key": "value"
}
```

### marks.nvim
**GitHub:** [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim)
**Category:** Mark Enhancement
**Load Strategy:** `event = "VeryLazy"`
**Description:** Better mark visualization and navigation

#### Capabilities
- Sign column indicators for marks
- Bookmark groups
- Mark descriptions
- Automatic mark tracking
- Builtin mark support
- Cyclic mark navigation
- Force write to shada
- Custom sign priority
- Per-buffer marks (a-z)
- Global marks (A-Z)

#### Key Features in Your Config
- Default mappings enabled
- Builtin marks: ., <, >, ^
- Cyclic navigation
- 250ms refresh interval
- Bookmark sign: ⚑

#### Default Mark Mappings
| Key | Action |
|-----|--------|
| `m,` | Set next available mark |
| `m;` | Toggle next available mark |
| `dm-` | Delete mark under cursor |
| `dm<space>` | Delete all marks in buffer |
| `m]` | Next mark |
| `m[` | Previous mark |
| `m:` | Preview mark |

#### Bookmark Mappings
| Key | Action |
|-----|--------|
| `m0-9` | Set bookmark 0-9 |
| `dm0-9` | Delete bookmark 0-9 |

---

## 14. Themes

### catppuccin
**GitHub:** [catppuccin/nvim](https://github.com/catppuccin/nvim)
**Category:** Colorscheme
**Load Strategy:** Loaded via lazy.nvim
**Description:** Soothing pastel theme for Neovim

#### Capabilities
- Four flavors: Latte, Frappe, Macchiato, Mocha
- Integration with 50+ plugins
- Transparent background support
- Custom highlights
- Terminal colors
- Treesitter support
- LSP semantic tokens
- Custom palette colors

#### Integrated Plugins
- Treesitter, LSP, telescope, nvim-tree
- Gitsigns, which-key, indent-blankline
- Notify, noice, bufferline, lualine
- Trouble, aerial, and many more

### tokyonight.nvim
**GitHub:** [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
**Category:** Colorscheme
**Load Strategy:** Loaded via lazy.nvim
**Description:** Clean, dark Neovim theme

#### Capabilities
- Multiple styles: night, storm, day, moon
- Plugin integration
- Customizable colors
- Transparent background
- Terminal colors
- Lualine theme
- Sidebar darkening

---

## 15. Performance

### vim-startuptime
**GitHub:** [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime)
**Category:** Performance Analysis
**Load Strategy:** `cmd = "StartupTime"`
**Description:** Profile Neovim startup time

#### Capabilities
- Measure startup time
- Show plugin load times
- Multiple run averaging
- Detailed breakdown
- Sorting by time
- Identify slow plugins
- Benchmark different configurations

#### Key Features in Your Config
- 10 tries for averaging
- Only loads on command

#### Commands
- `:StartupTime` - Show startup time analysis

#### Usage
1. Run `:StartupTime`
2. View detailed breakdown of startup
3. Identify slow-loading plugins
4. Optimize lazy loading based on results

---

## 16. Quick Reference

### Common Workflows

#### Setting Up a New Project
```
1. Open Neovim in project directory
2. Run :checkhealth to verify setup
3. LSP auto-activates for supported files
4. Session auto-saves on exit
```

#### Finding Files and Code
```
<leader>ff - Quick file search
<leader>fg - Search text in all files
<leader>fb - Switch between buffers
<leader>fr - Open recent files
<leader>fs - Search word under cursor
```

#### Git Workflow
```
<leader>gs - Git status (Fugitive)
<leader>lg - LazyGit TUI
<leader>hs - Stage hunk
<leader>hp - Preview hunk
<leader>hl - Show blame
]c / [c    - Navigate between hunks
```

#### Debugging Workflow
```
<leader>dbb - Set breakpoint
<leader>dbc - Start debugging
<leader>dbo - Step over
<leader>dbi - Step into
<leader>dbu - Toggle debug UI
```

#### Testing Workflow
```
<leader>tt - Run nearest test
<leader>tf - Run file tests
<leader>td - Debug nearest test
<leader>tO - Toggle test output
```

#### LSP Operations
```
gd          - Go to definition
gr          - Go to references
K           - Hover documentation
<leader>ca  - Code actions
<leader>rn  - Rename symbol
<leader>f   - Format buffer
[d / ]d     - Navigate diagnostics
```

#### Navigation
```
<C-e>       - Harpoon menu
<leader>a   - Add to harpoon
<leader>e   - Toggle file tree
-           - Oil (edit filesystem)
s           - Flash jump
<leader>to  - Toggle outline
```

### Plugin Health Check

Run `:checkhealth` to verify:
- Mason installations
- LSP server availability
- Treesitter parsers
- DAP adapters
- Python provider
- Node.js provider
- Clipboard support

### Recommended External Tools

Install these for full functionality:
- **ripgrep** - For telescope live_grep and todo-comments
- **fd** - For telescope file finding
- **lazygit** - For lazygit.nvim
- **jq** - For rest.nvim JSON formatting
- **Node.js** - For many LSP servers (ts_ls, tailwindcss, etc.)
- **Python** - For python LSP and debugpy
- **Go** - For gopls and delve
- **Rust** - For rust_analyzer

### Performance Tips

1. **Lazy Loading**: Most plugins lazy load based on events, commands, or keys
2. **Mason Priority**: Mason loads early (priority 50) to ensure LSP servers are available
3. **Treesitter Early Load**: Treesitter loads on startup (`lazy = false`) for better syntax highlighting
4. **Profile Startup**: Use `:StartupTime` to identify bottlenecks
5. **Disable Unused**: Disable plugins you don't need (e.g., codeium.vim is disabled)

### Configuration Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Locked plugin versions
├── lua/tarun/
│   ├── lazy.lua          # Plugin specifications
│   ├── keymaps.lua       # All keybindings
│   ├── lsp.lua           # LSP server configs
│   ├── autocomplete.lua  # Completion setup
│   ├── treesitter.lua    # Treesitter config
│   ├── dap.lua           # Debugging setup
│   ├── code-quality.lua  # Linters/formatters
│   └── [other modules]   # Plugin-specific configs
└── PLUGINS.md            # This file
```

### Support and Resources

- **Neovim Docs**: `:help` or https://neovim.io/doc
- **Plugin GitHub Pages**: See links in each plugin section
- **This Config's Health**: `:checkhealth`
- **Plugin Manager UI**: `:Lazy`
- **LSP Installer UI**: `:Mason`

---

**Total Plugins**: 60+
**Languages Supported**: 14 (via LSP)
**Debug Adapters**: 3 (Python, Go, JavaScript/TypeScript)
**Lines of Configuration**: ~1400+
