#!/bin/bash

### Please enter info below. Test files are added by default ###
fastqDir=../test/sample_fastq/
mySuffix=clipped
#################

cd $fastqDir

echo "Trimming the first 3 bases from R1 reads" 

for i in `ls *.R1.fastq | cut -d "." -f 1`;

do
     echo ${i}.R2.fastq
    fastx_trimmer -f 4 -i ${i}.R1.fastq -o ${i}.R1.$mySuffix.fastq #-f '4' means base 4 is the first base kept
    
done

echo "Trimming the last 15 bases from R2 reads"

for i in `ls *.R2.fastq | cut -d "." -f 1`;

do
      echo ${i}.R2.fastq
    fastx_trimmer -t 15 -i ${i}.R2.fastq -o ${i}.R2.$mySuffix.fastq
    
done

echo "Job is complete!"

    
