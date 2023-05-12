#!/bin/bash

run() {
    alt=$1
    span=$2
    left=$3
    right=$4

    sed "s/\`ALT/$alt/g;s/\`SPAN/$span/g;s/\`LEFT/$left/g;s/\`RIGHT/$right/g" dynamic_range_lhs.svt > dynamic_range_lhs_${alt}_${span}_${left}_${right}.sv
}

for alt in `seq 0 1`; do
for span in `seq 1 4`; do
for left in `seq -4 4`; do
for right in `seq $(expr $left + -3) $(expr $left + 3)`; do
    run $alt $span $left $right
done
done
done
done
