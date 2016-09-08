#!/bin/bash

fastqDir=<path/to/demultiplexed/files>
R1_HEAD=<insert name here>
R2_HEAD=<insert name here>

rRNA=/scratch/rtraborn/Rice/RAMPAGE_reads/demultiplexed_matched/align_Japonica_0625/bamfiles/Os_japonica_rDNA.fasta

echo "Beginning tagdust run"

cd $fastqDir

for i in `ls *R1.*.fastq | cut -d "." -f 2`;

do
     echo ${R1_HEAD}.${i}.fastq ${R2_HEAD}.${i}.fastq

     tagdust -ref $rRNA -dust 97 -t 6 -fe 3 -1 R:N ${R1_HEAD}.${i}.fastq ${R2_HEAD}.${i}.fastq -o RAMPAGE.${i}.rRNAdust.fastq

done

    
