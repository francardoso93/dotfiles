
alias rm = rm -i
alias vim = nvim
def ac [] {
  let config = (sonder config aws)
  eval $config
}

def git-push-empty [] {
  git commit --allow-empty -m "empty commit"
  git push
} 


# Finds a process by port and kills it
def killport [port:int] {
  let pid = (sudo lsof -t -i:$port | str trim)
  if $pid != "" {
    sudo kill -9 $pid
  } else {
    print "No process found on port $port"
  }
}

# def dotfiles [] {
#   cd ~/dotfiles
#   nvim .
# }
alias dotfiles = code ~/dotfiles

# k8s aliases
alias k = kubectl
alias kd1 = k --context "sonder-dev-1/kube-admin" 
alias kd1-stern = k stern --context "sonder-dev-1/kube-admin" 
alias kd3 = k --context "sonder-dev-3/kube-admin" 
alias kd3-stern = k stern --context "sonder-dev-3/kube-admin" 
alias ks1 = k --context "sonder-staging-1/kube-admin" 
alias ks1-stern = k stern --context "sonder-staging-1/kube-admin" 
alias ks3 = k --context "sonder-staging-3/kube-admin" 
alias ks3-stern = k stern --context "sonder-staging-3/kube-admin" 
alias kp1 = k --context "sonder-prod-1/kube-admin" 
alias kp1-stern = k stern --context "sonder-prod-1/kube-admin" 
alias kp3 = k --context "sonder-prod-3/kube-admin" 
alias kp3-stern = k stern --context "sonder-prod-3/kube-admin" 
alias ki2 = k --context "sonder-infra-2/kube-admin" 
alias ki2-stern = k stern --context "sonder-infra-2/kube-admin" 
alias aws-web = sonder aws console
alias sonder-beta = /home/francisco/projects/sonder-cli/sonder-cli

  