# 🚀 dotfiles

[![macOS](https://img.shields.io/badge/OS-macOS-blue?style=flat-square&logo=apple)](https://www.apple.com/macos/)
[![GNU Stow](https://img.shields.io/badge/GNU-Stow-green?style=flat-square)](https://www.gnu.org/software/stow/)
[![Shell](https://img.shields.io/badge/Shell-Zsh-1f425f.svg?style=flat-square&logo=gnu-bash)](https://www.zsh.org/)
[![Terminal](https://img.shields.io/badge/Terminal-WezTerm-orange?style=flat-square)](https://wezfurlong.org/wezterm/)

## ✨ Features

- **🏗️ Modular Architecture**: Each tool lives in its own directory
- **🔗 GNU Stow Management**: Clean symlink installation with `.stowrc` configuration
- **🍺 Homebrew-Centric**: All packages managed through Homebrew (CLI tools, GUI apps, fonts, VS Code extensions)
- **🎨 Consistent Theming**: Gruvbox color scheme across all tools
- **⚡ Performance Optimized**: Lazy-loaded configurations for faster shell startup
- **🔧 Developer-Focused**: Tailored for modern development workflows

## 🛠️ Core Tools

### Shell & Terminal

- **[Zsh](https://www.zsh.org/)** - Primary shell with [Zim framework](https://zimfw.sh/)
- **[WezTerm](https://wezfurlong.org/wezterm/)** - GPU-accelerated terminal with Gruvbox theme
- **[Starship](https://starship.rs/)** - Fast, customizable prompt
- **[tmux](https://github.com/tmux/tmux)** - Terminal multiplexer with modular configuration

### Development

- **[Neovim](https://neovim.io/)** - Primary editor (managed as git submodule)
- **[VS Code](https://code.visualstudio.com/)** - Secondary editor with comprehensive extensions
- **[Lazygit](https://github.com/jesseduffield/lazygit)** - Terminal UI for git commands
- **[Git](https://git-scm.com/)** - Version control with SSH signing via 1Password

### System & Productivity

- **[Aerospace](https://github.com/nikitabobko/AeroSpace)** - Tiling window manager
- **[Karabiner Elements](https://karabiner-elements.pqrs.org/)** - Keyboard customization
- **[Borders](https://github.com/FelixKratz/JankyBorders)** - Window border highlighting
- **[1Password](https://1password.com/)** - Password management with SSH/Git signing

### Language Support

- **Python**: pyenv + pyenv-virtualenv (lazy-loaded)
- **Node.js**: fnm with auto-switching `.nvmrc` support
- **Rust**: Full toolchain with rust-analyzer
- **Go**: Latest version via Homebrew
- **Docker**: Development containerization

### CLI Utilities

- **[eza](https://github.com/eza-community/eza)** - Modern `ls` replacement
- **[bat](https://github.com/sharkdp/bat)** - Better `cat` with syntax highlighting
- **[fd](https://github.com/sharkdp/fd)** - Fast `find` alternative
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** - Ultra-fast text search
- **[fzf](https://github.com/junegunn/fzf)** - Fuzzy finder with tab completion
- **[yazi](https://github.com/sxyazi/yazi)** - Terminal file manager
- **[btop](https://github.com/aristocratos/btop)** - Resource monitor

## 📋 Quick Start

### Prerequisites

- macOS (tested on Apple Silicon)
- Command Line Tools: `xcode-select --install`

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/ewhanhan/.dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install Homebrew packages**

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   brew bundle --file=homebrew/Brewfile
   ```

3. **Initialize git submodules** (for Neovim config)

   ```bash
   git submodule update --init --recursive
   ```

4. **Symlink configurations**

   ```bash
   stow */
   ```

5. **Restart your shell**
   ```bash
   exec zsh -l
   ```

### Post-Installation Setup

1. **Configure 1Password SSH signing**

   - Enable SSH agent in 1Password settings
   - Import your SSH key for Git signing

2. **Set up tmux plugins**

   ```bash
   # Start tmux and install plugins
   tmux
   # Press Ctrl-a + I to install plugins
   ```

3. **Update everything**
   ```bash
   uuu  # Master update command
   ```

## 📁 Repository Structure

```
~/.dotfiles/
├── .stowrc                 # Stow configuration
├── CLAUDE.md              # AI assistant instructions
├── README.md              # This file
├── aerospace/             # Aerospace tiling WM config
├── borders/               # Window borders config
├── ghostty/               # Ghostty terminal config
├── git/                   # Git configuration & aliases
├── homebrew/              # Homebrew package definitions
├── karabiner/             # Keyboard customization
├── lazygit/               # Git TUI configuration
├── nvim/                  # Neovim config (git submodule)
├── starship/              # Shell prompt configuration
├── tmux/                  # tmux configuration (modular)
├── vim/                   # Vim configuration
├── wezterm/               # Terminal emulator config
└── zsh/                   # Zsh shell configuration
```

## ⚡ Key Commands & Aliases

### System Updates

```bash
uuu         # Update everything (Homebrew, npm, zim, macOS, nvim, tmux plugins)
brewup      # Update Homebrew packages and cleanup
brewdump    # Export current Homebrew state to Brewfile
zimU        # Update Zim framework
nvimU       # Update Neovim plugins headlessly
```

### Development

```bash
lg          # Launch Lazygit
vim/vi      # Aliased to Neovim
c           # Clear terminal
s           # Reload shell
N           # npm run (shorthand)
```

### Navigation & Files

```bash
l           # Enhanced ls with eza (icons, symlinks, directories first)
ll          # Detailed directory listing
...         # cd ../.. (up to 6 levels)
1-9         # cd to directory from history (cd -1, cd -2, etc.)
```

### Docker

```bash
d           # docker
dc          # docker-compose
ddkill      # Kill Docker Desktop process
```

## 🎨 Theming

The entire configuration uses the **Gruvbox** color scheme for consistency:

- Terminal: Gruvbox Dark
- Neovim: Gruvbox colorscheme
- tmux: Gruvbox-inspired status line
- VS Code: Gruvbox themes available

## ⌨️ Key Bindings

### tmux (Prefix: Ctrl-a)

- `Ctrl-a c` - New window
- `Ctrl-a |` - Vertical split
- `Ctrl-a -` - Horizontal split
- `Ctrl-a hjkl` - Vim-style pane navigation
- `Ctrl-a r` - Reload configuration

### Aerospace (Window Management)

- `Alt-Enter` - Launch WezTerm
- `Alt-Ctrl-Shift-/` - Toggle layout
- `Alt-[1-9]` - Focus windows on workspace 1-9
- `Alt-Shift-[1-9]` - Move windows to workspace 1-9

### Zsh

- **fzf-tab**: Enhanced tab completion with fuzzy search
- **Vi mode**: Vim-style command line editing
- **Auto-suggestions**: Based on history and completions

## 🔧 Configuration Highlights

### Zsh Configuration

- **Zim Framework**: Fast, modular Zsh configuration
- **fzf-tab**: Fuzzy tab completion with file previews
- **Lazy-loaded pyenv**: Faster shell startup
- **Auto fnm**: Automatic Node.js version switching

### Git Configuration

- **SSH signing**: Via 1Password for commit verification
- **Delta pager**: Beautiful git diffs with syntax highlighting
- **Comprehensive aliases**: 100+ git shortcuts
- **Smart defaults**: autosquash, autostash, zdiff3 conflicts

### tmux Configuration

- **Modular design**: Split across multiple config files
- **Vim keybindings**: Consistent with editor experience
- **Clipboard integration**: Seamless copy/paste with macOS
- **Plugin management**: Via TPM (tmux plugin manager)

### WezTerm Configuration

- **Auto-tmux**: Automatically starts/attaches tmux session
- **Gruvbox theme**: Consistent with overall aesthetic
- **Optimized performance**: 120fps, GPU acceleration
- **Smart defaults**: Hide tab bar, proper padding

## 📦 Package Management

### Homebrew Brewfile

The `homebrew/Brewfile` contains:

- **66 CLI tools** - Development utilities, system tools
- **30 GUI applications** - Essential macOS apps
- **6 Mac App Store apps** - Safari extensions, utilities
- **60 VS Code extensions** - Complete development setup
- **4 Nerd Fonts** - Programming fonts with icons

### Key Categories

- **Development**: docker, git, gh, lazygit, neovim, rust, go, python tools
- **CLI Utilities**: bat, eza, fd, fzf, ripgrep, yazi, btop
- **System**: aerospace, karabiner, 1password, borders
- **Media**: ffmpeg, imagemagick, video/image optimization tools

## 🚀 Performance Optimizations

### Shell Startup

- **Lazy pyenv loading**: Only load when Python is used
- **Optimized Zim**: Minimal, fast framework
- **Efficient aliases**: Shortened commands for common tasks

### System Integration

- **Aerospace**: Efficient tiling without heavy desktop environments
- **WezTerm**: GPU-accelerated rendering
- **Native integrations**: 1Password SSH, clipboard sync

## 🔄 Maintenance

### Regular Updates

```bash
uuu  # Master update command covers everything
```

This single command updates:

- Homebrew packages
- npm global packages
- Zim framework
- Mac App Store apps
- Neovim plugins
- macOS system updates
- tmux plugins
- Shell reload

### Package Management

```bash
brewdump    # Export current state after installing new packages
stow */     # Re-link configs after modifications
```

## 🛡️ Security

- **SSH signing**: All commits signed via 1Password
- **No hardcoded secrets**: Configurations use external references
- **Homebrew verification**: All packages from trusted sources
- **Minimal permissions**: Tools only request necessary access

## 🤝 Contributing

This is a personal configuration, but feel free to:

- Fork and adapt for your needs
- Open issues for questions
- Submit PRs for improvements
- Share your own dotfiles inspiration

## 📄 License

MIT License - Feel free to use any part of this configuration in your own dotfiles.

## 🙏 Acknowledgments

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) - Dotfiles inspiration
- [Zim Framework](https://zimfw.sh/) - Fast Zsh configuration
- [GNU Stow](https://www.gnu.org/software/stow/) - Elegant symlink management
- [Gruvbox](https://github.com/morhetz/gruvbox) - Beautiful color scheme
- [Homebrew](https://brew.sh/) - The missing package manager for macOS

---

_Last updated: June 15 2025_

