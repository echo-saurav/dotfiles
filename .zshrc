# for inital config
# install zsh and make it default shell
# install antigen plugin for zsh
# https://github.com/zsh-users/antigen

source ./antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle KulkarniKaustubh/fzf-dir-navigator@main
# antigen bundle olets/zsh-abbr@main
# antigen bundle Aloxaf/fzf-tab

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
SPACESHIP_USER_SHOW=true
SPACESHIP_GIT_STATUS_UNTRACKED=
SPACESHIP_GIT_STATUS_MODIFIED="m"


alias vim="lvim"
alias r="ranger"
alias ls="ls --color"


# abbr v="lvim"
# abbr r="ranger"

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

bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line



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



