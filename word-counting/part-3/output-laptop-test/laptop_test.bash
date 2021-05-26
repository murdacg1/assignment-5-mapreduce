#!/bin/bash

cat ../input/wiki.txt | ../job/mapper_only_test.py > output_laptop_test_mapper_only.txt

cat ../input/wiki.txt | ../job/mapper.py | sort -k1,1 | ../job/reducer.py | sort -k3 -n > output_laptop_test.txt
