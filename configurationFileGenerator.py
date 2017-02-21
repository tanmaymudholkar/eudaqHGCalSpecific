#!/usr/bin/env python

from __future__ import print_function, division
import datetime, optparse
# not using argparse because it is only officially supported from version 2.7 onwards

parser = optparse.OptionParser()
parser.add_option("-n", "--nRPiModules", action="store", type="int", dest="nRPiModules", default=0, help="Number of connected Raspberry Pi modules")
(options, args) = parser.parse_args()

nRPiModules = options.nRPiModules
commonHostnamePrefix = 'rpihgcal'
exampleParameter = 123
pathToExampleFile = '/home/daq/daq/hgcalSpecific/fileContainingExampleString.txt'
localScriptDir = '/home/daq/daq/hgcalSpecific'
testScriptName = 'testScript.sh'

linesInFinalConfig = ['# Generated on ' + str(datetime.datetime.now().date()) + ' at ' + str(datetime.datetime.now().time()) + '\n', '# Number of RPi Modules: ' + str(nRPiModules) + '\n']

if (nRPiModules == 0):
    print ("Please enter the number of RPi Modules with the argument -n, like so:")
    print ("./configurationFileGenerator.py -n 10")
    raise SystemExit

commonConfigFile = open('commonConfig.txt', 'r')
for commonConfigLine in commonConfigFile:
    linesInFinalConfig += commonConfigLine
linesInFinalConfig += ['\n']
commonConfigFile.close()

commonProducerConfig = []
commonProducerConfig += ['Parameter = %d\n'%(exampleParameter)]
commonProducerConfig += ['commonHostnamePrefix = %s\n'%(commonHostnamePrefix)]
commonProducerConfig += ['pathToExampleFile = %s\n'%(pathToExampleFile)]
commonProducerConfig += ['localScriptDir = %s\n'%(localScriptDir)]
commonProducerConfig += ['testScriptName = %s\n'%(testScriptName)]

for piCounter in range(1,1+nRPiModules):
    linesInFinalConfig += ['[Producer.HGCal_RPi' + str(piCounter) + ']\n']
    for commonProducerLine in commonProducerConfig:
        linesInFinalConfig += commonProducerLine
    linesInFinalConfig += ['piCounter = %d\n'%(piCounter)]
    linesInFinalConfig += ['\n']
    
finalConfigFile = open('HGCalConf_GENERATED_BY_SCRIPT_DO_NOT_MODIFY.conf', 'w')
for lineInFinalConfig in linesInFinalConfig:
    finalConfigFile.write(lineInFinalConfig)
finalConfigFile.close()

print ("Generated config file!")
