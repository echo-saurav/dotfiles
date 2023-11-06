# for inital config
# install zsh and make it default shell
# install antigen plugin for zsh
# https://github.com/zsh-users/antigen

source ~/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle KulkarniKaustubh/fzf-dir-navigator@main
antigen bundle Aloxaf/fzf-tab
# antigen bundle zsh-users/zsh-history-substring-search
antigen theme spaceship-prompt/spaceship-prompt
antigen apply

export PATH="/opt/homebrew/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.docker/bin
export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin

zstyle ':completion:*' menu select
# prompt config
# https://spaceship-prompt.sh/
SPACESHIP_USER_SHOW=false
SPACESHIP_GIT_STATUS_UNTRACKED=
SPACESHIP_GIT_STATUS_MODIFIED="m"

alias rm="rm -i"
alias vim="lvim"
alias r="ranger"
alias ls="ls --color"


export VISUAL=lvim;
export EDITOR=lvim;

#calculator
function = () {
	local IFS=' '
	local calc="${*//p/+}"
	calc="${calc//x/*}"
	bc -l <<<"scale=10;$calc"
}


# zsh-autosuggestions config
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=false
HISTFILE=$HOME/.zsh_history

# bindkey "^[^[[D" backward-word
# bindkey "^[^[[C" forward-word
# bindkey "^[a" beginning-of-line
# bindkey "^[e" end-of-line

# history search
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down



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
bindkey "\e\e" sudo-command-line


if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi
