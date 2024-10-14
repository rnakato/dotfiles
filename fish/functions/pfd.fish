function pfd
   singularity exec --bind /work,/work2,/work3 /work3/SingularityImages/churros.1.2.2.sif parallel-fastq-dump --sra-id $argv --threads 4 --outdir out/
end