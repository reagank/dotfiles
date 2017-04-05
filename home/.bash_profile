if [ -f /etc/profile.modules ]
then
	. /etc/profile.modules
# put your own module loads here
fi
if test -n "$NXSESSIONID" ; then
   if test -d /etc/profile.d ; then
      for s in /etc/profile.d/*.sh ; do
          test -r $s -a ! -k $s && . $s
      done
   unset s
   fi
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#export PS1="\u@\h> "
#export PS1="\u@\h \W-> "
alias smrt-qdel="sudo -u smrtanalysis-dbd /usr/local/sge/bin/lx-amd64/qdel"
