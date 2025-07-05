# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This is a **production-ready, sophisticated personal dotfiles repository** that manages macOS system configurations using **GNU Stow** for symlink management. Each tool's configuration is contained in its own directory, which gets symlinked to the home directory when installed.

**Scale & Sophistication Indicators:**

- **1,800+ git aliases** covering comprehensive git workflows
- **287-line alias file** with advanced development automation
- **167+ managed packages** (CLI tools, GUI apps, VS Code extensions)
- **6+ modular tmux configuration files** for maintainable complexity
- **Cross-tool theme coordination** with performance optimizations
- **Production-grade workflows** with automated updates and environment management

### Key Architecture

- **Symlink Management**: Uses GNU Stow (configured in `.stowrc`)
- **Modular Design**: Each tool has its own directory (e.g., `zsh/`, `nvim/`, `git/`, `tmux/`)
- **Git Submodules**: Neovim configuration is managed as a separate repository
- **Homebrew-centric**: All package management through Homebrew, including GUI apps
- **Multi-file Configurations**: Complex tools split across multiple files (tmux uses 6+ config files)
- **Conditional Loading**: Tools loaded only when available to prevent errors across systems
- **Performance Optimizations**: Lazy loading of heavy tools (pyenv) for faster shell startup

## Modular Configuration Architecture

### Tmux Configuration Structure

Tmux uses a sophisticated modular approach with separate config files:

- `tmux/.tmux.conf` - Main entry point that sources all other configs
- `tmux/config/core.conf` - Terminal settings, prefix key (Ctrl-a), vi bindings
- `tmux/config/keybindings.conf` - Custom key mappings and navigation
- `tmux/config/appearance.conf` - Status bar, colors, visual settings
- `tmux/config/system.conf` - Mouse, clipboard, hyperlinks integration
- `tmux/plugins/plugins.conf` - Plugin declarations (auto-installs TPM)
- `tmux/plugins/configs.conf` - Plugin-specific configurations

### Git Configuration Complexity

- **Main Config**: `git/.gitconfig` with 1Password SSH signing integration
- **Comprehensive Aliases**: `git/.gitalias.txt` contains 1,800+ git aliases covering all operations
- **Global Ignore**: `git/.gitignore_global` for consistent ignore patterns

### Zsh Framework Integration

- **Core**: `zsh/.zshrc` with Zim framework, fzf-tab, syntax highlighting
- **Aliases**: `zsh/.zsh_aliases` (287 lines) with development workflows, file operations, and utility functions
- **Lazy Loading**: pyenv initialization deferred until first use for performance

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
- `lr` - Recursive tree listing
- `lt` - Sort by modification time
- `lk` - Sort by file size
- `ping` - Pretty ping with prettyping
- `vim` / `vi` - Aliased to Neovim

### Advanced File Operations

- `lr` - Long format, recursive as tree
- `lx` - Sort by extension
- `lk` - Sort by size (largest last)
- `lt` - Sort by modification time (newest last)
- `lc` - Sort by status change time

### Development Utilities

- `npmU` - Update global npm packages with interactive selection
- `ncu-patch` / `ncu-minor` - Update package.json with npm-check-updates
- `N` - Shortcut for `npm run`
- `npmrd` - Run npm dev script
- `npmrb` - Run npm build script

### Python Development

- `pyenv` - Lazy-loaded Python version management
- Virtual environment activation on directory change
- Package cleanup utilities for pip and conda environments

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

### Performance Optimization Patterns

- **Conditional Loading**: Tools and aliases only load when commands are available (`if (( ${+commands[tool]} ))`)
- **Lazy Initialization**: Heavy tools (pyenv, language managers) deferred until first use
- **PATH Optimization**: Automatic PATH deduplication and careful ordering for performance
- **Shell Startup**: Optimized initialization order to minimize shell startup time
- **Plugin Management**: Efficient plugin loading with conditional checks to prevent errors

### Conditional Loading Examples

```bash
# Only load ncu aliases if npm-check-updates is installed
if (( ${+commands[ncu]} )); then
  alias ncu-patch="ncu -i --target patch --concurrency 12"
fi

# Lazy load pyenv to avoid startup penalty
function pyenv() {
  eval "$(command pyenv init -)"
  pyenv "$@"
}
```

### Cross-Tool Integration & Automation

#### Master Update Workflow

