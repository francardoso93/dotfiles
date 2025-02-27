# #GIT
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git -y
git --version
git config --global user.name "Francisco Cardoso"
git config --global user.email "francardoso@outlook.com"
# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
#VsCode
sudo snap install --classic code # or code-insiders#
echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p # https://github.com/flathub/com.visualstudio.code/issues/29
#SSH
ssh-keygen
# #Postman
# sudo snap install postman
# Docker # https://tecadmin.net/install-docker-on-ubuntu/
sudo apt-get purge docker-ce docker lxc-docker docker-engine docker.io
sudo apt-get install curl apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo usermod -aG docker $USER
# Docker-Compose
sudo curl -L https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
# # Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
# Kind (Lightweight Kubernetes)
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.25.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
# Helm (Kub package manager)
sudo snap install helm --classic
helm plugin install https://github.com/databus23/helm-diff
# Add Helm Rabbit Repository # helm install --kubeconfig=/home/francisco/.kube/k3s.yaml rabbit bitnami/rabbitmq --namespace logistics
#helm repo add bitnami https://charts.bitnami.com/bitnami
#helm repo update
#echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
# ZSH
sudo apt install zsh -y
sudo apt-get install powerline fonts-powerline -y
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
# Terminator
sudo add-apt-repository ppa:gnome-terminator/nightly
sudo apt-get update
sudo apt-get install terminator -y
# Curl
sudo apt install curl -y
# Build Essentials
sudo apt-get install build-essential
# ASDF
ASDF_BINARY_FILE=asdf-v0.16.4-linux-amd64.tar.gz
curl -sLO https://github.com/asdf-vm/asdf/releases/download/v0.16.4/$ASDF_BINARY_FILE
tar zxvf "$ASDF_BINARY_FILE"
sudo mv asdf /usr/local/bin/
asdf --version
# ASDF Node
asdf plugin-add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs latest
asdf global nodejs latest
node -v
# # # ASDF Java
# # asdf plugin-add java https://github.com/halcyon/asdf-java.git
# # asdf install java latest:adoptopenjdk-17
# # asdf global java latest:adoptopenjdk-17
# # echo -e '\n. $HOME/.asdf/plugins/java/set-java-home.zsh' >> ~/.zshrc
# # echo -e '\n. $HOME/.asdf/plugins/java/set-java-home.bash' >> ~/.bashrc
# # ASDF Go
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang latest
asdf global golang latest
echo -e '\nexport GOROOT="$(asdf where golang)/go/"' >> ~/.zshrc
echo -e '\nexport CC="gcc"' >> ~/.zshrc
# Ruby
# sudo apt-get install ruby-full -y
# sudo gem install bundler
# Terraform
asdf plugin add terraform
asdf install terraform latest
# Pulumi
curl -fsSL https://get.pulumi.com | sh
# Tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool -y
# Slack
sudo snap install slack --classic
# Zoom
sudo snap install zoom-client
# # Discord
# sudo snap install discord
# #psql
sudo apt-get install -y postgresql-client
# # AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# # Isolate Workspaces
# gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
# # Peek (Gif Recorder) # Can't find this on Ubuntu 22
# # sudo add-apt-repository ppa:peek-developers/stable
# # sudo apt-get update
# # sudo apt-get install peek -y
# # OBS (Video Recorder)
# sudo add-apt-repository ppa:pbsproject/obs-studio
# sudo apt-get update
# sudo apt-get install obs-studio -y
# # OpenShot (Video Editor)
# # sudo add-apt-repository ppa:openshot.developers/ppa
# # sudo apt-get update
# # sudo apt-get install openshot-qt -y ##Da ultima vez que instalei assim, ficava travando durante a execucao
# # Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/francisco/.profile
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# pgcli 
sudo apt-get install pgcli
# k8s krew
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
echo -e '\nexport PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.zshrc
echo -e '\nexport PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
# stern
kubectl krew install stern
# # kubens
kubectl krew install ns
# Kube PS1 (to show current context and ns) need to be done manually, but easy. See: https://github.com/jonmosco/kube-ps1sudo 
# k6
# sudo gpg -k
# sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
# echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
# sudo apt-get update
# sudo apt-get install k6
# # Warp CLI
# sudo apt-get install wget gpg -y
# wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
# sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
# rm warpdotdev.gpg
# sudo apt update && sudo apt install warp-terminal -y
# sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/warp-terminal 100 # Default Terminal
# # Falcon Sensor (Get '.deb' file from Slack conversation with Felix T. Bellemare and Martin Bruno on slack. Get CID from the same conversation)
# sudo dpkg -i Downloads/falcon-sensor_7.14.0-16703_amd64.deb
# sudo /opt/CrowdStrike/falconctl -s --cid=<CCID>
# Cloudflare warp. More details on this doc: https://sonder.freshservice.com/support/solutions/articles/16000081760
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bookworm main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt update && sudo apt install cloudflare-warp -y
# Store git pass safetly (Clone private repos using 'https')
# https://gist.github.com/sgarciav/b709c871fb040e3444e044642e3d8709
sudo apt install pass
gpg --full-generate-key # Create with the name 'Francisco'
pass init "Francisco" # After that, you can clone a private repo using https without poluting URL with access token
# GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
gh auth login
# Sonder CLI (Must be done after gh auth)
gh release download v2.2.0 -R Flatbook/sonder-cli --pattern "*linux_amd64.tar.gz"
tar zxvf sonder_2.2.0_linux_amd64.tar.gz
sudo mv sonder /usr/local/bin
rm sonder_2.2.0_linux_amd64.tar.gz
sonder setup
# Volta
curl https://get.volta.sh | bash
# Add this to your .bashrc or .zshrc
echo -e 'export PATH=~/.volta/bin:$PATH' >> ~/.zshrc
# Volta pnpm and node
volta install node pnpm
# IstioCTL
curl -sL https://istio.io/downloadIstioctl | sh -
echo -e '\nexport PATH=$HOME/.istioctl/bin:$PATH' >> ~/.zshrc
# FuzzyFinder for CLI (That's enought to get the augmented ctrl+R)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf/
./install
# jq
sudo apt-get install jq
# rpgrep - search for words in file
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
# fd - user friendly 'find'
sudo apt install fd-find
# zsh history sync
# sudo apt install gpg git
# git clone git@github.com:wulfgarpro/history-sync.git
# cp -r history-sync ~/.oh-my-zsh/plugins
# argocli
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.5.11/argo-linux-amd64.gz
gunzip argo-linux-amd64.gz
chmod +x argo-linux-amd64
sudo mv ./argo-linux-amd64 /usr/local/bin/argo
argo version
# argocd cli
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
argocd version
# # Difftastic
# curl -sLO https://github.com/Wilfred/difftastic/releases/download/0.60.0/difft-x86_64-unknown-linux-gnu.tar.gz
# tar -xvzf difft-x86_64-unknown-linux-gnu.tar.gz
# chmod +x difft
# sudo mv ./difft /usr/local/bin/
# difft
# Must Fix# Nushell
# sudo apt install pkg-config libssl-dev build-essential
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# source ~/.bashrc
# rustup install 1.80.1
# cargo install nu
# wher
# https://github.com/awslabs/amazon-ecr-credential-helper
# ECR credential helper # Needed for Skopeo + ECR login # https://github.com/containers/skopeo/issues/1798#issuecomment-1296309392
sudo apt update -y
sudo apt install amazon-ecr-credential-helper -y
# Skopeo
sudo apt -y update
sudo apt -y install skopeo
# KubeBuilder
# download kubebuilder and install locally.
curl -L -o kubebuilder "https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)"
chmod +x kubebuilder && sudo mv kubebuilder /usr/local/bin/
## TODO: New tools:
# k9s
wget https://github.com/derailed/k9s/releases/download/v0.40.5/k9s_linux_amd64.deb
sudo apt install ./k9s_linux_amd64.deb -y
rm k9s_linux_amd64.deb
# Neovim
NEOVIM_BINARY_FILE=nvim-linux-x86_64.tar.gz
curl -sLO https://github.com/neovim/neovim/releases/latest/download/$NEOVIM_BINARY_FILE
tar zxvf "$NEOVIM_BINARY_FILE"
sudo mv nvim-linux-x86_64/bin/nvim /usr/local/bin/

# Wireshark
# sudo add-apt-repository ppa:wireshark-dev/stable
# sudo apt-get update
# sudo apt-get install wireshark -y
# TODO: silver-surfer (About cluster updates, let's test it)

### TODO: Will have to move several things that are adding directly to .ZSHRC file to dotfiles instead
### TODO: I could move this entire script there.