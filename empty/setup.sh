#!/bin/bash

# Author: Aditya

cp gen/empty.out /lib/firmware/am335x-pru0-fw 
echo "stop" > /sys/devices/platform/ocp/4a326004.pruss-soc-bus/4a300000.pruss/4a334000.pru/remoteproc/remoteproc1/state
echo "start" > /sys/devices/platform/ocp/4a326004.pruss-soc-bus/4a300000.pruss/4a334000.pru/remoteproc/remoteproc1/state

