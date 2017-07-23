#!/bin/bash

LIST_PATH="$(readlink -f shells/list.txt)"

if [ ! -d data ]; then
    mkdir data
fi
cd data

while IFS='' read -r line || [[ -n "$line" ]]; do
    (FILE_NAME="$(echo $line | rev | cut -d'/' -f1 | rev)"
    wget $line
    if [ ${line: -4} == ".zip" ]; then
        unzip $FILE_NAME
    elif [ ${line: -4} == ".tar" ]; then
        tar xvf $FILE_NAME
    else
        echo "Check the file extension: $FILE_NAME"
    fi
    rm -rf $FILE_NAME) &
done < ${LIST_PATH}
