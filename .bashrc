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
alias JupyterNotebook='cd ~/Dropbox/src/jupyter/;jupyter notebook'
alias jn='jupyter notebook'
alias i='ipython --pylab'
alias juicebox='java -Xms512m -Xmx2048m -jar /home/rnakato/git/binaries/Aidenlab/Juicebox.jar'
alias gcjn="cd /mnt/Googledrive_MyDrive/Colab\ Notebooks/;jupyter notebook"
alias dr='docker stop $(docker ps -q | tr "\n" " ") && docker rm $(docker ps -q -a | tr "\n" " ")'
alias ds='docker rm $(docker ps -q -a | tr "\n" " ")'
alias dpurge='docker stop $(docker ps -q) && docker rmi $(docker images -q) -f'


GITDIR=/home/rnakato/git
BINARYDIR=$GITDIR/binaries

### GITDIR
export PATH=$PATH:$GITDIR/Cgaln:$GITDIR/DROMPA3:$GITDIR/DROMPA3/scripts:$GITDIR/DROMPAplus/bin:$GITDIR/DROMPAplus/cpdf/Linux-Intel-64bit:$GITDIR/SSP/bin:$GITDIR/ChIPseqTools/bin:$GITDIR/script_rnakato:$GITDIR/script_Hi-C
export PATH=$PATH:$GITDIR/RSEM:$GITDIR/STAR/bin/Linux_x86_64_static:$GITDIR/bedtools2/bin:$GITDIR/bamtools/bin:$GITDIR/salmon/bin:$GITDIR/HOMER/bin:$GITDIR/UCSC_utils/:$GITDIR/BaMMmotif2/build/bin
export PATH=$PATH:$GITDIR/UCSC_utils:$GITDIR/motif/meme_4.12.0/build/bin

### BINDIR
export PATH=$PATH:$BINARYDIR/sratoolkit.2.9.6-ubuntu64/bin:$BINARYDIR/FastQC
export PATH=$PATH:$BINARYDIR/hisat2-2.1.0/:$BINARYDIR/stringtie-1.3.5.Linux_x86_64:$BINARYDIR/gffcompare-0.10.6.Linux_x86_64/:$BINDIR/kallisto-current
export PATH=$PATH::$BINARYDIR/userApps/bin:$BINARYDIR/circos-0.69-6/bin


### docker
function drun()
{
    docker run -it -u $(id -u):$(id -g) \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v /etc/sudoers.d:/etc/sudoers.d:ro \
    $@
    /bin/bash
}

SSH_AGENT_FILE=$HOME/.ssh/ssh-agent
test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
if ! ssh-add -l > /dev/null 2>&1; then
  ssh-agent > $SSH_AGENT_FILE
  source $SSH_AGENT_FILE
  ssh-add $HOME/.ssh/id_rsa
fi
