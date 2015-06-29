ZSH=$HOME/.oh-my-zsh

if [[ -e $ZSH/oh-my-zsh.sh ]]; then

  ZSH_THEME="gallifrey"
  plugins=(ssh-agent git git-hubflow github mercurial osx ruby screen sublime svn vagrant)

  source $ZSH/oh-my-zsh.sh
else

 autoload -U colors && colors

 setopt nonomatch
 setopt extendedglob

 local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

 PROMPT="%{$fg[green]%}%M%{$reset_color%} %2~ %{$reset_color%}%B»%b "
 RPS1="${return_code}"

fi

