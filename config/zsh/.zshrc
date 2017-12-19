# ------------------------------------------------------------
# zPlug
# ------------------------------------------------------------

if [[ ! -f ~/.zplug/init.zsh ]]; then
  if (( $+commands[git] )); then
    git clone https://github.com/zplug/zplug ~/.zplug
  else
    echo 'git not found' >&2
    exit 1
  fi
fi

source ~/.zplug/init.zsh

# ------------------------------------------------------------
# zPlug modules
# ------------------------------------------------------------

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zimfw/zimfw", depth:1, use:"init.zsh", hook-build:"ln -sf $ZPLUG_REPOS/zimfw/zimfw ~/.zim"
zplug "filipekiss/pure", depth:1, use:"{async,pure}.zsh", as:"theme"
zplug "filipekiss/z", use:"z.sh", depth:1, defer:1
zplug "b4b4r07/emoji-cli"
zplug "zsh-users/zsh-completions", defer:1
zplug "zsh-users/zsh-autosuggestions", defer:1
zplug "docker/cli", use:contrib/completion/zsh
zplug "docker/compose", use:contrib/completion/zsh
zplug "chriskempson/base16-shell", use:"scripts/base16-${ZSH_BASE16_THEME:-gruvbox-dark-soft}.sh"

# ------------------------------------------------------------
# Install missing modules
# ------------------------------------------------------------

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# ------------------------------------------------------------
# ZSH Settings
# ------------------------------------------------------------
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Ignore some commands and set history size
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
HISTSIZE=100000
SAVEHIST=$HISTSIZE


# ------------------------------------------------------------
# Tools
# ------------------------------------------------------------

# ------------------------------------------------------------
# FZF - https://github.com/junegunn/fzf
# ------------------------------------------------------------
export FZF_DEFAULT_OPTS='--min-height 30 --bind esc:cancel --height 50% --border --reverse --tabstop 2 --multi --margin 0,3,3,3'
export FZF_DEFAULT_COMMAND='\rg --no-messages --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------
# Homebrew options
# See https://github.com/Homebrew/brew/blob/master/docs/Tips-N%27-Tricks.md#hiding-the-beer-mug-emoji-when-finishing-a-build
# ------------------------------------------------------------

export HOMEBREW_INSTALL_BADGE="⚗️"
export HOMEBREW_NO_ANALYTICS=1


# ------------------------------------------------------------
# Source config and aliases and stuff
# ------------------------------------------------------------

DOTFILES_BIN=$(which dotfiles)
if [[ $DOTFILES_BIN ]]; then
  source $DOTFILES_BIN "source"
  for config ($DOTFILES/source/config/*.zsh) source $config
  for func ($DOTFILES/source/functions/*.zsh) source $func
fi

[[ -f ${HOME}/.zshrc.local ]] && source $HOME/.zshrc.local

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ------------------------------------------------------------
# Random prompt symbol
# ------------------------------------------------------------

SYMBOLS=(
    "❯"
    "→"
    "»"
    "৸"
)
ERROR_SYMBOLS=(
    "⎋"
    "⊘"
    "⊗"
    "×"
)

export PURE_PROMPT_SYMBOL="${SYMBOLS[$RANDOM % ${#SYMBOLS[@]}]}"
export PURE_PROMPT_SYMBOL_ERROR="${ERROR_SYMBOLS[$RANDOM % ${#ERROR_SYMBOLS[@]}]}"
