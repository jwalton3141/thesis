#!/bin/bash

# The inbuilt spell-check of TexMaker leaves much to be desired.
# The spell-check checks the contents of commands such as \ref, \label, \cite,
# etc. which almost never contain meaningful words.

# Define escape codes for easier print formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# If anspell.conf does not exist then create and prepopulate with ignores
if [ ! -f ~/.aspell.conf ]; then
    cat inputs/aspell.conf >> ~/.aspell.conf
fi

printf "\n${RED}SPELL CHECK RESULTS${NC}\n\n"

for file in chapters/*.tex
do 
    printf "${GREEN}$file${NC}\n"
    cat $file | aspell list -t | sort | uniq
    echo -e "\n"
done