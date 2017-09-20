# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export MYVIMRC='~/.vimrc'
export VIMINIT='source $MYVIMRC'
export LC_ALL=en_US.UTF8  # zh_CN.UTF8
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

alias cp='cp -p'
alias ls='ls --color=auto'
alias ll="ls -ilh"
alias la="ls -ih"
alias du="du -h"
alias grep="grep --color=auto"
alias cgrep="grep -P -r --include=*{h,pp,hpp,cc,c}"
alias vim="vim -p"
alias vi='vim -p'
alias mktags="ctags -R"
alias link="ifconfig | grep \"inet\|sddr\" && python -m SimpleHTTPServer 8011"

export PS1="\[\e[0;37m\][\[\e[01;34m\]\H\[\e[0;37m\]@\[\e[01;33m\]\u\[\e[0;37m\]][\[\e[01;31m\]\w\[\e[0;37m\]]\$ "
