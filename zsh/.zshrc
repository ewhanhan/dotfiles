# Fnm autocompletions
# https://github.com/Schniz/fnm
eval "$(fnm env --use-on-cd)"

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="code"

zstyle ':omz:update' mode auto    # update automatically without asking
export DISABLE_UPDATE_PROMPT=true # accept updates by default

HOMEBREW_NO_ENV_HINTS=1
HOMEBREW_NO_ANALYTICS=1

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  zsh-z
  ripgrep
  colored-man-pages
  dotenv
  command-not-found
  brew
  aliases
  fnm
  vscode
  git-auto-fetch
  macos
  npm
  pyenv
  autoenv
  docker-compose
)

autoload -U promptinit && promptinit
autoload -U colors && colors

source $ZSH/oh-my-zsh.sh

# https://github.com/zsh-users/zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Reload the zsh-completions
autoload -U compinit && compinit -i

# https://github.com/zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# https://github.com/zsh-users/zsh-syntax-highlighting
source /Users/ehan/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
source $HOME/.zsh_aliases

# >>> pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if which pyenv-virtualenv-init >/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
# <<< pyenv

# z completion
if [ -f "$HOMEBREW_PREFIX/etc/profile.d/z.sh" ]; then
  . "$HOMEBREW_PREFIX/etc/profile.d/z.sh"
fi

# starship
eval "$(starship init zsh)"

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
