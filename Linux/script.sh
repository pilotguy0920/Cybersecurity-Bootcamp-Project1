#!/bin/bash
width=72
for i in ${0}; do
    lines="$(wc -l < $1 | sed 's/ //g')"
    chars="$(wc -c < $1 | sed 's/ //g')"
    owner="$(ls -ld $1 | awk '{print $3}')"
    echo "-----------------------------------------------------------------"
    echo "File $1 ($lines lines, $chars characters, owned by $owner):"
    echo "-----------------------------------------------------------------"
    while read line
    do
        if [ ${#line} -gt $width ]
        then
        echo "$line" | fmt | sed -e '$1/^/  /' -e '2,$s/^/+ /'
        else
        echo "  $line"
        fi
    done < '/var/tmp/5galf'

    echo "-----------------------------------------------------------------"
done
