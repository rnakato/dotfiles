set -x hostname (hostname)
if test $hostname = "horn" \
     -o $hostname = "accordion" \
     -o $hostname = "euphonium" \
     -o $hostname = "synthesizer" \
     -o $hostname = "saxophone"

     set -x GITDIR /work/git
     set -x PLENV_ROOT $GITDIR/plenv
     set -x PYENV_ROOT $GITDIR/pyenv

#    export DISPLAY=172.20.224.1:0
else
     set -x GITDIR $HOME/git
     set -x PLENV_ROOT $HOME/.plenv
     set -x PYENV_ROOT $HOME/.pyenv

     set -x SSH_AGENT_FILE $HOME/.ssh/ssh-agent
     if test -f $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
     end
     ssh-add -l > /dev/null ^&1
     if test $status -ne 0
        ssh-agent -c > $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
        ssh-add $HOME/.ssh/id_rsa
     end

    export DISPLAY=172.20.224.1:0
end

set -x PATH $PLENV_ROOT/bin $PLENV_ROOT/shims $PATH
eval (plenv init - | source)
set -x PATH $PYENV_ROOT/bin $PYENV_ROOT/versions/anaconda3-2019.10/bin/ $PATH
eval (pyenv init - | source)
