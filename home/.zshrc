# The underlying idea is that the .bash_profile should be run only once when you login, and the .bashrc for every new interactive shell.

echo starting .zshrc

# if [ -f "$HOME/.zprofile" ]; then
#  . "$HOME/.zprofile"
# fi

#echo "user: --$USERNAME--"
#if [ ${USERNAME} == 'Lyakhy' ]
#then
wrk() { cd ~/code; }
#	wrkdir=/C/Dev/xbm
# alias git-all='wrk; find . -type d -maxdepth 1 -exec git --git-dir={}/.git pull origin master \;'
#	alias settings="cd /C/Users/Lyakhy/settings"
#	alias git-all='wrk; find . -type d -maxdepth 1 -exec git --git-dir={}/.git up \;'
#	alias java7='export JAVA_HOME=C:/Java/jdk1.7.0_75'
#else
#TODO: move these to .profile per machine
#	alias wrk="cd /common/workspace"
#fi

home

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yara/.sdkman"
[[ -s "/Users/yara/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yara/.sdkman/bin/sdkman-init.sh"
