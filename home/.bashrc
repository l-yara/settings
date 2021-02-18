# The underlying idea is that the .bash_profile should be run only once when you login, and the .bashrc for every new interactive shell.

echo starting .bashrc

# if [ -f "$HOME/.profile" ]; then
#  . "$HOME/.profile"
# fi

#-------------------
# Personnal Aliases
#-------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'



alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
#alias ls='ls -h --color'
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by 3date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
# if [ "$OSTYPE" == linux-gnu ]; then  # Is this the Ubuntu system?
alias ll='ls -Flh --group-directories-first'
# else
#     alias ll='gls -Flh --group-directories-first'
# fi
# alias ll="ls -alv --group-directories-first"
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...


alias home='cd ~'
# always list in long format alias la='ls -la'

#echo "user: --$USERNAME--"

#if [ ${USERNAME} == 'Lyakhy' ]
#then
#	wrkdir=/C/Dev/xbm
#	alias wrk="cd /C/Dev/xbm"
# alias git-all='wrk; find . -type d -maxdepth 1 -exec git --git-dir={}/.git pull origin master \;'
#	alias settings="cd /C/Users/Lyakhy/settings"
#	alias git-all='wrk; find . -type d -maxdepth 1 -exec git --git-dir={}/.git up \;'
#	alias java7='export JAVA_HOME=C:/Java/jdk1.7.0_75'
#else
#TODO: move these to .profile per machine
#	alias wrk="cd /common/workspace"
#fi

#echo "wrkdir: $wrkdir"
#alias wrk="cd $wrkdir"
#alias wrk="cd /C/Dev/xbm"
#alias wrk="cd /common/workspace"
#alias classes="cd /common/classes"
#alias notes="cd /common/Google Drive/emacs/notes/"
#alias common="cd /common"

main() { cd /C/Dev/xbm; }


# 8X ------- Large block to run ssh-add - start
# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi


# if your keys are not stored in ~/.ssh/id_rsa.pub or ~/.ssh/id_dsa.pub, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env
# 8X ------- Large block to run ssh-add - end

# go to the working directory
wrk

#to use the new bash ver 5:
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yara/.sdkman"
[[ -s "/Users/yara/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yara/.sdkman/bin/sdkman-init.sh"
