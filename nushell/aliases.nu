
alias rm = rm -i
alias vim = nvim

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
