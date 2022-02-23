source $HOME/.config/fish/config.local.fish

set -x BINARYDIR $GITDIR/binaries

### GITDIR
set -x PATH $PATH $GITDIR/Cgaln $GITDIR/DROMPA3 $GITDIR/DROMPA3/scripts $GITDIR/DROMPAplus/bin $GITDIR/DROMPAplus/otherbins $GITDIR/DROMPAplus/submodules/cpdf/Linux-Intel-64bit $GITDIR/SSP/bin $GITDIR/ChIPseqTools/bin $GITDIR/script_rnakato $GITDIR/script_RNAseq $GITDIR/script_Hi-C
set -x PATH $PATH $GITDIR/bedtools2/bin $GITDIR/bamtools/bin $GITDIR/salmon/bin $GITDIR/HOMER/bin $GITDIR/UCSC_utils/
set -x PATH $PATH $GITDIR/UCSC_utils

### BINDIR
set -x PATH $PATH $BINARYDIR/RSEM-1.3.3 $BINARYDIR/STAR-2.7.3a/bin/Linux_x86_64_static $BINARYDIR/FastQC
set -x PATH $PATH $BINARYDIR/gffcompare-0.10.6.Linux_x86_64/
set -x PATH $PATH $BINARYDIR/userApps/bin
set -x PATH $PATH $BINARYDIR/bedops_linux_x86_64-v2.4.39

# GO
set -x GOPATH $HOME/go
set -x PATH /usr/local/go/bin $GOPATH/bin $PATH

# CellRanger
set -x PATH $PATH /work/CellRanger/cellranger-current/ /work/CellRanger/cellranger-atac-current/

### miniconda
set -x PATH /work/miniconda3/bin $PATH

### Emacs (Windows)
set -x PATH $PATH /mnt/c/emacs-26.3-x86_64/bin

# alias
source $HOME/.alias
alias dstop_rm='docker stop (docker ps -q) && docker rm (docker ps -q -a)'
alias d_rm='docker rm (docker ps -q -a)'
alias dstop_purge='docker stop (docker ps -q) && docker rmi (docker images -q) -f'
alias d_purge='docker rmi (docker images -q) -f'

### homebrew
set -x PATH $PATH /home/linuxbrew/.linuxbrew/bin/ $HOME/.cargo/bin

# for fzf
# https://qiita.com/hennin/items/33758226a0de8c963ddf
#set -x FZF_LEGACY_KEYBINDINGS 0

### functions
function dbash
    docker exec -it $argv bash
end

set -x LD_LIBRARY_PATH /usr/local/lib $LD_LIBRARY_PATH
