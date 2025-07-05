ZIM_HOME=~/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

#
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --all --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' show-group full

# ------------------
# Source
# ------------------
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"
[ -f "$HOME/.zsh_keybindings" ] && source "$HOME/.zsh_keybindings"
[ -f "$HOME/.config/op/plugins.sh" ] && source ~/.config/op/plugins.sh

# ------------------
# export
# ------------------
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
export CONFIG_DIR="$HOME/.config/lazygit"

path=(
  "$HOME/.tmux/plugins/tmuxifier/bin" 
  "$HOME/.local/bin"
  $path
)

# ------------------
# Lazy loading pyenv
# ------------------
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Lazy load pyenv
if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
            eval "$(command pyenv virtualenv-init -)"
        fi
        pyenv $@
    }
fi

# ------------------
# eval
# ------------------
eval "$(tmuxifier init -)"
eval "$(fnm env --use-on-cd --shell zsh --version-file-strategy=recursive)"

# PATH deduplication
typeset -U path PATH

uuu() {
  echo "Starting system updates..."
  (brewup)
 
  # Group 1: Fast framework updates (parallel)
  echo "Updating frameworks..."
  zimU &
  tpmU &

  # Group 2: Network-intensive updates (parallel)
  echo "Updating packages and editors..."
  mas upgrade &
  nvimU &
  codeU &
  npmU &
  macU & 
  wait
  
  tmuxS
  s
}
