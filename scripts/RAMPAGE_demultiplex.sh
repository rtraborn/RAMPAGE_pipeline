#!/bin/bash

### Please enter info below. Test files are added by default ###
fastqDir=../test/sample_fastq
barcodes=../RAMPAGE_barcodes_example.txt
nMismatch=1 #number of mismatches tolerated between barcode and sequence (as long as they are unique)
#################

echo "Demultiplexing your fastq using the " $barcodes "file."

cd $fastqDir

for myFastq in `ls *R1.fastq | cut -d "." -f 1`; do

    echo $myFastq

fastq-multx -m $nMismatch -B $barcodes -b $myFastq.R1.fastq $myFastq.R2.fastq -o ${myFastq}.R1.%.fastq ${myFastq}.R2.%.fastq

done

echo "Demultiplexing is complete!"

echo "Unmatched reads are moved into /demultiplexed_unmatched directory."

mkdir demultiplexed_unmatched

mv *.R?.unmatched.fastq demultiplexed_unmatched

echo "Moving succesffully demultiplexed reads to /demultiplexed_matched directory. Unmatched reads were moved into /demultiplexed_unmatched directory."

mkdir demultiplexed_matched

mv *.R?.*.fastq demultiplexed_matched

echo "Job complete!"





