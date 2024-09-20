source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim

source $ZSH/oh-my-zsh.sh
source_if_exists $DOTFILES/zsh/aliases.zsh

export CC="gcc"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export GCM_CREDENTIAL_STORE=gpg
export AWS_CSM_ENABLED=true
# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# asdf Go
export GOROOT="$(asdf where golang)/go"
export PATH=$PATH:$HOME/.asdf/installs/golang/1.22.4/packages/bin
# Pulumi
export PATH=$PATH:/home/francisco/.pulumi/bin
# Istioctl
export PATH=$PATH:$HOME/.istioctl/bin
# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"
export PATH="$PATH:~/.volta/bin"

# Add stuff that you want hot reload for every command. Ex: Importing an aliases file
# precmd() {

# }
