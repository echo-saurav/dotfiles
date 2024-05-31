# for inital config
# install zsh and make it default shell
# install antigen plugin for zsh
# https://github.com/zsh-users/antigen

# antigen config
# ANTIGEN_LOG="~/.antigen.log"

source ~/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle KulkarniKaustubh/fzf-dir-navigator@main
antigen bundle Aloxaf/fzf-tab
# antigen bundle jeffreytse/zsh-vi-mode
antigen bundle momo-lab/zsh-abbrev-alias
antigen bundle MichaelAquilina/zsh-you-should-use
# antigen bundle olets/zsh-abbr@main
# antigen bundle zsh-users/zsh-history-substring-search
antigen theme spaceship-prompt/spaceship-prompt
antigen apply




export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.docker/bin
export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin

# export PATH=$PATH:$HOME/miniconda/bin/
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' menu select
# prompt config
# https://spaceship-prompt.sh/
SPACESHIP_USER_SHOW=false
SPACESHIP_GIT_STATUS_UNTRACKED=
SPACESHIP_GIT_STATUS_MODIFIED="m"



alias rm="rm -i"
#alias vim="nvim"
alias vim="lvim"
alias r=". ranger"
alias ls="ls --color"
alias htop="bashtop"
alias top="htop"


## dir and file alias
# alias -g h="~/"
# alias -g d="~/docker/data/"
# alias -g dc="~/docker/dockerCompose/"
# alias -g s="~/storage/public/"


export VISUAL=lvim;
export EDITOR=lvim;
setopt incappendhistory


#calculator
function = () {
	local IFS=' '
	local calc="${*//p/+}"
	calc="${calc//x/*}"
	bc -l <<<"scale=10;$calc"
}

HISTSIZE=8000
SAVEHIST=8000
HISTFILE=~/.zsh_history


# zsh-autosuggestions config
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=false


bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# select one word in paths
autoload -U select-word-style
select-word-style bash

# history search
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down


# <tab> dont auto complete 
# https://github.com/ajeetdsouza/zoxide
# eval "$(zoxide init --cmd cd zsh)"


#________________________________________________
# plugin code
# sudo will add before the command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e\e" sudo-command-line


abbrev-alias -g com="cd ~/docker/dockerCompose/"
abbrev-alias -g h="cd ~/"
abbrev-alias -g s="cd ~/storage/public/"
#
## abbr 
# abbr import-aliases 
# abbr -g h="~/"
# abbr -g hd="~/docker"
# abbr -g hdd="~/docker/data/"
# abbr -g hdc="~/docker/dockerCompose/"





