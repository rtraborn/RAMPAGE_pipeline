#!/bin/bash

### Please enter information here (test files are entered by default) ###
GENOME=OsjChr1.fa
GENDIR=`readlink -f ../test/sample_genome/`
FQ_DIR=/scratch/rtraborn/RAMPAGE_pipeline//test/sample_fastq/demultiplexed_matched/clipped/tagDust_files
OutFilterScore=0.60
OutSamType=BAM
NThreads=8
############

echo "Indexing the genome"

STAR --runMode genomeGenerate --runThreadN $NThreads --genomeDir $GENDIR --genomeFastaFiles $GENOME

echo "Aligning the RAMPAGE reads to the assembly"

cd $FQ_DIR

for i in `ls *.fastq_READ1.fq` ; do

    j=`expr $i | cut -d "." -f 1`
    k=`expr $i | cut -d "." -f 3,4`
    l=${j}.R2.${k}.fastq_READ2.fq

    echo $j
    echo $k
    echo $l

echo "Aligning" $i $l
    
STAR --runMode alignReads --runThreadN 8 --genomeDir $GENDIR --outFilterType Normal --readFilesIn ${i} ${l} --readMatesLengthsIn NotEqual --alignMatesGapMax 1000 --sjdbOverhang 39 --outFilterMultimapNmax 20 --outFilterMismatchNmax 2 --outFilterScoreMinOverLread $OutFilterScore --outSAMtype $OutSamType SortedByCoordinate --outSAMorder Paired

done

echo "Alignment is now complete!"



