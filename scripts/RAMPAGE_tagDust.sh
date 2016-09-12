#!/bin/bash

### Please enter information here (test files are entered by default) ###
fastqDir=../test/sample_fastq/demultiplexed_matched/clipped
rRNADir=../test/
NThreads=6
mySuffix=tagdust
############

rRNA=`readlink -f ${rRNADir}/RAMPAGE_rRNA_example.fasta`

echo "Beginning tagdust run"

cd $fastqDir

for i in `ls *.R1.*.clipped.fastq`;

do
    echo ${i}
    j=`expr $i | cut -d "." -f 1`
    k=`expr $i | cut -d "." -f 3,4`
    l=${j}.R2.${k}.fastq

     tagdust -ref $rRNA -dust 97 -t $NThreads -fe 3 -1 R:N ${i} ${l} -o $(basename $i .clipped.fastq).$mySuffix.fastq

done

echo "tagDust run is complete!"    

echo "Moving files into the new tagDust_files/ directory."

mkdir tagDust_files

mv *.tagdust.fastq* tagDust_files

echo "Job complete!"
