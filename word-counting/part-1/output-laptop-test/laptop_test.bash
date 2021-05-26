#!/bin/bash

cat ../input/wiki.txt | ../job/mapper.py | sort -k1,1 | ../job/reducer.py | sort -k2 -n -r > output_laptop_test.txt
