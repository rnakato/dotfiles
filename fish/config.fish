set -x GITDIR /home/rnakato/git
set -x BINARYDIR $GITDIR/binaries

### GITDIR

set -x PATH $PATH $GITDIR/Cgaln $GITDIR/DROMPA3 $GITDIR/DROMPA3/scripts $GITDIR/DROMPAplus/bin $GITDIR/DROMPAplus/otherbin $GITDIR/DROMPAplus/submodules/cpdf/Linux-Intel-64bit $GITDIR/SSP/bin $GITDIR/ChIPseqTools/bin $GITDIR/script_rnakato $GITDIR/script_Hi-C
set -x PATH $PATH $GITDIR/RSEM $GITDIR/STAR/bin/Linux_x86_64_static $GITDIR/bedtools2/bin $GITDIR/bamtools/bin $GITDIR/salmon/bin $GITDIR/HOMER/bin $GITDIR/UCSC_utils/ $GITDIR/BaMMmotif2/build/bin
set -x PATH $PATH $GITDIR/UCSC_utils $GITDIR/motif/meme-5.0.5/build/bin

### BINDIR
set -x PATH $PATH $BINARYDIR/sratoolkit.2.9.6-1-ubuntu64/bin $BINARYDIR/FastQC
set -x PATH $PATH $BINARYDIR/hisat2-2.1.0/ $BINARYDIR/stringtie-1.3.5.Linux_x86_64 $BINARYDIR/gffcompare-0.10.6.Linux_x86_64/ $BINDIR/kallisto-current
set -x PATH $PATH $BINARYDIR/userApps/bin

source $HOME/.config/fish/config.local.fish

# for fzf
# https://qiita.com/hennin/items/33758226a0de8c963ddf
set -x FZF_LEGACY_KEYBINDINGS 0

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

### aliases
alias gsh='git push origin master'
alias gll='git pull origin master'
alias gllsub='git submodule foreach git pull origin master'
alias gts='git status'
alias gmit='git commit -m'
alias sax='ssh rnakato@saxophone -X -A'
alias synthe='ssh rnakato@synthesizer -X -A'
alias acc='ssh rnakato@accordion -X -A'
alias euph='ssh rnakato@euphonium -X -A'
alias horn='ssh rnakato@horn -X -A'
alias aki='ssh rnakato@akiyamaserver -X -A'
alias ryuteki='ssh rnakato@192.168.100.2 -X -A'
alias libcalc='libreoffice --calc'
alias emcas='emacs'
alias macs='emacs'
alias emasc='emacs'
alias emas='emacs'
alias emac='emacs'
alias sl='ls'
alias ks='ls'
alias g11='g++ -std=c++11'
alias g14='g++ -std=c++14'
alias jn='jupyter notebook'
alias i='ipython --pylab'
alias juicebox='java -Xmx2048m -jar /home/rnakato/git/binaries/Aidenlab/Juicebox.jar'
alias GoogleColab="cd /mnt/Googledrive_MyDrive/Colab\ Notebooks/;jupyter notebook"
alias dstop_rm='docker stop (docker ps -q | tr "\n" " ") && docker rm (docker ps -q -a | tr "\n" " ")'
alias d_rm='docker rm (docker ps -q -a | tr "\n" " ")'
alias d_purge='docker stop (docker ps -q) and docker rmi (docker images -q) -f'

### functions
function dbash
    docker exec -it $argv bash
end

function drun
    docker run -it -u (id -u):(id -g) \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v /etc/sudoers.d:/etc/sudoers.d:ro \
    $argv
    /bin/bash
end

umask 002
