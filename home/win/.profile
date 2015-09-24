# set dynamic prompt and window/tab title
PS1='\[\e]0;${PWD##*/}\a\]\n'  # set window title
#PS1="$PS1"'\u@\h '            # user@host<space>
PS1="$PS1"'\[\033[32m\]'       # change color
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
    PS1="$PS1"'\[\033[33m\]'   # change color
    PS1="$PS1"'$(__git_ps1)'   # bash function

fi
PS1="$PS1"'\[\033[0m\]\n'      # change color
PS1="$PS1"'$ '                 # prompt: always $


alias wrk="cd /C/Dev/xbm"
alias wrk8="cd /C/Dev8"
alias java7='export JAVA_HOME=C:/Java/jdk1.7.0_75'
alias java8='export JAVA_HOME=C:/Java/jdk1.8.0_40'
alias settings="cd /C/Users/Lyakhy/settings"
alias zk="cd /C/bin/zookeeper-3.4.6;/C/bin/zookeeper-3.4.6/bin/zkServer.sh start-foreground"
