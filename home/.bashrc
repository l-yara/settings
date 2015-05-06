# always list in long format
#alias la='ls -la --color'

#alias wrk="cd /common/workspace"
#alias classes="cd /common/classes"
#alias notes="cd /common/Google Drive/emacs/notes/"
#alias common="cd /common"

wrk() { cd /C/Dev; }
main() { cd /C/Dev/xbm; }
# alias git-all='wrk; find . -type d -maxdepth 1 -exec git --git-dir={}/.git pull origin master \;'
alias git-all='wrk; find . -type d -maxdepth 1 -exec git --git-dir={}/.git up \;'
alias java7='export JAVA_HOME=C:/Java/jdk1.7.0_75'
 
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