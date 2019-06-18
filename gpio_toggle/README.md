To compile:
$ export PRU_CGT=<>
$ export PRU_SOFTWARE_PACKAGE=<>
$ make


To clean the repo:
$ make clean


To run the code:
$ config-pin P9_27 pruout
$ source setup.sh




Note:
To access the GPIO pin the HDMI overlay must be disabled. To do this, enable the following line
in the /doot/uEnv.txt file:
disable_uboot_overlay_video=1

