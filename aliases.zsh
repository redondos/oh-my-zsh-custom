if which gls &>/dev/null; then
    alias gls='gls --col'
    alias ls='gls'
    alias l='gls -lah'
    alias la='gls -ash'
    alias ll='gls -lh'
    alias lla='gls -lah'
fi

alias vi=vim
alias -g L='| less'
alias -g G='| grep'
alias -g Gi='| grep -i'

alias ack-grep='ack'

alias ssh256='ssh -v -c aes256-ctr'
alias randomize="perl -MList::Util -e 'print List::Util::shuffle <>'"
