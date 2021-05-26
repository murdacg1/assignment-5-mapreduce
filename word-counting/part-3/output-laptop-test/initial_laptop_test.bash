#!/bin/bash

rm -f output_initial_laptop_test.txt

echo >> output_initial_laptop_test.txt
echo "oli hän oli vuonna myös joka vajaa" | ../job/mapper.py | sort -k1,1 >> output_initial_laptop_test.txt

echo >> output_initial_laptop_test.txt
echo "oli hän oli vuonna myös joka vajaa" | ../job/mapper.py | sort -k1,1 | ../job/reducer.py | sort -k3 -n >> output_initial_laptop_test.txt
