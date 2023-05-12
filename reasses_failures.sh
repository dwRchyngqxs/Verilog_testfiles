#!/bin/sh

find -name *.v -path "./*_failures/*" ! -execdir iverilog -E -o "{}.pre.v" "{}" \; 2> buildlog1
find -name *.sv -path "./*_failures/*" -execdir sv2v -w "{}.pre.v" "{}" \; 2> buildlog2
find -name *.pre.v -exec verismith parse "{}" -o "{}.vsout" \; -print 2> log1 > success
