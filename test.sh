#!/bin/sh

find -name prepare.sh -execdir "{}" \; > /dev/null 2> /dev/null
find -name *.v ! -path "./*_failures/*" ! -execdir iverilog -E -o "{}.pre.v" "{}" \; 2> buildlog1
find -name *.sv ! -path "./*_failures/*" -execdir sv2v -w "{}.pre.v" "{}" \; 2> buildlog2
find -name *.pre.v -exec verismith parse "{}" -o "{}.vsout" \; 2> log1
rm -f log2 log3
find -name *.vsout -exec sh -c "verismith parse \"{}\" -o \"{}2\" 2>> log2 ; diff -u \"{}\" \"{}2\" >> log3" \;
