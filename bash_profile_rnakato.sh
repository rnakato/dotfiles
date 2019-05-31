
export PATH=$PATH:/usr/local/bin:

GITDIR=/work/git
BINARYDIR=$GITDIR/binaries

### GITDIR
export PATH=$PATH:$GITDIR/Cgaln:$GITDIR/DROMPA3:$GITDIR/DROMPA3/scripts:$GITDIR/DROMPAplus/bin:$GITDIR/DROMPAplus/cpdf/Linux-Intel-64bit:$GITDIR/SSP/bin:$GITDIR/ChIPseqTools/bin:$GITDIR/script_rnakato:$GITDIR/script_Hi-C
export PATH=$PATH:$GITDIR/RSEM:$GITDIR/STAR/bin/Linux_x86_64_static:$GITDIR/bedtools2/bin:$GITDIR/bamtools/bin:$GITDIR/salmon/bin:$GITDIR/HOMER/bin:$GITDIR/UCSC_utils/:$GITDIR/BaMMmotif2/build/bin
export PATH=$PATH:$GITDIR/UCSC_utils:$GITDIR/motif/meme_4.12.0/build/bin

### BINDIR
export PATH=$PATH:$BINARYDIR/sratoolkit.2.9.2-ubuntu64/bin:$BINARYDIR/FastQC
export PATH=$PATH:$BINARYDIR/hisat2-2.1.0/:$BINARYDIR/stringtie-1.3.5.Linux_x86_64:$BINARYDIR/gffcompare-0.10.6.Linux_x86_64/:$BINDIR/kallisto-current
export PATH=$PATH::$BINARYDIR/userApps/bin:$BINARYDIR/circos-0.69-6/bin

### for sax
#export PATH=$PATH:$BIO/MOSAiCS:$BIO/StanfordBioinformatics/Scoring/mappability:$BIO/Repeat/RepeatMasker

### Juicer
alias juicebox='java -Xms512m -Xmx2048m -jar $BINARYDIR/Aidenlab/Juicebox.jar'

# Added by the mirnylab install script.
export PYTHONPATH="$PYTHONPATH:$GITDIR/hiclib/src"

### plenv
perl_version=5.28.1
export PLENV_ROOT=$GITDIR/plenv
export PATH=$PLENV_ROOT/bin:$PATH
eval "$(plenv init -)"

### pyenv
python_version=anaconda3-2018.12
export PYENV_ROOT=$GITDIR/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
alias py2="source $PYENV_ROOT/versions/$python_version/bin/activate py2"

### docker
function drun()
{
    docker run -it --rm -u $(id -u):$(id -g) \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v /etc/sudoers.d:/etc/sudoers.d:ro \
    $@
    /bin/bash
}

### java
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/amd64/server:/usr/include/x86_64-linux-gnu
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/

# path for cuDNN
#export LD_LIBRARY_PATH=$HOME/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
#export CPATH=$HOME/.cudnn/active/cuda/include:$CPATH
#export LIBRARY_PATH=$HOME/.cudnn/active/cuda/lib64:$LIBRARY_PATH
# path for chainer
#vCUDA=cuda-9.2
#export PATH=/usr/local/$vCUDA/bin:$PATH
#export LD_LIBRARY_PATH=/usr/local/$vCUDA/lib64:$LD_LIBRARY_PATH
#export CFLAGS=-I~/.cudnn/active/cuda/include
#export LDFLAGS=-L~/.cudnn/active/cuda/lib64
#export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
