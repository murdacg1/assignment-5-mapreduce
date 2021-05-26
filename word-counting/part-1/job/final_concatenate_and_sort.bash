#!/bin/bash

cat part-* | sort -k2 -n -r > all-sorted

sed '1,$s/,//g' all-sorted | sed '1,$s/\t/ /g' | sed '1,$s/  / /g' | sed '1,$s/  / /g' | sed '1,$s/  / /g' > all-sorted-no-commas-single-space

# remove all words with a digit 0-9 or words consisting of just a single letter
# (these are abbreviations since Finnish does not have such words unlike in English which has a and I)
#cat all-sorted-no-commas-single-space | grep -v -E '^.*[0-9]+.*\s' | grep -v '^[a-zäöå]\s' | grep -E '^[a-zäöå]+\s' > all-sorted-no-commas-single-space-realwords
cat all-sorted-no-commas-single-space | grep -v -E '^.*[0-9]+.*\s' | grep -v '^[a-z]\s' | grep -E '^[a-z]+\s' > all-sorted-no-commas-single-space-realwords


total_words=`awk '{s+=$2} END {print s}' all-sorted-no-commas-single-space`
awk -v total_words=$total_words '{print $1, $2, 100.0*$2/total_words}' all-sorted-no-commas-single-space > all-sorted-no-commas-single-space-freqs
echo >> all-sorted-no-commas-single-space-freqs
echo 'Total words:' >> all-sorted-no-commas-single-space-freqs
echo $total_words >> all-sorted-no-commas-single-space-freqs
head -150 all-sorted-no-commas-single-space-freqs > all-sorted-no-commas-single-space-freqs-top-150

total_words=`awk '{s+=$2} END {print s}' all-sorted-no-commas-single-space-realwords`
awk -v total_words=$total_words '{print $1, $2, 100.0*$2/total_words}' all-sorted-no-commas-single-space-realwords > all-sorted-no-commas-single-space-realwords-freqs
echo >> all-sorted-no-commas-single-space-realwords-freqs
echo 'Total words:' >> all-sorted-no-commas-single-space-realwords-freqs
echo $total_words >> all-sorted-no-commas-single-space-realwords-freqs
head -150 all-sorted-no-commas-single-space-realwords-freqs > all-sorted-no-commas-single-space-realwords-freqs-top-150


grep -E '^...\s' all-sorted-no-commas-single-space > all-sorted-no-commas-single-space-three-chars
total_words=`awk '{s+=$2} END {print s}' all-sorted-no-commas-single-space-three-chars`
echo >> all-sorted-no-commas-single-space-three-chars
echo 'Total words:' >> all-sorted-no-commas-single-space-three-chars
echo $total_words >> all-sorted-no-commas-single-space-three-chars

grep -E '^...\s' all-sorted-no-commas-single-space-realwords > all-sorted-no-commas-single-space-realwords-three-chars
total_words=`awk '{s+=$2} END {print s}' all-sorted-no-commas-single-space-realwords-three-chars`
echo >> all-sorted-no-commas-single-space-realwords-three-chars
echo 'Total words:' >> all-sorted-no-commas-single-space-realwords-three-chars
echo $total_words >> all-sorted-no-commas-single-space-realwords-three-chars


grep -E '^.....\s' all-sorted-no-commas-single-space > all-sorted-no-commas-single-space-five-chars
total_words=`awk '{s+=$2} END {print s}' all-sorted-no-commas-single-space-five-chars`
echo >> all-sorted-no-commas-single-space-five-chars
echo 'Total words:' >> all-sorted-no-commas-single-space-five-chars
echo $total_words >> all-sorted-no-commas-single-space-five-chars

grep -E '^.....\s' all-sorted-no-commas-single-space-realwords > all-sorted-no-commas-single-space-realwords-five-chars
total_words=`awk '{s+=$2} END {print s}' all-sorted-no-commas-single-space-realwords-five-chars`
echo >> all-sorted-no-commas-single-space-realwords-five-chars
echo 'Total words:' >> all-sorted-no-commas-single-space-realwords-five-chars
echo $total_words >> all-sorted-no-commas-single-space-realwords-five-chars
