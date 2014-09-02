#eval "$(hub alias -s)"
#compdef hub=git

if [[ -e /usr/bin/security ]]; then
  export GITHUB_USER=redondos
  export GITHUB_PASSWORD=$(/usr/bin/security -q find-internet-password -g -w -s github.com -a redondos)
fi
