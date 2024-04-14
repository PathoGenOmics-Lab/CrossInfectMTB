# First evaluate each fastq with FastQC/multiqc
# FastQC
fastqc *.fastq.gz
# MultiQC sum up
multiqc .
# BBDuk for lenght, quality
bbduk.sh in1=file_1.fastq in2=file_2.fastq out1=file_out_1.fastq out2=file_out_2.fastq outm1=file_out_matched_1.fastq outm2=file_out_matched_2.fastq minlen=35 qtrim=r trimq=35
# Prepare references
## Transform annotation gff to gtf (cufflinks)
gffread GCF_000001405.26_GRCh38_genomic.gff -T -o GCF_000001405.26_GRCh38_genomic.gtf
## Create index with STAR
STAR --runThreadN 16 \
     --runMode genomeGenerate \
     --genomeDir human_index \
     --genomeFastaFiles GCF_000001405.26_GRCh38_genomic.fna \
     --sjdbGTFfile GCF_000001405.26_GRCh38_genomic.gtf \
     --sjdbOverhang 100
## Generate transcripts files for salmon
gffread -w transcritos_human.fa -g GCF_000001405.26_GRCh38_genomic.fna GCF_000001405.26_GRCh38_genomic.gff
