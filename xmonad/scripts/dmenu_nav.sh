#!/bin/bash

cd ~

while :
do
    line=$(ls | dmenu)
    if [ -d "$line" ];
    then
        cd "$line"
    else
        xdg-open "$line"
	break
    fi
done
