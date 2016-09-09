#!/bin/bash

### Please enter information here (test files are entered by default) ###
fastqDir=../test/sample_fastq
rRNA=../test/RAMPAGE_rRNA_example.fasta
NThreads=6
mySuffix=tagdust
############

echo "Beginning tagdust run"

cd $fastqDir

for i in `ls *R1.*.fastq | cut -d "." -f 2`;

do
     echo ${i}.fastq

     tagdust -ref $rRNA -dust 97 -t $NThreads -fe 3 -1 R:N ${i}.R1.fastq ${i}.R2.fastq -o ${i}.$mySuffix.fastq

echo "tagDust run is complete!"
     
done

    
