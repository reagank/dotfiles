case "$0" in
          -sh|sh|*/sh)	modules_shell=sh ;;
       -ksh|ksh|*/ksh)	modules_shell=ksh ;;
       -zsh|zsh|*/zsh)	modules_shell=zsh ;;
    -bash|bash|*/bash)	modules_shell=bash ;;
esac
module() { eval `/usr/bin/modulecmd $modules_shell $*`; }
##
##
## Gnome Desktop does not treat
## terminal windows as login shells
## AND when users connect via FreeNX for
## some reason the profile settings do not
## get passed to the desktop environment AND
## we can't fix this via /usr/share/.profile because
## that will not allow root edits from NFS clients
## 
## will this work instead? 
##
if test -n "$NXSESSIONID" ; then
   if test -d /etc/profile.d ; then
      for s in /etc/profile.d/*.sh ; do
          test -r $s -a ! -k $s && . $s
      done
   unset s
   fi
fi

#Load default modules
module load R/3.2.3 java/latest Python/2.7.3 cobra-cli/0.1 

#Set git prompt
source ~/.git-prompt.sh
#export PS1="\u@\h \
export PS1="\u@\h:\W\$(__git_ps1)> "
export SSH_AUTH_SOCK=0
export PATH=/scicomp/groups/OID/NCIRD/DBD/RDB/Strep_Lab/JanOw_Dependencies/:$PATH
export PERL5LIB=$PERL5LIB:/scicomp/groups/OID/NCIRD/DBD/RDB/Strep_Lab/JanOw_Dependencies/perl_libs/
#Set history options
export HISTCONTROL="erasedups:ignoreboth"
export HISFILESIZE=500000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:exit"
shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
stty -ixon

#Create aliases
alias vi=vim
if test -t 1 ; then
    bind Space:magic-space
fi
alias smrt='ssh smrtanalysis-dbd.biotech.cdc.gov'
alias vip='vi "+Voom python"'
alias nose='nosetests --exe --with-coverage -v'
alias nslots="awk '{ s+=\$9 } END { print s}'"
alias switch='sudo su - smrtanalysis-dbd'
alias queue="python ~/qstat.py"
alias ll='/bin/ls -BFGhLl --color=auto'
alias ls='/bin/ls --color=auto'
alias more=less
alias rmd='/bin/rm  --recursive --force --verbose '
alias p="ps aux | grep "
alias pserve="python -m SimpleHTTPServer 8080"
alias scp="scp -Cq"

# Source global definitions

	. /etc/bashrc


source "$HOME/.homesick/repos/homeshick/homeshick.sh"