#!/bin/bash
# A script to count the number of bases in a primer
# it accepts any number of FASTA fies as input
# it will be wrong if the last line of the sequence info
# does not have a newline character

# Expecting a FASTA file formatted like this

# > sequence_id
# AGCTCGTC

# This will get the second line (the bases) in the file
# that's the head piped into tail
# then count the characters (the wc -m)
# but then also subtract one because wc -m counts new lines
for file in "$@"
do
  FILENAME=$(basename $file .fasta)
  NUCLEOTIDE=$(expr $(head -n 2 $file | tail -n 1 | wc -m) - 1)
  echo In $FILENAME, there are $NUCLEOTIDE nucleotides.
done
