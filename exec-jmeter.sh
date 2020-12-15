#!/bin/bash

for filename in /testplans/*.jmx; do
    NAME=$(basename $filename)
    NAME="${NAME%.*}"
    jmeter -n -t $filename -l /testresults/$NAME.jtl
done