#!/bin/bash
for file in /home/rich/*
do
if [ -d "$file" ]
then
echo "$file is a directory"
else #elif there was mistake
echo "$file is a file"
fi
done > output.txt

cat output.txt
