set -x GITDIR /home/rnakato/git

set -x PATH $GITDIR/plenv/bin $PATH
eval (plenv init - | source)
set -x PATH $GITDIR/pyenv/bin $PATH
eval (pyenv init - | source)
