#!/usr/bin/zsh    

# homework 01
# change into raw directory

cd ~/test/week_1/;

# create subdirectories

mkdir ~/test/week_1/fastq/;
mkdir ~/test/week_1/fasta/;
mkdir ~/test/week_1/metadata/;

# move files into directories based on file extension

mv *.fastq.gz ~/test/week_1/fastq/;
mv *.fasta ~/test/week_1/fasta/;
mv *.csv ~/test/week_1/metadata/;

# count how many files are in each new directory and print to screen

ls ~/test/week_1/fastq/*.fastq.gz | wc -l;
ls ~/test/week_1/fasta/*.fasta | wc -l;
ls ~/test/week_1/metadata/*.csv | wc -l
