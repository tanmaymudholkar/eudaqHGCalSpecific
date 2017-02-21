#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Exactly five parameters expected"
    return 1
else
    rsync -q -c -a -v -e ssh $1/$2 $3@$4:$5
    if [ $? -eq 0 ]; then
        ssh -T $3@$4 "$5/$2"
    else
        echo "Something went wrong in rsync"
        return 1
    fi
fi

