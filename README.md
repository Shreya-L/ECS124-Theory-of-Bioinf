# ECS124-Theory-of-Bioinformatics
ECS 124 - Theory and Practice of Bioinformatics - UC Davis
This README contains various scripts, their use, and descriptions.

## Fasta to FastQ

Converts Fasta files to FastQ format. This is predominantly useful when bioinformatic tools require one format over the other. 

Example running fasta2fastq.pl using sample.fasta file provided in the Fasta-Fastq Sample Files folder. 

Please input the name of a file to be read.
```
sample.fasta
```

Please input the name of the file to print to.
```
temp.fastq
```
The resulting fastq file is stored within temp.fastq

## FastQ to Fasta

Converts Fastq files to Fasta format. This is predominantly useful when bioinformatic tools require one format over the other. 

Example running fastq2fasta.pl using sample.fastq file provided in the Fasta-Fastq Sample Files folder. 

Please input the name of a file to be read.
```
sample.fastq
```

Please input the name of the file to print to.
```
temp.fasta
```
The resulting fasta file is stored within temp.fasta.
