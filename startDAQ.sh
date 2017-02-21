#!/bin/bash

DEBUGGING_MODE=true

N_CONNECTED_PIS=4
EUDAQ_BIN_FOLDER="/home/daq/daq/eudaq/bin"
CURRENT_DIR=$PWD

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

cd $EUDAQ_BIN_FOLDER

echo "Starting euRun.exe..."
./euRun.exe &
read -p "Press any key to continue..." -n1 -s

echo "Starting euLog.exe..."
./euLog.exe &
read -p "Press any key to continue..." -n1 -s

for piCounter in `seq 1 ${N_CONNECTED_PIS}`; do
    echo "Starting producer ${piCounter}"
    ./HGCalProducer.exe --name HGCal_RPi${piCounter} &
done

cd $CURRENT_DIR
