
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export VISUAL=nano
export EDITOR="$VISUAL"

eval "$(starship init bash)"

alias sshagent='eval `ssh-agent -s`'

alias l="ls -lah"
alias gitfolder="cd ~/github"
alias sshfolder="cd ~/.ssh"
alias gitk8s="cd ~/github/infra/k8s"
alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kgp="kubectl get pod"
alias kgn="kubectl get node"
alias kgs="kubectl get service"
alias kgi="kubectl get ingress"
alias kgsts="kubectl get statefulset"
alias kgd="kubectl get deployment"
alias kdp="kubectl describe pod"
alias kdn="kubectl describe node"
alias kds="kubectl describe service"
alias kdi="kubectl describe ingress"
alias kdsts="kubectl describe statefulset"
alias kdd="kubectl describe deployment"