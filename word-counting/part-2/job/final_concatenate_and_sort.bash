#!/bin/bash

cat part-* | sort -k2 -n -r > all-sorted

sed '1,$s/,//g' all-sorted | sed '1,$s/\t/ /g' | sed '1,$s/  / /g' | sed '1,$s/  / /g' | sed '1,$s/  / /g' > all-sorted-no-commas-single-space
