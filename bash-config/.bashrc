
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export EDITOR="nano"

# Add to your Bash config file
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi

eval "$(starship init bash)"

alias sshagent='eval `ssh-agent -s`'
alias ssht="ssh -D 30000 -f -C -q -N workspace"
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
alias lsof-listen="sudo lsof -i -P -n | grep LISTEN"
alias netstat-listen="sudo netstat -tulpn | grep LISTEN"
alias docker-clear="docker rm $(docker ps -a -q -f status=exited)"
