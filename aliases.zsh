if which gls &>/dev/null; then
    alias gls='gls --col'
    alias ls='gls'
    alias l='gls -lh'
    alias ll='gls -lah'
    alias la='gls -ash'
    alias lla='gls -lah'
fi

alias vi=vim
alias -g L='| less'
alias -g G='| grep'
alias -g Gi='| grep -i'

alias ack-grep='ack'

alias ssh256='ssh -v -c aes256-ctr'
alias randomize="perl -MList::Util -e 'print List::Util::shuffle <>'"

alias t='tmux new-session -A -s main'
alias st='tmux new-session -A -s main'

alias cat='bat --plain --paging never'
alias ping=prettyping
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(subl {})+abort'"
# alias find=fd

if which exa &>/dev/null; then
    #alias ls='exa'
    alias la='exa -ash --git'
    alias l='exa -lh --git'
    #alias ll='exa -lah --git'
    alias lla='exa -lah --git'
    alias llg='exa -lah --git --grid'
fi

alias mag=magrathean

alias rg='rg --sort path'
alias rr=/usr/local/bin/ranger
