#!/bin/bash

source /afs/cern.ch/sw/lcg/external/gcc/4.9/x86_64-slc6-gcc49-opt/setup.sh
source /afs/cern.ch/sw/lcg/app/releases/ROOT/6.06.08/x86_64-slc6-gcc49-opt/root/bin/thisroot.sh
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/qt/5.0.0/x86_64-slc6-gcc47-opt/lib:$LD_LIBRARY_PATH
export PATH=/home/daq/daq/cmake-3.7.2/bin:/afs/cern.ch/sw/lcg/external/qt/5.0.0/x86_64-slc6-gcc47-opt/bin/:$PATH
export CPATH=/afs/cern.ch/sw/lcg/external/qt/5.0.0/x86_64-slc6-gcc47-opt/include/:$CPATH