The `uuu` alias orchestrates updates across the entire development environment:

```bash
uuu="brewup; npmU; zimU; mas upgrade; nvimU; macU; tpmU; s"
```

- **brewup**: Update/cleanup Homebrew packages
- **npmU**: Interactive global npm package updates
- **zimU**: Update Zim framework and plugins
- **mas upgrade**: Update Mac App Store apps
- **nvimU**: Update Neovim plugins headlessly
- **macU**: Install macOS system updates
- **tpmU**: Update tmux plugins
- **s**: Reload shell to apply changes

#### Terminal Integration

- **WezTerm → tmux**: Auto-starts tmux on terminal launch
- **Keyboard Shortcuts**: CMD+numbers mapped to tmux window switching
- **Clipboard**: Seamless copy/paste between tmux and macOS system clipboard
- **Navigation**: Consistent vi-style keybindings across tmux and editors

#### Development Environment Auto-switching

- **Node.js**: fnm automatically switches versions based on `.nvmrc` files
- **Python**: pyenv integration with virtual environment auto-activation
- **Git**: Context-aware aliases and 1Password SSH signing integration

#### Theme Consistency

- **Gruvbox**: Coordinated color scheme across WezTerm, tmux, Neovim, and shell
- **Fonts**: JetBrains Mono with Nerd Font symbols system-wide
- **Visual Elements**: Consistent status bars, borders, and UI elements

## File Structure Notes

- **Package Management**: `homebrew/Brewfile` manages 167+ packages (CLI tools, GUI apps, VS Code extensions)
- **Git Aliases**: `git/.gitalias.txt` contains 1,800+ comprehensive git aliases for all operations
- **Zsh Aliases**: `zsh/.zsh_aliases` (287 lines) includes development workflows, file operations, automation
- **Tmux Configuration**: Modular split across 6+ files in `tmux/config/` and `tmux/plugins/` subdirectories
- **Theme Consistency**: Gruvbox theme coordinated across WezTerm, tmux, Neovim, and system tools
- **Performance**: Conditional loading and lazy initialization patterns throughout configurations
- **Cross-tool Integration**: Seamless clipboard, navigation, and workflow integration between tools

## Important Stow Configuration

The `.stowrc` file configures Stow to ignore certain files:

- `.stowrc` itself
- `.DS_Store` files

This ensures clean symlink installation without cluttering the home directory.

## Tool Preferences

- **Search**: Always use `rg` (ripgrep) instead of `grep` for file content searches
- **Find**: Use `fd` instead of `find` when available for file discovery
- **JSON/YAML**: Use `jq` for JSON processing and `yq` for YAML processing
- **Text replacement**: Use `sd` instead of `sed` for simple find/replace operations
- **File listing**: Use `eza` instead of `ls` (aliased in shell)
- **File viewer**: Use `bat` instead of `cat` for syntax highlighting
- **AST search**: Use `ast-grep` for code structure searches and refactoring
- **Git**: Use `gh` CLI for GitHub operations, `lazygit` for interactive git
- **File manager**: Use `yazi` for terminal-based file management
- **Directory navigation**: Use `zoxide` for smart directory jumping

## Working with This Repository

### Important Context for Claude Code

This is a **mature, production-ready development environment** with sophisticated configurations:

- **High Customization**: Extensive modifications to default tool behaviors
- **Interdependencies**: Tools are configured to work together seamlessly
- **Performance-Tuned**: Optimized for fast shell startup and efficient workflows
- **Modular Architecture**: Changes should respect the existing modular structure
- **Conditional Logic**: Many configurations use conditional loading patterns

### Best Practices When Making Changes

- **Preserve Modularity**: Keep tmux configs in separate files, don't consolidate
- **Maintain Conditional Loading**: Use existing patterns for tool availability checks
- **Respect Performance**: Don't add heavy operations to shell startup
- **Follow Existing Patterns**: Mimic the established alias and function conventions
- **Test Cross-Tool Impact**: Changes may affect integrated workflows (WezTerm→tmux, etc.)

### Key Files to Understand Before Major Changes

- `zsh/.zsh_aliases` - Complex automation and development workflows
- `tmux/config/` - Modular tmux configuration structure
- `git/.gitalias.txt` - Comprehensive git workflow shortcuts
- `homebrew/Brewfile` - Complete package dependency management

