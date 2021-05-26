#!/usr/bin/env python3

"""A more advanced Mapper, using Python iterators and generators."""

import sys, re

def read_input(file):
    for line in file:
        # use regex to replace all punctuation with a space; then lowercase the line
        line = re.sub(r'[^\w\s]', ' ', line).lower()
        # strip spaces and split the line into words
        yield line.strip().split()

def main(separator='\t'):
    # input comes from STDIN (standard input)
    data = read_input(sys.stdin)
    for words in data:
        # write the results to STDOUT (standard output);
        # what we output here will be the input for the
        # Reduce step, i.e. the input for reducer.py
        #
        # tab-delimited; the trivial word count is 1
        for word in words:
            print(word, separator, "1")

if __name__ == "__main__":
    main()
