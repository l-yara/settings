echo starting .zprofile

source ~/.profile_alias
source ~/.enable_ssh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
