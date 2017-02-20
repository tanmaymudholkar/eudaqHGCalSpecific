#!/bin/bash

DEBUGGING_MODE=true

N_CONNECTED_PIS=3
COMMON_HOSTNAME_PREFIX="rpihgcal"

# conditional_print()

if [ "$DEBUGGING_MODE" = true ] ; then
    echo "LD_LIBRARY_PATH is currently: $LD_LIBRARY_PATH"
    echo "CPATH is currently: $CPATH"
    echo "PATH is currently: $PATH"
    echo "N_CONNECTED_PIS is currently: $N_CONNECTED_PIS"
    echo "COMMON_HOSTNAME_PREFIX is currently: $COMMON_HOSTNAME_PREFIX"
fi

for piCounter in `seq 1 ${N_CONNECTED_PIS}`; do
    echo "About to execute: /home/daq/daq/eudaq/bin/HGCalProducer.exe --commonHostnamePrefix=$COMMON_HOSTNAME_PREFIX --piCounter=$piCounter"
done
