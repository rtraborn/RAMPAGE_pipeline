#!/bin/bash

### Please enter information here (test files are entered by default) ###
GENOME=../test/sample_genome/Osj.fa
GENDIR=../test/sample_genome/ 
FQ_DIR=../test/sample_fastq/demultiplexed
OutFilterScore=0.60
OutSamType=BAM
NThreads=8
############

cd $FQ_DIR

echo "Indexing the genome"

STAR --runMode genomeGenerate --runThreadN $NThreads --genomeDir $GENDIR --genomeFastaFiles $GENOME

echo "Aligning the RAMPAGE reads to the assembly"

for i in `ls *R1.fastq | cut -d "." -f 1` ; do

echo $i 
    
STAR --runMode alignReads --runThreadN 8 --genomeDir $GENDIR --outFilterType Normal --readFilesIn ${i}.R1.fastq ${i}.R2.fastq --readMatesLengthsIn NotEqual --alignMatesGapMax 1000 --sjdbOverhang 39 --outFilterMultimapNmax 20 --outFilterMismatchNmax 2 --outFilterScoreMinOverLread $OutFilterScore --outSAMtype $OutSamType SortedByCoordinate --outSAMorder Paired --outFileNamePrefix $FQ_DIR/${i}.

done

echo "Alignment is now complete!"



