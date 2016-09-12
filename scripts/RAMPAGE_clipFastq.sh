#!/bin/bash

### Please enter info below. Test files are added by default ###
fastqDir=../test/sample_fastq/demultiplexed_matched
mySuffix=clipped
#################

cd $fastqDir

echo "Trimming the first 3 bases from R1 reads" 

for i in `ls *.R1.*.fastq`;

do

    echo ${i} Read 1...
    
    fastx_trimmer -f 4 -i ${i} -o $(basename -s .fastq $i).$mySuffix.fastq #-f '4' means base 4 is the first base kept
    
done

echo "Trimming the last 15 bases from R2 reads"

for i in `ls *.R2.*.fastq`;

do    
    echo ${i} Read 2...
    
    fastx_trimmer -t 15 -i ${i} -o $(basename -s .fastq $i).$mySuffix.fastq
    
done

echo "Clipping complete."

echo "Moving clipped reads into clipped/ subdirectory."

mkdir clipped

mv *.clipped.fastq clipped

echo "Job is complete!"

    
