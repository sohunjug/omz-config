zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'
zstyle ':completion:*:correct:*'                    insert-unambiguous true
zstyle ':completion:*:corrections'                  format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'                    original true
zstyle ':completion:*:expand:*'                     tag-order all-expansions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:matches'                      group 'yes'
zstyle ':completion:*'                              group-name ''
zstyle ':completion:*:messages'                     format '%d'
zstyle ':completion:*:options'                      auto-description '%d'
zstyle ':completion:*:options'                      description 'yes'
zstyle ':completion:*:*:-subscript-:*'              tag-order indexes parameters
zstyle ':completion:*' menu select=2
zstyle ':completion:*:warnings'                     format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:*:zcompile:*'                 ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'                       prompt 'correct to: %e'
zstyle ':completion::(^approximate*):*:functions'   ignored-patterns '_*'
zstyle ':completion::complete:*'                    gain-privileges 1
zstyle ':completion:*:manuals'                      separate-sections true
zstyle ':completion:*:manuals.*'                    insert-sections   true
zstyle ':completion:*:man:*'                        menu yes select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:(ssh|scp|rsync):*'            tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*'                group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*'                        group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255'
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == \"[process ID]\" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'|
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'

zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
  'case \"$group\" in
  \"commit tag\") git show --color=always $word ;;
               *) git show --color=always $word | delta ;;
  esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
  'case \"$group\" in
                \"modified file\") git diff $word | delta ;;
    \"recent commit object name\") git show --color=always $word | delta ;;
                                *) git log --color=always $word ;;
  esac'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle :history-search-multi-word page-size 10
zstyle :history-search-multi-word highlight-color fg=red,bold
zstyle :plugin:history-search-multi-word reset-prompt-protect 1

enable-fzf-tab

[[ ! -f $(asdf where python)/bin/virtualenvwrapper.sh ]] || source $(asdf where python)/bin/virtualenvwrapper.sh
# [[ ! -f $ASDF_DIR/shims/virtualenvwrapper.sh ]] || source $ASDF_DIR/shims/virtualenvwrapper.sh
