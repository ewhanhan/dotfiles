ZIM_HOME=~/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------
# Source
# ------------------
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"
[ -f "$HOME/.zsh_keybindings" ] && source "$HOME/.zsh_keybindings"
[ -f "~/.config/op/plugins.sh" ] && source ~/.config/op/plugins.sh

# ------------------
# export
# ------------------
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
export CONFIG_DIR="$HOME/.config/lazygit"
export PATH="$HOME/.docker/bin:$PATH"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# ------------------
# Lazy loading pyenv
# ------------------
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

if type pyenv > /dev/null; then
    [[ ":$PATH:" != *":${PYENV_ROOT}/bin:"* ]] && export PATH="${PYENV_ROOT}/bin:$PATH"
    [[ ":$PATH:" != *":${PYENV_ROOT}/shims:"* ]] && export PATH="${PYENV_ROOT}/shims:$PATH"

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
eval "$(fnm env --use-on-cd --shell zsh)"

typeset -U path PATH
