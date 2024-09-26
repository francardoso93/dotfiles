alias k="kubectl"
alias rm="rm -i"
alias ac='eval $(sonder config aws)'
alias vim=nvim

# k8s aliases
alias ks1='k --context "sonder-staging-1/kube-admin"'
alias ks1-stern='k stern --context "sonder-staging-1/kube-admin"'
alias ks3='k --context "sonder-staging-3/kube-admin"'
alias ks3-stern='k stern --context "sonder-staging-3/kube-admin"'
alias kp1='k --context "sonder-prod-1/kube-admin"'
alias kp1-stern='k stern --context "sonder-prod-1/kube-admin"'
alias kp3='k --context "sonder-prod-3/kube-admin"'
alias kp3-stern='k stern --context "sonder-prod-3/kube-admin"'
alias ki2='k --context "sonder-infra-2/kube-admin"'
alias ki2-stern='k stern --context "sonder-infra-2/kube-admin"'

# Functions
killport () {
  PID=$(sudo lsof -t -i:$1)
  sudo kill -9 ${PID}
}

git-reset-soft-all() {
  export TARGET_BRANCH=$(git rev-parse --abbrev-ref HEAD); git checkout main; git pull; git checkout $TARGET_BRANCH; git merge main; git reset --soft HEAD~$(git rev-list --left-right --count main...$TARGET_BRANCH | awk '{print $2}')
}
