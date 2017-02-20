#!/bin/bash

DEBUGGING_MODE=true

N_CONNECTED_PIS=1
EUDAQ_BIN_FOLDER="/home/daq/daq/eudaq/bin"

print_debug() {
    if [ "$DEBUGGING_MODE" = true ] ; then
        echo "$*"
    fi
}

# if [ "$DEBUGGING_MODE" = true ] ; then
#     echo "LD_LIBRARY_PATH is currently: $LD_LIBRARY_PATH"
#     echo "CPATH is currently: $CPATH"
#     echo "PATH is currently: $PATH"
#     echo "N_CONNECTED_PIS is currently: $N_CONNECTED_PIS"
# fi

print_debug "LD_LIBRARY_PATH is currently: $LD_LIBRARY_PATH"
print_debug "CPATH is currently: $CPATH"
print_debug "PATH is currently: $PATH"
print_debug "N_CONNECTED_PIS is currently: $N_CONNECTED_PIS"

echo "Starting euRun.exe..."
${EUDAQ_BIN_FOLDER}/euRun.exe &
read -p "Press any key to continue..." -n1 -s

echo "Starting euLog.exe..."
${EUDAQ_BIN_FOLDER}/euLog.exe &
read -p "Press any key to continue..." -n1 -s

for piCounter in `seq 1 ${N_CONNECTED_PIS}`; do
    echo "Starting producer ${piCounter}"
    ${EUDAQ_BIN_FOLDER}/HGCalProducer.exe --name HGCal_RPi${piCounter} &
done
