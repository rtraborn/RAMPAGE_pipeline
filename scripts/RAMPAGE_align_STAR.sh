#!/bin/bash

### Enter information here ###
GENOME=</path/to/fasta/of/genome/assembly>
GENDIR=</path/to/directory/containing/genome/assembly> 
FQ_DIR=</path/to/directory/containing/fastq/files>
#########

cd $FQ_DIR

echo "Indexing the genome"

STAR --runMode genomeGenerate --runThreadN 8 --genomeDir $GENDIR --genomeFastaFiles $GENOME

echo "Aligning the RAMPAGE reads to the assembly"

for i in *.fastq; do

echo $i 
    
STAR --runMode alignReads --runThreadN 8 --genomeDir $GENDIR --outFilterType Normal --readFilesIn ${i} ${i} --readMatesLengthsIn NotEqual --alignMatesGapMax 1000 --sjdbOverhang 39 --outFilterMultimapNmax 20 --outFilterMismatchNmax 2 --outFilterScoreMinOverLread 0.60 --outSAMtype BAM SortedByCoordinate --outSAMorder Paired --outFileNamePrefix $FQ_DIR/${i}.

done

echo "Alignment is now complete!"



