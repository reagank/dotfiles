##Set up for CDC login - not useful anywhere else
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

#Load default modules (CDC specific)
module load R/3.2.3 java/latest Python/2.7.13 cobra-cli/0.1 

#Set CDC-specific path variables
export PATH=/scicomp/groups/OID/NCIRD/DBD/RDB/Strep_Lab/JanOw_Dependencies/:$PATH
export PERL5LIB=$PERL5LIB:/scicomp/groups/OID/NCIRD/DBD/RDB/Strep_Lab/JanOw_Dependencies/perl_libs/

#Set git prompt
source ~/.git-prompt.sh
export PS1="\u@\h:\W\$(__git_ps1)> "
export SSH_AUTH_SOCK=0

#Set history options
shopt -s histappend # add to history, don't overwrite
shopt -s cmdhist #store multi-line commands as one
shopt -s lithist #include newlines in multi-line commands
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=-1
export HISTSIZE=-1
#export HISFILESIZE=5000000
#export HISTSIZE=1000000
export HISTIGNORE="&:[ ]*:exit:fg:bg:history:?:??"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#Create aliases
alias vi=vim
if test -t 1 ; then
    bind Space:magic-space
    stty -ixon
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
alias scp="scp -Cq"
alias python-imports="grep -EhR "^import" * | sort | uniq"
alias qstatf=/scicomp/home/ylb9/.fullqstat.sh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SHELLCHECK_OPTS=" -e SC2012"

# Source global definitions

if [[ -e /etc/bashrc ]]; then
	. /etc/bashrc
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
