ZSH=$HOME/.oh-my-zsh

# superseded by starship prompt
#kube_cluster() {
#  kubectl config current-context
#}
#kube_context() {
#  ns=$(kubectl config get-contexts | awk '{if ($2 == "'$(kubectl config current-context)'") print $5}')
#  [[ -z $ns ]] && ns=default
#  echo $ns
#
#
#  ns=$(kubectl config get-contexts | awk '{if ($2 == "'$(kubectl config current-context)'") print $5}')

if [[ -e $ZSH/oh-my-zsh.sh ]]; then

  ZSH_THEME="gallifrey"
  #ZSH_THEME="spaceship"
  plugins=(ssh-agent git git-hubflow github git-extras mercurial osx ruby screen sublime svn vagrant kubectl brew docker fabric go iterm2 helm zsh-syntax-highlighting)
  # plugins=(ssh-agent mercurial osx ruby screen sublime svn vagrant)

  source $ZSH/oh-my-zsh.sh

  #local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
  #PROMPT="%{$fg[green]%}%M%{$reset_color%} %2~ %{$reset_color%}%B»%b "
  #RPS1="${return_code}"
  #:RPS1='${return_code} %F{244}($(kubectl config current-context))%{$reset_color%}'
  #
  # superseded by starship prompt
  # RPS1='${return_code} %F{100}(aws:$AWS_ACCOUNT)%{$reset_color%}%F{244}(k8s:$(kube_cluster):$(kube_context))%{$reset_color%}'
else

 autoload -U colors && colors

 setopt nonomatch
 setopt extendedglob

 local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

 PROMPT="%2~ %{$reset_color%}%B»%b "
 # PROMPT="%{$fg[green]%}%M%{$reset_color%} %2~ %{$reset_color%}%B»%b "
 # PROMPT='%{$fg[green]%}%M%{$reset_color%} %2~ %{$reset_color%}%B%{$fg[grey]%}($(kubectl config current-context))%{$reset_color%}»%b '

 # RPS1="${return_code}"
 # RPS1='${return_code} %F{244}($(kubectl config current-context))%{$reset_color%}'
 ns=$(kubectl config get-contexts | awk '{if ($2 == "'$(kubectl config current-context)'") print $5}')
 RPS1='${return_code} %F{100}(aws:$AWS_ACCOUNT)%{$reset_color%}%F{244}(k8s:$(kubectl config current-context):'$ns')%{$reset_color%}'

fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export STARSHIP_CONFIG=~/.oh-my-zsh/custom/starship.toml
eval "$(starship init zsh)"
