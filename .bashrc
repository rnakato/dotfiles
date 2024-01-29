source $GITDIR/dotfiles/bashrc.local

export PATH=$PATH:/usr/local/bin:$HOME/.cargo/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/

BINARYDIR=$GITDIR/binaries

### GITDIR
export PATH=$PATH:$GITDIR/Cgaln:$GITDIR/DROMPA3:$GITDIR/DROMPA3/scripts:$GITDIR/DROMPAplus/bin:$GITDIR/DROMPAplus/otherbins:$GITDIR/SSP/bin:$GITDIR/ChIPseqTools/bin:$GITDIR/script_rnakato:$GITDIR/script_Hi-C
export PATH=$PATH:$GITDIR/bedtools2/bin:$GITDIR/bamtools/bin:$GITDIR/salmon/bin:$GITDIR/HOMER/bin:$GITDIR/UCSC_utils/
export PATH=$PATH:$GITDIR/UCSC_utils

### BINDIR
export PATH=$PATH:$BINARYDIR/RSEM-1.3.3:$BINARYDIR/STAR-2.7.3a/bin/Linux_x86_64_static:$BINARYDIR/sratoolkit.2.9.6-ubuntu64/bin:$BINARYDIR/FastQC
export PATH=$PATH:$BINARYDIR/hisat2-2.1.0/:$BINARYDIR/stringtie-1.3.5.Linux_x86_64:$BINARYDIR/gffcompare-0.10.6.Linux_x86_64/:$BINDIR/kallisto-current
export PATH=$PATH:$BINARYDIR/userApps/bin
export PATH=$PATH:$BINARYDIR/bedops_linux_x86_64-v2.4.39

# Go
export GOPATH=${HOME}/go
export PATH=${GOPATH}/bin:/usr/local/go/bin:${PATH}

### alias
source ~/.alias

alias dr='docker stop $(docker ps -q | tr "\n" " ") && docker rm $(docker ps -q -a | tr "\n" " ")'
alias ds='docker rm $(docker ps -q -a | tr "\n" " ")'
alias dpurge='docker stop $(docker ps -q) && docker rmi $(docker images -q) -f'

vCUDA=cuda
export PATH=/usr/local/$vCUDA/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/$vCUDA/lib64:$LD_LIBRARY_PATH
export CFLAGS=-I/usr/local/$vCUDA/include
export LDFLAGS=-L/usr/local/$vCUDA/lib64
