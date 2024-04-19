
# alias jdk15="export JAVA_HOME=${JAVA_15_HOME}; export PATH=${JAVA_15_HOME}/bin:${OPATH};"
# alias jdk8="export JAVA_HOME=${JAVA_8_HOME}; export PATH=${JAVA_8_HOME}/bin:${OPATH};"
alias kubectl="nocorrect kubectl"
alias crictl="nocorrect crictl"
alias ka='kubectl apply -f'
alias kd='kubectl delete -f'
alias kg='kubectl get pod --all-namespaces -owide'
alias kgw='kubectl get pod --all-namespaces -owide -w'
alias ll="chpwd -lhaBgb"
alias ls="chpwd"
alias la="chpwd -a"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias pshell="source .venv/bin/activate"

alias pys="cd ~/Code/sohunjug/python/sohunjug"

# alias ec="$BREW_PERFIX/bin/emacsclient"
#

if [[ "${OS}"  == "Linux" ]]; then
  alias ccat="/bin/cat"
  alias cat="batcat -p"
else
  alias cat="bat -p"
  alias ccat="ccat --bg=dark"
fi

alias tar="tar --exclude '.DS_Store' --exclude '__MACOSX'"
alias pyssh="${HOME}/.sshlist/ssh.py"
alias vi=nvim
alias vibrew="nvim ~/Code/dotfiles/Brewfile"

#####################
# ALIASES           #
#####################
alias vim=$EDITOR
alias tf=terraform
alias l="exa -abghHlS --git --group-directories-first"
alias sysinfo=neofetch
alias startdebian="limactl start debian"
alias stopdebian="limactl stop debian"
alias debian="limactl shell debian"
alias spsu="sudo port -v selfupdate"
alias spu="sudo port upgrade outdated"
alias sp="sudo port"
alias inn="innernet"
