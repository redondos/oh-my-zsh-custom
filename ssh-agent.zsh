zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github
setopt extendedglob
#ssh-add -K ~/.ssh/id_rsa*~*pub &> /dev/null
