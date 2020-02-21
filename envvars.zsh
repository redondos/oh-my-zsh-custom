export EDITOR=vim
export GOPATH=~/src/golang
export HOMEBREW_NO_INSTALL_CLEANUP=1

export GITHUB_OAUTH_TOKEN=$(/usr/bin/security -q find-internet-password -g -w -s github-oauth-token -a redondos)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
