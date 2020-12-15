#!/bin/bash

for filename in /testplans/*.jmx; do
    NAME=$(basename $filename)
    NAME="${NAME%.*}"
    jmeter -n -t /testplans/$filename -l /testresults/$NAME.jtl
done