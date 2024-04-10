#First evaluate each fastq with FastQC/multiqc
# FastQC
fastqc *.fastq.gz
#  MultiQC sum up
multiqc .
