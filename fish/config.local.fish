if test (hostname) = "horn" \
     -o (hostname) = "accordion" \
     -o (hostname) = "euphonium" \
     -o (hostname) = "synthesizer" \
     -o (hostname) = "guitar" \
     -o (hostname) = "cornet" \
     -o (hostname) = "castanet" \
     -o (hostname) = "bagpipe"

     set -x GITDIR $HOME/git
     set -x PLENV_ROOT $GITDIR/plenv

     set -gx MAMBA_EXE "/work/micromamba/bin/micromamba"
     set -gx MAMBA_ROOT_PREFIX "/work/micromamba"
     $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source

else
     set -x GITDIR $HOME/git
     set -x PLENV_ROOT $HOME/.plenv
     set -gx MAMBA_EXE "$HOME/.micromamba/bin/micromamba"
     set -gx MAMBA_ROOT_PREFIX "$HOME/.micromamba"
     $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source

     set -gx SSH_AGENT_FILE $HOME/.ssh/ssh-agent
     if test -f $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
     end
     if not ssh-add -l > /dev/null 2>&1
        ssh-agent | awk -F'=' '{if (NF > 1) print "set -gx " $1 " " $2}' | sed 's/;$/ /' > $SSH_AGENT_FILE
        echo "set -gx SSH_AGENT_PID" (pgrep -u (whoami) ssh-agent) >> $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
        ssh-add $HOME/.ssh/id_rsa
     end

    export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
end

set -x PATH $PLENV_ROOT/bin $PLENV_ROOT/shims $PATH
eval (plenv init - | source)