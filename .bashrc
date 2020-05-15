source $HOME/git/dotfiles/bashrc.local

export PATH=$PATH:/usr/local/bin:/home/linuxbrew/.linuxbrew/bin/:$HOME/.cargo/bin

BINARYDIR=$GITDIR/binaries

### GITDIR
export PATH=$PATH:$GITDIR/Cgaln:$GITDIR/DROMPA3:$GITDIR/DROMPA3/scripts:$GITDIR/DROMPAplus/bin:$GITDIR/DROMPAplus/otherbins:$GITDIR/SSP/bin:$GITDIR/ChIPseqTools/bin:$GITDIR/script_rnakato:$GITDIR/script_Hi-C
export PATH=$PATH:$GITDIR/bedtools2/bin:$GITDIR/bamtools/bin:$GITDIR/salmon/bin:$GITDIR/HOMER/bin:$GITDIR/UCSC_utils/
export PATH=$PATH:$GITDIR/UCSC_utils

### BINDIR
export PATH=$PATH:$BINARYDIR/RSEM-1.3.3:$BINARYDIR/STAR-2.7.3a/bin/Linux_x86_64_static:$BINARYDIR/sratoolkit.2.9.6-ubuntu64/bin:$BINARYDIR/FastQC
export PATH=$PATH:$BINARYDIR/hisat2-2.1.0/:$BINARYDIR/stringtie-1.3.5.Linux_x86_64:$BINARYDIR/gffcompare-0.10.6.Linux_x86_64/:$BINDIR/kallisto-current
export PATH=$PATH::$BINARYDIR/userApps/bin:$BINARYDIR/circos-0.69-6/bin

# Go
export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### alias
source ~/.alias

alias dr='docker stop $(docker ps -q | tr "\n" " ") && docker rm $(docker ps -q -a | tr "\n" " ")'
alias ds='docker rm $(docker ps -q -a | tr "\n" " ")'
alias dpurge='docker stop $(docker ps -q) && docker rmi $(docker images -q) -f'
alias E='emacsclient -c'

# path for GPU
export LD_LIBRARY_PATH=$HOME/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
export CPATH=$HOME/.cudnn/active/cuda/include:$CPATH
export LIBRARY_PATH=$HOME/.cudnn/active/cuda/lib64:$LIBRARY_PATH
vCUDA=cuda-10.1
export PATH=/usr/local/$vCUDA/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/$vCUDA/lib64:$LD_LIBRARY_PATH
export CFLAGS=-I~/.cudnn/active/cuda/include
export LDFLAGS=-L~/.cudnn/active/cuda/lib64
export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
