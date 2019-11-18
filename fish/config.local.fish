set -x GITDIR /work/git

set -x PATH $GITDIR/plenv/bin $GITDIR/plenv/shims $PATH
eval (plenv init - | source)
set -x PYENV_ROOT $GITDIR/pyenv
set -x PATH $PYENV_ROOT/bin $PYENV_ROOT/shims $PATH
eval (pyenv init - | source)

#set -x SSH_AGENT_FILE $HOME/.ssh/ssh-agent
#if test -f $SSH_AGENT_FILE
#   source $SSH_AGENT_FILE
#end
#ssh-add -l > /dev/null ^&1
#if test $status -ne 0
#  ssh-agent -c > $SSH_AGENT_FILE
#  source $SSH_AGENT_FILE
#  ssh-add $HOME/.ssh/id_rsa
#end
