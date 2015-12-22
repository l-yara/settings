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

INT_ERR_CODE=0

#grab a git update
get-git() {
    echo "Updating $1"
    git -C $1 remote update -p
    git -C $1 merge --ff-only @{u}
}

mvn-it() {
    if [ $INT_ERR_CODE -eq 0 ]; then
        echo "building $1"
        mvn -f $1 clean install
        export INT_ERR_CODE="$?"
    fi
}

H8="/C/Dev8"
alias git-all="get-git $H8/xbm-idd;get-git $H8/xbm-domain;get-git $H8/xbm-framework;get-git $H8/xbm-database;get-git $H8/xbm-readers;get-git $H8/xbm;get-git $H8/xbm-ordo"
alias mvn-all="java8;mvn-it $H8/xbm-idd;mvn-it $H8/xbm-domain;mvn-it $H8/xbm-framework;mvn-it $H8/xbm-database;mvn-it $H8/xbm-readers;mvn-it $H8/xbm"
alias tests8="java8;get-git $H8/xbm-test-framework;get-git $H8/jbbm-tests;mvn -f $H8/xbm-test-framework/pom.xml clean install;mvn -f $H8/jbbm-tests/pom.xml clean install -DskipTests;"
alias wrk="cd /C/Dev8/xbm"
alias wrk8="cd $H8"
alias java7='export JAVA_HOME=C:/Java/jdk1.7.0_75'
alias java8='export JAVA_HOME=C:/Java/jdk1.8.0_40;export INT_ERR_CODE=0'
alias settings="cd /C/Users/Lyakhy/settings"
alias zk="cd /C/bin/zookeeper-3.4.6;/C/bin/zookeeper-3.4.6/bin/zkServer.sh start-foreground"
