#!/bin/sh

find -name prepare.sh -execdir "{}" \; > /dev/null 2> /dev/null
rm -f file_list
find -name *.v ! -path "./*_failures/*" -execdir iverilog -E -Minclude="{}.file_list" "{}" -o /dev/null \; 2> buildlog1
find -name *.sv ! -path "./*_failures/*" -execdir iverilog -E -Minclude="{}.file_list" "{}" -o /dev/null \; 2> buildlog2
find -name *.v ! -path "./*_failures/*" -exec sh -c "echo @{} >> file_list" \; -exec sh -c "cat \"{}.file_list\" >> file_list" \;
find -name *.sv ! -path "./*_failures/*" -exec sh -c "echo @{} >> file_list" \; -exec sh -c "cat \"{}.file_list\" >> file_list" \;
