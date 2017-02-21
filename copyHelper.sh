#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Exactly four parameters expected"
    return 1
else
    rsync -q -c -a -v -e ssh $1 $2@$3:$4
fi
