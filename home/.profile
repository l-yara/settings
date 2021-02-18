# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

echo starting .profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -n "$INSIDE_EMACS" ]; then
    export PS1='\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
fi

source ~/.profile_alias
source ~/.enable_ssh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

wrk() { cd ~/code; }
#alias wrk='cd /common/workspace'
alias classes='cd /common/classes'
alias notes='cd /common/Google\ Drive/notes/'
alias common='cd /common'

#scripts and binaries
export PATH=~/bin:$PATH

#Java
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_131/
export PATH=$JAVA_HOME/bin:$PATH

#Maven
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.2/
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH
alias q='QHOME=~/q rlwrap -r ~/q/m32/q'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yara/.sdkman"
[[ -s "/Users/yara/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yara/.sdkman/bin/sdkman-init.sh"
