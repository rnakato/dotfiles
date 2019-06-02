# for fzf
# https://qiita.com/hennin/items/33758226a0de8c963ddf
set -U FZF_LEGACY_KEYBINDINGS 0

set -U -x GITDIR /home/rnakato/git
set -U -x BINARYDIR $GITDIR/binaries

### GITDIR
set -U -x PATH $PATH $GITDIR/Cgaln $GITDIR/DROMPA3 $GITDIR/DROMPA3/scripts $GITDIR/DROMPAplus/bin $GITDIR/DROMPAplus/cpdf/Linux-Intel-64bit $GITDIR/SSP/bin $GITDIR/ChIPseqTools/bin $GITDIR/script_rnakato $GITDIR/script_Hi-C
set -U -x PATH $PATH $GITDIR/RSEM $GITDIR/STAR/bin/Linux_x86_64_static $GITDIR/bedtools2/bin $GITDIR/bamtools/bin $GITDIR/salmon/bin $GITDIR/HOMER/bin $GITDIR/UCSC_utils/ $GITDIR/BaMMmotif2/build/bin
set -U -x PATH $PATH $GITDIR/UCSC_utils $GITDIR/motif/meme_4.12.0/build/bin

### BINDIR
set -U -x PATH $PATH $BINARYDIR/sratoolkit.2.9.6-ubuntu64/bin $BINARYDIR/FastQC
set -U -x PATH $PATH $BINARYDIR/hisat2-2.1.0/ $BINARYDIR/stringtie-1.3.5.Linux_x86_64 $BINARYDIR/gffcompare-0.10.6.Linux_x86_64/ $BINDIR/kallisto-current
set -U -x PATH $PATH  $BINARYDIR/userApps/bin $BINARYDIR/circos-0.69-6/bin
