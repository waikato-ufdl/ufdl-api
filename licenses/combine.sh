#!/bin/bash

# Combines all the license files and extracts:
# limitations "l:"
# conditions "c:"
# permissions "p:"

# combine licenses
TMP_ALL=/tmp/all.txt
rm -f $TMP_ALL
for i in ./*.txt
do
  cat $i >> $TMP_ALL
done

# extract permissions
cat $TMP_ALL | grep "p:" | sed s/".:"/""/g | sed s/" $"/""/g | sort -u > ./_permissions.txt

# extract limitations
cat $TMP_ALL | grep "l:" | sed s/".:"/""/g | sed s/" $"/""/g | sort -u > ./_limitations.txt

# extract conditions
cat $TMP_ALL | grep "c:" | sed s/".:"/""/g | sed s/" $"/""/g | sort -u > ./_conditions.txt

