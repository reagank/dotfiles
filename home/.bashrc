#Set default Editor to vim
export EDITOR=vim
export VISUAL=vim


#Set git prompt
source ~/.git-prompt.sh
export PS1="\e[0;33m\u\e[0m@\e[0;35m\h\e[0m:\e[0;32m\W\$(__git_ps1)\e[0m> "

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/reagank/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/reagank/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/reagank/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/reagank/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/reagank/google-cloud-sdk/path.bash.inc' ]; then . '/home/reagank/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/reagank/google-cloud-sdk/completion.bash.inc' ]; then . '/home/reagank/google-cloud-sdk/completion.bash.inc'; fi
