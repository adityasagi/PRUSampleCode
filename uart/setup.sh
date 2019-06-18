#!/bin/bash

# Author: Aditya Sagi
# Date  : 18 Jun 2019

# Copy the PRU firmware into the /lib folder from where it will be picked up by
# the pru_rproc driver
cp gen/uart.out /lib/firmware/am335x-pru0-fw 

# Stop the PRU0 core
echo "stop"  > /sys/class/remoteproc/remoteproc1/state

# Start the PRU0 core
echo "start" > /sys/class/remoteproc/remoteproc1/state

