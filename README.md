# Enhanced Neovim Configuration

## Overview
This is a modern, feature-rich Neovim configuration optimized for performance and productivity.

## Features

### Core Enhancements
- **Performance**: Lazy loading with impatient.nvim, startup profiling
- **LSP**: 13+ language servers with auto-installation
- **Navigation**: Flash.nvim for motion, Oil.nvim for files, Trouble for diagnostics
- **Code Quality**: None-ls, Neotest, formatters and linters
- **UI/UX**: Noice.nvim, indent guides, color previews, smart folding
- **AI Assistance**: GitHub Copilot integration
- **Git**: Gitsigns, Lazygit, Fugitive integration

## Key Mappings

### Leader Key: `Space`

### Navigation
- `s` - Flash jump
- `-` - Open parent directory (Oil)
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep
- `<leader>e` - Toggle NvimTree
- `<C-e>` - Harpoon menu

### LSP
- `gd` - Go to definition
- `gr` - Find references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format buffer

### Git
- `<leader>lg` - LazyGit
- `]c` / `[c` - Navigate hunks
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hb` - Blame line

### Diagnostics
- `<leader>xx` - Toggle Trouble
- `[d` / `]d` - Navigate diagnostics
- `<leader>e` - Show diagnostic

### Testing
- `<leader>tt` - Run nearest test
- `<leader>tf` - Run file tests
- `<leader>td` - Debug test

### AI/Copilot
- `<C-J>` - Accept suggestion
- `<C-]>` - Next suggestion
- `<C-[>` - Previous suggestion

### Window Management
- `<C-h/j/k/l>` - Navigate windows
- `<C-Up/Down/Left/Right>` - Resize windows

### Buffers
- `<S-l>` / `<S-h>` - Next/Previous buffer
- `<leader>bd` - Delete buffer

## Language Support

### Configured LSPs
- Go (gopls)
- Python (pyright)
- TypeScript/JavaScript (ts_ls)
- Lua (lua_ls)
- Rust (rust_analyzer)
- C/C++ (clangd)
- CSS/SCSS (cssls)
- Tailwind CSS
- Bash (bashls)
- JSON (jsonls)
- YAML (yamlls)
- HTML
- Docker

### Formatters
- Prettier (JS/TS/HTML/CSS/JSON)
- Black (Python)
- Stylua (Lua)
- gofmt/goimports (Go)
- rustfmt (Rust)
- shfmt (Shell)

### Linters
- ESLint (JS/TS)
- Flake8 (Python)
- golangci-lint (Go)
- shellcheck (Shell)
- yamllint (YAML)

## Plugin List

### Core
- lazy.nvim - Plugin manager
- impatient.nvim - Performance optimization
- plenary.nvim - Utility library

### LSP & Completion
- nvim-lspconfig
- mason.nvim
- nvim-cmp + sources
- LuaSnip
- fidget.nvim (progress)
- lsp_signature.nvim

### Navigation & Search
- telescope.nvim
- flash.nvim
- oil.nvim
- trouble.nvim
- harpoon

### UI
- noice.nvim
- nvim-notify
- lualine.nvim
- bufferline.nvim
- indent-blankline.nvim
- nvim-colorizer.lua
- nvim-ufo (folding)
- todo-comments.nvim

### Git
- gitsigns.nvim
- vim-fugitive
- diffview.nvim
- lazygit.nvim

### Code Quality
- none-ls.nvim
- neotest + adapters
- nvim-bqf (better quickfix)

### Editing
- nvim-surround
- nvim-autopairs
- Comment.nvim
- nvim-ts-context-commentstring

### AI & Productivity
- copilot.vim
- auto-session
- marks.nvim
- rest.nvim

### Themes
- tokyonight.nvim
- catppuccin

## Testing

### Health Check
```bash
nvim -c "checkhealth"
```

### Startup Performance
```bash
nvim --startuptime startup.log
```

### Configuration Test
```bash
nvim --headless -c "lua print('Config OK')" -c "qa"
```

## Backup & Recovery

A timestamped backup was created before the latest changes:
```bash
ls ~/.config/nvim.backup-*
```

To restore:
```bash
mv ~/.config/nvim ~/.config/nvim.failed
mv ~/.config/nvim.backup-TIMESTAMP ~/.config/nvim
```

## Requirements

### Core Requirements
- Neovim >= 0.9.0
- Git
- Node.js (for many LSP servers)
- Python 3 (for Python LSP)

### System Dependencies (REQUIRED)

#### **Linux (Ubuntu/Debian)**
```bash
# REQUIRED for clipboard support
sudo apt-get install xclip

# Optional but recommended
sudo apt-get install ripgrep fd-find build-essential
```

#### **Linux (Fedora/RHEL)**
```bash
# REQUIRED for clipboard support
sudo dnf install xclip

# Optional but recommended
sudo dnf install ripgrep fd-find gcc-c++
```

#### **macOS**
```bash
# Clipboard works natively on macOS
# Optional but recommended
brew install ripgrep fd
```

#### **Windows (WSL)**
```bash
# Same as Linux Ubuntu/Debian above
sudo apt-get install xclip
```

### Optional Development Tools
- Go (for Go development)
- Rust (for Rust development)
- Docker (for containerized development)

## Quick Installation

### Automated Installation (Linux/macOS)
```bash
# Clone the config
git clone https://github.com/yourusername/nvim-config ~/.config/nvim

# Run installation script
cd ~/.config/nvim
chmod +x install.sh
./install.sh
```

### Manual Installation
1. Install system dependencies (see above)
2. Clone this repository to `~/.config/nvim`
3. Open Neovim and let plugins install
4. Run `:checkhealth` to verify everything is working

## Customization

### Adding LSP Servers
Edit `lua/tarun/lsp.lua` and add to `ensure_installed` list.

### Adding Plugins
Edit `lua/tarun/lazy.lua` or create a new module in `lua/tarun/`.

### Changing Keymaps
Edit `lua/tarun/keymaps.lua` for centralized keybinding management.

## Troubleshooting

### Plugin Issues
- Run `:Lazy` to manage plugins
- Run `:Lazy sync` to update all plugins
- Check `:messages` for error details

### LSP Issues
- Run `:LspInfo` to check server status
- Run `:Mason` to manage LSP servers
- Check `:LspLog` for detailed logs

### Performance Issues
- Run `:StartupTime` to profile startup
- Check lazy loading with `:Lazy profile`

## License
This configuration is provided as-is for personal use.