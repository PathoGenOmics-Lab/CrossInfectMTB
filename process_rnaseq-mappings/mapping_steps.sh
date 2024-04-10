# First evaluate each fastq with FastQC/multiqc
# FastQC
fastqc *.fastq.gz
#  MultiQC sum up
multiqc .
# BBDuk for lenght, quality and primer trimming
bbduk.sh in1=file_1.fastq in2=file_2.fastq out1=file_out_1.fastq out2=file_out_2.fastq outm1=file_out_matched_1.fastq outm2=file_out_matched_2.fastq ref=adaptadores.fa ktrim=r k=23 mink=11 hdist=1 minlen=35 qtrim=r trimq=35
