; Resource table needed for remoteproc Linux driver
    .global ||pru_remoteproc_ResourceTable||
    .sect   ".resource_table:retain", RW
    .retain
    .align  1
    .elfsym ||pru_remoteproc_ResourceTable||,SYM_SIZE(20)
    
||pru_remoteproc_ResourceTable||:
    .bits   1,32            ; pru_remoteproc_ResourceTable.base.ver @ 0
    .bits   0,32            ; pru_remoteproc_ResourceTable.base.num @ 32
    .bits   0,32            ; pru_remoteproc_ResourceTable.base.reserved[0] @ 64
    .bits   0,32            ; pru_remoteproc_ResourceTable.base.reserved[1] @ 96
    .bits   0,32            ; pru_remoteproc_ResourceTable.offset[0] @ 128

    .sect   ".text:main"
    .clink
    .global ||main||
    
||main||:

    ; code here

    HALT
