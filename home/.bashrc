#Set default Editor to vim
export EDITOR=vim
export VISUAL=vim


#Set git prompt
source ~/.git-prompt.sh
export PS1="\u@\h:\W\$(__git_ps1)> "

#Set history options
shopt -s histappend # add to history, don't overwrite
shopt -s cmdhist #store multi-line commands as one
shopt -s lithist #include newlines in multi-line commands
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL="erasedups:ignoreboth"
export HISFILESIZE=50000000
export HISTSIZE=10000000
export HISTIGNORE="&:[ ]*:exit:fg:bg:history:?:??"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#Create aliases
alias vi=vim
if test -t 1 ; then
    bind Space:magic-space
    stty -ixon
fi
alias ll='/bin/ls -BFGhLl --color=auto'
alias ls='/bin/ls --color=auto'
alias more=less
alias rmd='/bin/rm  --recursive --force --verbose '
alias scp="scp -Cq"
if [[ $- == *i* ]]; then
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export SHELLCHECK_OPTS=" -e SC2012"

    function p () {
        ps aux | egrep "$*"
    }

fi
# Source global definitions

if [[ -e /etc/bashrc ]]; then
	. /etc/bashrc
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
