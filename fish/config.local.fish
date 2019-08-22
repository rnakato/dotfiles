set -x GITDIR /work/git

set -x PATH $GITDIR/plenv/bin $GITDIR/plenv/shims $PATH
eval (plenv init - | source)
set -x PATH $GITDIR/pyenv/bin $GITDIR/pyenv/shims $PATH
eval (pyenv init - | source)
