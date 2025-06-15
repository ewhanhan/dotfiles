# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This is a personal dotfiles repository that manages macOS system configurations using **GNU Stow** for symlink management. Each tool's configuration is contained in its own directory, which gets symlinked to the home directory when installed.

### Key Architecture

- **Symlink Management**: Uses GNU Stow (configured in `.stowrc`)
- **Modular Design**: Each tool has its own directory (e.g., `zsh/`, `nvim/`, `git/`, `tmux/`)
- **Git Submodules**: Neovim configuration is managed as a separate repository
- **Homebrew-centric**: All package management through Homebrew, including GUI apps

## Common Commands

### Package Management
- `brewup` - Update Homebrew packages, clean up, and run doctor
- `brewdump` - Export current Homebrew state to Brewfile
- `uuu` - Master update command (Homebrew, npm, Zim, Mac App Store, Neovim, macOS, tmux plugins)

### Configuration Management
- `stow */` - Symlink all configurations (run from dotfiles directory)
- `git submodule update --init --recursive` - Initialize Neovim config submodule

### Development Tools
- `lg` - Launch Lazygit
- `nvimU` - Update Neovim plugins headlessly
- `zimU` - Update Zim framework
- `tpmU` - Update tmux plugins (via tmux plugin manager)

### System Utilities
- `l` / `ls` - Enhanced directory listing with eza
- `ll` - Detailed directory listing
- `ping` - Pretty ping with prettyping
- `vim` / `vi` - Aliased to Neovim

## Configuration Locations

### Installed Configurations
When stowed, configurations are symlinked to:
- Zsh: `~/.zshrc`, `~/.zsh_aliases`
- Git: `~/.gitconfig`, includes external `.gitalias.txt`
- Tmux: `~/.tmux.conf`
- Neovim: `~/.config/nvim/` (git submodule)
- WezTerm: `~/.wezterm.lua`
- Starship: `~/.config/starship.toml`

### Core Tools Integration
- **Shell**: Zsh with Zim framework, fzf-tab completion, extensive aliases
- **Terminal**: WezTerm with Gruvbox theme, auto-starts tmux
- **Git**: SSH signing via 1Password, delta pager, comprehensive aliases
- **Editor**: Neovim as primary, VS Code with extensive extensions
- **Window Management**: Aerospace tiling WM, Karabiner for keyboard customization

## Development Workflow

### Setup Process
1. Clone repository to `~/.dotfiles`
2. Install Homebrew packages: `brew bundle --file=~/.dotfiles/homebrew/Brewfile`
3. Initialize git submodules for Neovim
4. Stow configurations: `cd ~/.dotfiles && stow */`

### Key Features
- **Lazy-loaded pyenv** for Python development
- **Node.js management** via fnm with auto-switching
- **Clipboard integration** between tmux and macOS
- **SSH signing** with 1Password integration
- **Terminal multiplexing** with tmux (prefix: Ctrl-a)

## File Structure Notes

- Package dependencies are managed in `homebrew/Brewfile`
- Git aliases are extensive (100+ aliases for all git operations)
- Zsh configuration includes fzf-tab for enhanced completion
- Tmux uses vim-style keybindings and custom prefix (Ctrl-a)
- Tmux configuration is modular (split across `tmux/config/` subdirectories)
- All configurations follow consistent theming (primarily Gruvbox)

## Important Stow Configuration

The `.stowrc` file configures Stow to ignore certain files:
- `.stowrc` itself
- `.DS_Store` files

This ensures clean symlink installation without cluttering the home directory.