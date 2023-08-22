# brew path
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ohmyz
export ZSH="$HOME/.oh-my-zsh"

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# https://stackoverflow.com/questions/62931101/i-have-multiple-files-of-zcompdump-why-do-i-have-multiple-files-of-these
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# ohmyz
source $ZSH/oh-my-zsh.sh

# https://github.com/starship/starship
eval "$(starship init zsh)"

# vi mode
bindkey -v
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^[[Z' reverse-menu-complete
# like vim 'backspace'
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

# accept the suggestion
#bindkey '^f' vi-end-of-line

# better history
setopt inc_append_history
setopt share_history

# https://the.exa.website/
alias ls=exa
alias ll="ls -lh"
alias l="ls -la"
alias rt="ls -l --sort newest"

alias u="cd .."

# pipx
export PATH=~/.local/bin:$PATH

# https://github.com/clvv/fasd
eval "$(fasd --init auto)"

# https://neovim.io/
export EDITOR=nvim

# https://www.atlassian.com/git/tutorials/dotfiles
# d config --local status.showUntrackedFiles no
# lazygit --work-tree=$HOME --git-dir=$HOME/.dotfiles
alias d='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# poetry
export POETRY_VIRTUALENVS_IN_PROJECT=true

# tmux
alias t=tmux

# neovim
alias n=nvim

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# tldr
alias tldrf='tldr -l | fzf --preview "tldr {1} --color always" --preview-window right,70% | xargs tldr'

