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

# export PATH=$PATH:$HOME/miniconda/bin/

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

# history search
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down


# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"


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


# ___________________________________________________________________
# abbr
## declare a list of expandable aliases to fill up later
typeset -a ealiases
ealiases=()

# write a function for adding an alias to the list mentioned above
function abbr() {
    alias $1
    ealiases+=(${1%%\=*})
}

# expand any aliases in the current line buffer
function expand-ealias() {
    if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}
zle -N expand-ealias

# Bind the space key to the expand-alias function above, so that space will expand any expandable aliases
bindkey ' '        expand-ealias
bindkey '^ '       magic-space     # control-space to bypass completion
bindkey -M isearch " "      magic-space     # normal space during searches

# A function for expanding any aliases before accepting the line as is and executing the entered command
expand-alias-and-accept-line() {
    expand-ealias
    zle .backward-delete-char
    zle .accept-line
}
zle -N accept-line expand-alias-and-accept-line
# ___________________________________________________________________





