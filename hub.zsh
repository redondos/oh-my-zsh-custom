#eval "$(hub alias -s)"
#compdef hub=git

export GITHUB_USER=redondos
export GITHUB_PASSWORD=$(keychain_password redondos github.com)
