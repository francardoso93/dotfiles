export DOTFILES=$HOME/dotfiles

source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

export EDITOR=nvim

plugins=(git kube-ps1)
source $ZSH/oh-my-zsh.sh

# ZSH Auto Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# My aliases
source_if_exists $DOTFILES/zsh/aliases.zsh

source_if_exists $HOME/testenvars.zsh # This file should not be committed

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Credential Store
export CC="gcc"
export GCM_CREDENTIAL_STORE=gpg
export AWS_CSM_ENABLED=true

# ASDF
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# ASDF Go
. ~/.asdf/plugins/golang/set-env.zsh
export GOPRIVATE="github.com/flatbook"
# export PATH=$PATH:$HOME/.asdf/installs/golang/1.22.4/packages/bin
# Pulumi
export PATH=$PATH:/home/francisco/.pulumi/bin
# Istioctl
export PATH=$PATH:$HOME/.istioctl/bin
# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"
export PATH="$PATH:~/.volta/bin"
export VOLTA_FEATURE_PNPM=1
# Kube-ps1
PROMPT='$(kube_ps1)'$PROMPT # or # RPROMPT='$(kube_ps1)' # type kubeoff to temporarily disable

# export local home path
export PATH="/home/$(whoami)/.local/bin:$PATH"

# Ruby rbenv
export PATH="$HOME/.rbenv/versions/2.7.8/bin:$PATH"

# Completions
source <(kubectl completion zsh)
source <(kubectl-ai completion zsh)
source <(sonder completion zsh)
source <(helm completion zsh)
source <(pulumi gen-completion zsh)

# Enable autocompletion
autoload -Uz compinit && compinit

# Add stuff that you want hot reload for every command.
precmd() {
}

