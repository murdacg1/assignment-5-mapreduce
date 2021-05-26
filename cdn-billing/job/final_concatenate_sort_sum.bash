#!/bin/bash

cat part-* | sort -k2 -g -r > all-sorted-connections
cat part-* | sort -k3 -g -r > all-sorted-gb
cat part-* | sort -k4 -g -r > all-sorted-dollars

head -10 all-sorted-connections > all-sorted-connections-head
head -10 all-sorted-gb > all-sorted-gb-head
head -10 all-sorted-dollars > all-sorted-dollars-head

echo
echo 'Total number of unique remote domains:'
number_unique_remote_domains=`wc all-sorted-connections | awk '{print $1}'`
echo $number_unique_remote_domains

echo
echo 'Total number of connections (established or attempted--including 404 and 304 codes, etc.) from all remote domains:'
awk '{s+=$2} END {print s}' all-sorted-connections

echo
echo 'Total gigabytes transferred:'
awk '{s+=$3} END {print s}' all-sorted-connections

echo
echo 'Total dollars charged to all remote domains:'
awk '{s+=$4} END {print s}' all-sorted-connections
