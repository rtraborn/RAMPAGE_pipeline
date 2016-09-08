#!/bin/bash

### Please enter info below: ###
fastqDir=<path/to/directory/containing/raw/fastq/files>
barcodes=<path/to/multx/barcode/file>
nMismatch=1 #number of mismatches tolerated between barcode and sequence (as long as they are unique)
#################

echo "Demultiplexing your fastq using the ", $barcodes "file. \n"

myFastq=$(ls $fastqDir/*R1.fastq)

#demultiplexing
fastq-multx -B $barcodes -m 1 -b $myFastq -o ${myFastq}.R1.%.fastq ${myFastq}.R2.%.fastq

echo "Demultiplexing is complete!"


