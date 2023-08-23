# EC2 Ubuntu
```sh
vim ~/.bashrc
### begin
set -o vi
export DEBIAN_FRONTEND=noninteractive
export EDITOR=vim
### end
source .bashrc

sudo apt update
sudo apt install -y vim sudo curl git build-essential
# CI=1 to avoid asking the password for becoming root
CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

vim ~/.bashrc
### begin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
### end
source .bashrc

# brew
brew install \
  zsh \
  tmux \
  gh \
  fd \
  neovim \
  ripgrep \
  starship \
  exa \
  lazygit \
  fzf \
  starship \
  tealdeer \
  bat \
  git-delta \
  postgresql@14 \
  micromamba \
  zoxide

# docker
sudo snap install docker
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git config --global init.defaultBranch main
git init --bare $HOME/.dotfiles
alias d='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
d config --local status.showUntrackedFiles no

sudo vim /etc/shells
### begin
/home/linuxbrew/.linuxbrew/bin/zsh
### end

# ohmyz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# nvims
# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b

# https://www.lazyvim.org/
git clone https://github.com/LazyVim/starter ~/.config/LazyVim
rm -rf ~/.config/LazyVim/.git

# https://github.com/nvim-lua/kickstart.nvim
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/kickstart
rm -rf ~/.config/kickstart/.git

# https://nvchad.com/
git clone --depth 1 https://github.com/NvChad/NvChad ~/.config/NvChad

# https://astronvim.com/
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/AstroNvim

git config --global user.name "onefootball-data-insights"
git config --global user.email "82086424+onefootball-data-insights@users.noreply.github.com"
```

# Git author and committer
* Committer: "onefootball-data-insights <82086424+onefootball-data-insights@users.noreply.github.com>"
* Author: "Alberto Miorin <109069886+alberto-of@users.noreply.github.com>"

```
git commit --amend --author="Alberto Miorin <109069886+alberto-of@users.noreply.github.com>" --no-edit
```

