# RAMPAGE Pipeline
## Written by R. Taylor Raborn <rtraborn@indiana.edu>, Brendel Lab, Indiana University
### September 2016

The files in this repository processes RAMPAGE data from raw fastqs to bam files containing TSS data for subsequent processing by TSRchitect.

This pipeline depends on several (freely-available) bioinformatics tools. They are as follows:

- fastq-multx (Erik Aronesty, 2013). Link: https://github.com/brwnj/fastq-multx (demultiplexing)
- Fastx Toolkit (Hannon Lab). Link: http://hannonlab.cshl.edu/fastx_toolkit/ (HardClipping)
- TagDust (Timo Lassmann, 2015). Link: https://sourceforge.net/projects/tagdust/
- STAR (Alex Dobin et al., 2013). Link: https://github.com/alexdobin/STAR (Read alignment)
- Samtools (Heng Li, 2009, 2011). Link: https://github.com/samtools/samtools

As presently constructed, this pipeline is comprised of four scripts (found in the /scripts directory), that are to be run consecutively.

1. Demultiplexing: RAMPAGE_demultiplex.sh
2. Hard clipping of demultiplexed fastq files (R1 and R2): RAMPAGE_clipFastq.sh
3. Removal of low complexity reads, including rRNAs: RAMPAGE_tagDust.sh
4. Alignment of reads to a reference genome using STAR: RAMPAGE_align_STAR.sh



