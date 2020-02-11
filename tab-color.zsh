### color tab borders in iterm2
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

alias tab-red="tab-color 255 0 0"
alias tab-green="tab-color 0 255 0"
alias tab-blue="tab-color 0 0 255"
alias tab-black="tab-color 0 0 0"
alias tab-white="tab-color 255 255 255"
alias tab-yellow="tab-color 255 255 0"
alias tab-cyan="tab-color 0 255 255"
alias tab-purple="tab-color 255 0 255"

tabcolors=(red green blue black white yellow cyan purple)

tab-random() {
  randcolor=${tabcolors[ ($RANDOM%$((${#tabcolors}))+1)]}
  eval tab-$randcolor
}
