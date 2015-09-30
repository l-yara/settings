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

#grab a git update
get-git() {
    echo "Updating $1"
    git -C $1 remote update -p
    git -C $1 merge --ff-only @{u}
}

mvn-it() {
    echo "building $1"
    cd $1
    mvn clean install
}

H7="/C/Dev"
H8="/C/Dev8"
alias git-all7="get-git $H7/xbm-domain;get-git $H7/xbm-framework;get-git $H7/xbm-database;get-git $H7/xbm-readers;get-git $H7/xbm"
alias mvn-all7="java7;mvn-it $H7/xbm-domain;mvn-it $H7/xbm-framework;mvn-it $H7/xbm-database;mvn-it $H7/xbm-readers;mvn-it $H7/xbm"
alias tests8="java8;get-git $H8/xbm-test-framework;get-git $H8/jbbm-tests;mvn -f $H8/xbm-test-framework/pom.xml clean install;mvn -f $H8/jbbm-tests/pom.xml clean install -DskipTests;"
alias wrk="cd /C/Dev/xbm"
alias wrk8="cd $H8"
alias java7='export JAVA_HOME=C:/Java/jdk1.7.0_75'
alias java8='export JAVA_HOME=C:/Java/jdk1.8.0_40'
alias settings="cd /C/Users/Lyakhy/settings"
alias zk="cd /C/bin/zookeeper-3.4.6;/C/bin/zookeeper-3.4.6/bin/zkServer.sh start-foreground"
