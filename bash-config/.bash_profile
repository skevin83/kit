
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

export PATH="$PATH:$HOME/.local/bin:$HOME/bin"
export LBC_VERSION="v2.0.0"
export KUBECONFIG="$HOME/.kube/config"
