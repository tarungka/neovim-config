#!/bin/bash

# Neovim Configuration Installation Script
# This script installs all required dependencies for the Neovim configuration

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print colored output
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/debian_version ]; then
            echo "debian"
        elif [ -f /etc/redhat-release ]; then
            echo "redhat"
        elif [ -f /etc/arch-release ]; then
            echo "arch"
        else
            echo "linux"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    else
        echo "unknown"
    fi
}

# Install packages based on OS
install_packages() {
    local OS=$(detect_os)
    
    print_info "Detected OS: $OS"
    
    case $OS in
        debian)
            print_info "Installing packages for Debian/Ubuntu..."
            sudo apt-get update
            
            # Required packages
            sudo apt-get install -y xclip curl git
            
            # Optional but recommended
            sudo apt-get install -y ripgrep fd-find build-essential
            
            # Node.js (for LSP servers)
            if ! command -v node &> /dev/null; then
                print_info "Installing Node.js..."
                curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
                sudo apt-get install -y nodejs
            fi
            ;;
            
        redhat)
            print_info "Installing packages for Fedora/RHEL..."
            
            # Required packages
            sudo dnf install -y xclip curl git
            
            # Optional but recommended
            sudo dnf install -y ripgrep fd-find gcc-c++
            
            # Node.js
            if ! command -v node &> /dev/null; then
                print_info "Installing Node.js..."
                sudo dnf install -y nodejs npm
            fi
            ;;
            
        arch)
            print_info "Installing packages for Arch Linux..."
            
            # Required packages
            sudo pacman -S --noconfirm xclip curl git
            
            # Optional but recommended
            sudo pacman -S --noconfirm ripgrep fd base-devel
            
            # Node.js
            if ! command -v node &> /dev/null; then
                print_info "Installing Node.js..."
                sudo pacman -S --noconfirm nodejs npm
            fi
            ;;
            
        macos)
            print_info "Installing packages for macOS..."
            
            # Check if Homebrew is installed
            if ! command -v brew &> /dev/null; then
                print_error "Homebrew is not installed. Please install it first:"
                print_error "https://brew.sh"
                exit 1
            fi
            
            # Clipboard works natively on macOS
            # Optional but recommended
            brew install ripgrep fd
            
            # Node.js
            if ! command -v node &> /dev/null; then
                print_info "Installing Node.js..."
                brew install node
            fi
            ;;
            
        *)
            print_error "Unsupported OS. Please install dependencies manually."
            print_info "Required: xclip (Linux), git, node.js"
            print_info "Optional: ripgrep, fd"
            exit 1
            ;;
    esac
}

# Check Neovim version
check_neovim() {
    if ! command -v nvim &> /dev/null; then
        print_error "Neovim is not installed!"
        print_info "Please install Neovim >= 0.9.0 first"
        print_info "Visit: https://neovim.io/doc/user/quickstart.html"
        exit 1
    fi
    
    local nvim_version=$(nvim --version | head -n1 | cut -d ' ' -f2)
    print_info "Neovim version: $nvim_version"
}

# Main installation
main() {
    print_info "Starting Neovim configuration installation..."
    
    # Check Neovim
    check_neovim
    
    # Install system packages
    install_packages
    
    # Check clipboard utility
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v xclip &> /dev/null; then
            print_info "✓ xclip is installed (clipboard support ready)"
        elif command -v xsel &> /dev/null; then
            print_info "✓ xsel is installed (clipboard support ready)"
        else
            print_warning "No clipboard utility found. Install xclip for clipboard support."
        fi
    fi
    
    # Final instructions
    print_info "Installation complete!"
    print_info ""
    print_info "Next steps:"
    print_info "1. Open Neovim: nvim"
    print_info "2. Wait for plugins to install automatically"
    print_info "3. Run :checkhealth to verify everything is working"
    print_info "4. Restart Neovim"
    print_info ""
    print_info "Enjoy your enhanced Neovim configuration! 🚀"
}

# Run main function
main "$@"