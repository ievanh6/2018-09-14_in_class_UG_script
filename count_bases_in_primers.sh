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
expr $(head -n 2 primer_B.fasta | tail -n 1 | wc -m)
# Another solution woud be to use td like so
head -n 2 primer_B.fasta | tail -n 1 | tr -d '\n' | wc -m
