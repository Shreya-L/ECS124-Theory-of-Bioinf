# ECS124-Theory-of-Bioinformatics
ECS 124 - Theory and Practice of Bioinformatics - UC Davis
This README contains various scripts, their use, and descriptions.

## Fasta to FastQ

Converts Fasta files to FastQ format. This is predominantly useful when bioinformatic tools require one format over the other. 

Example running fasta2fastq.pl using sample.fasta file provided in the Fasta-Fastq Sample Files folder. 
```
Please input the name of a file to be read.
```
sample.fasta

```
Please input the name of the file to print to.
```
temp.fastq

The resulting fastq file is stored within temp.fastq

## FastQ to Fasta

Converts Fastq files to Fasta format. This is predominantly useful when bioinformatic tools require one format over the other. 

Example running fastq2fasta.pl using sample.fastq file provided in the Fasta-Fastq Sample Files folder. 
```
Please input the name of a file to be read.
```
sample.fastq

```
Please input the name of the file to print to.
```
temp.fasta

The resulting fasta file is stored within temp.fasta.


## Needleman-Wunsch Global Alignment Script

This script isn't really clinically/computationally useful. You would basically only use this if you wanted the global alignment of a protein or short DNA strand. The computational performance of this aligner is terrible with a O(mn) compared to other alignment tools.

But, if you did feel the need to compare to global protein sequences there are two versions of this script: One without a gap penalty (needleman.pl) and one with a gap penalty (needlemangap.pl). 

needleman.pi usage: 
```
Input String 1
```
Here you would enter your first string example: AATGTGCT

```
Input String 2
```
Here you would enter your second string example: AATTTT

The program will then ask you to specify how many points you want to designate for a match, mismatch and indel. 
(typically match = 1 and indel and mismatch = -1). 

```
Input Match Value
```
1
```
Input mismatch cost
```
-1
```
Input indel cost
```
-1

The output file is called outer. The file will contain the values of the alignment matrix. The last sentence
in the file outputs the similarity value. 
Example: 
```
 The similarity value of the two strings is 21
 ```
 
The above example is exactly the same for the needlemangap.pl script as well. 
