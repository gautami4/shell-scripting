#!/bin/bash

# read the contents of file line by line

file="hello-world.sh"

if [ -e "$file" ]; then
    while IFS= read -r line; do
        echo "line read : $line "
    done < "$file"
else
    echo "file not found : $file "
fi