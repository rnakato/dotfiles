# for fzf
# https://qiita.com/hennin/items/33758226a0de8c963ddf
set -U FZF_LEGACY_KEYBINDINGS 0

set -x GITDIR /home/rnakato/git
set -x BINARYDIR $GITDIR/binaries

### GITDIR
set -x PATH $PATH $GITDIR/Cgaln $GITDIR/DROMPA3 $GITDIR/DROMPA3/scripts $GITDIR/DROMPAplus/bin $GITDIR/DROMPAplus/cpdf/Linux-Intel-64bit $GITDIR/SSP/bin $GITDIR/ChIPseqTools/bin $GITDIR/script_rnakato $GITDIR/script_Hi-C
set -x PATH $PATH $GITDIR/RSEM $GITDIR/STAR/bin/Linux_x86_64_static $GITDIR/bedtools2/bin $GITDIR/bamtools/bin $GITDIR/salmon/bin $GITDIR/HOMER/bin $GITDIR/UCSC_utils/ $GITDIR/BaMMmotif2/build/bin
set -x PATH $PATH $GITDIR/UCSC_utils $GITDIR/motif/meme_4.12.0/build/bin

### BINDIR
set -x PATH $PATH $BINARYDIR/sratoolkit.2.9.6-ubuntu64/bin $BINARYDIR/FastQC
set -x PATH $PATH $BINARYDIR/hisat2-2.1.0/ $BINARYDIR/stringtie-1.3.5.Linux_x86_64 $BINARYDIR/gffcompare-0.10.6.Linux_x86_64/ $BINDIR/kallisto-current
set -x PATH $PATH $BINARYDIR/userApps/bin $BINARYDIR/circos-0.69-6/bin

### functions
function gsh
    git push origin master
end
function gll
    git pull origin master
end
function gllsub
    git submodule foreach git pull origin master
end
function gts
    git status
end
function gmit
    git commit -m $argv
end
function sax
    ssh rnakato@saxophone -X -A
end
function synthe
    ssh rnakato@synthesizer -X -A
end
function acc
    ssh rnakato@accordion -X -A
end
function euph
    ssh rnakato@euphonium -X -A
end
function horn
    ssh rnakato@horn -X -A
end
function aki
    ssh rnakato@akiyamaserver -X -A
end
function ryuteki
    ssh rnakato@192.168.100.2 -X -A
end
function libcalc
    libreoffice --calc
end
function emcas
    emacs
end
function macs
    emacs
end
function emasc
    emacs
end
function emas
    emacs
end
function emac
    emacs
end
function sl
    ls
end
function ks
    ls
end
function g11
    g++ -std=c++11
end
function g14
    g++ -std=c++14
end
function jn
    jupyter notebook
end
function i
    ipython --pylab
end
function juicebox
    java -Xms512m -Xmx2048m -jar /home/rnakato/git/binaries/Aidenlab/Juicebox.jar
end
function GoogleColab
    cd /mnt/Googledrive_MyDrive/Colab\ Notebooks/;jupyter notebook
end
function dstop_rm
    docker stop (docker ps -q | tr "\n" " ") and docker rm (docker ps -q -a | tr "\n" " ")
end
function d_rm
    docker rm (docker ps -q -a | tr "\n" " ")
end
function d_purge
    docker stop (docker ps -q) and docker rmi (docker images -q) -f
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