# ZDEBUG=enable
if [[ "$ZDEBUG" == "enable" ]]; then
  zmodload zsh/datetime
  setopt PROMPT_SUBST
  PS4='+$EPOCHREALTIME %N:%i> '

  logfile=$(mktemp zsh_profile.7Pw1Ny0G)
  echo "Logging to $logfile"
  exec 3>&2 2>$logfile

  setopt XTRACE
  # zmodload zsh/zprof
fi

[[ ! -f $S_ZSH/proxy.zsh ]] || source $S_ZSH/proxy.zsh

export ARCH="$(uname -m)"
if [[ "${ARCH}"  == "arm64" ]]; then
  export BREW_PREFIX="/opt/homebrew"
else
  export BREW_PREFIX="/usr/local"
fi

export ZPLUG_HOME=$BREW_PREFIX/opt/zplug
source $ZPLUG_HOME/init.zsh

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

if type brew &>/dev/null
then
  FPATH="$BREW_PREFIX/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
#####################
# SETOPT            #
#####################
# set -o emacs
setopt vi
setopt prompt_subst 
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
setopt interactivecomments
zstyle ':completion:*' rehash true

bindkey '\eOA'    history-substring-search-up
bindkey '\eOB'    history-substring-search-down
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey '^o'      autosuggest-accept
## zsh common
CASE_SENSITIVE="false"

## Bulletrain
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  status
  git
  time
)
BULLETTRAIN_STATUS_EXIT_SHOW=true

for file in $S_ZSH/{envs,functions,plugins,aliases,p10k}.zsh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
# [[ ! -f $S_ZSH/envs.zsh      ]] || source $S_ZSH/envs.zsh
# [[ ! -f $S_ZSH/functions.zsh ]] || source $S_ZSH/functions.zsh
# [[ ! -f $S_ZSH/plugins.zsh   ]] || source $S_ZSH/plugins.zsh
# [[ ! -f $S_ZSH/aliases.zsh   ]] || source $S_ZSH/aliases.zsh
# [[ ! -f $S_ZSH/lazy.zsh      ]] || source $S_ZSH/lazy.zsh
# [[ ! -f $S_ZSH/p10k.zsh      ]] || source $S_ZSH/p10k.zsh
[[ ! -f $HOME/.fzf.zsh       ]] || source $HOME/.fzf.zsh
[[ ! -f $HOME/.local.zsh     ]] || source $HOME/.local.zsh

if zplug check b4b4r07/enhancd; then
    export ENHANCD_FILTER=fzf-tmux
fi

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load

if [[ "$ZDEBUG" == "enable" ]]; then
  unsetopt XTRACE
  exec 2>&3 3>&-
fi
