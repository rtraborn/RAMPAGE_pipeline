#!/bin/bash

### Please enter info below. Test files are added by default ###
fastqDir=../test/sample_fastq
barcodes=../test/RAMPAGE_barcodes_example.txt
nMismatch=1 #number of mismatches tolerated between barcode and sequence (as long as they are unique)
#################

echo "Demultiplexing your fastq using the " $barcodes "file."

cd $fastqDir

for myFastq in `ls *R1.fastq | cut -d "." -f 1`; do

    echo $myFastq

fastq-multx -B $barcodes -m 1 -b $myFastq -o ${myFastq}.R1.%.fastq ${myFastq}.R2.%.fastq

done

echo "Demultiplexing is complete!"


