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



; UART Register Offsets
RBR 		.set 	0x00
THR 		.set	0x00
IER		.set 	0x04
IIR		.set	0x08
FCR		.set	0x08
LCR		.set	0x0C
MCR		.set	0x10
LSR		.set	0x14
MSR		.set	0x18
SCR		.set	0x1C
DLL		.set	0x20
DLH		.set	0x24
REVID1		.set	0x28
REVID2		.set	0x2C
PWREMU_MGMT	.set	0x30
MDR		.set	0x34








    .sect   ".text:main"
    .clink
    .global ||main||
    
||main||:

	ZERO &r1, 4 ; Clear register R1
	
	LDI r1, 104
	SBCO &r1, c7, DLL, 4 ; Set the clock DLL divisor for B115200

	LDI r1, 0
	SBCO &r1, c7, DLH, 4

	LDI r1, 0
	SBCO &r1, c7, MDR, 4
	
	LDI r1, 7
	SBCO &r1, c7, IER, 4 ; Enable interrupts

	LDI r1, 0xF
	SBCO &r1, c7, FCR, 4 ; Enable FIFOs (1-byte)

	LDI r1, 3
	SBCO &r1, c7, LCR, 4 ; 8n1

	LDI r1, 0x6001
	SBCO &r1, c7, PWREMU_MGMT, 4 ; Allow UART to run free; enable Tx/Rx


    ldi r2.b2, 0x01	

||write||:
    LDI r1.b0, 0xBE ; Dummy data
    SBCO &r1, c7, THR, 1 ; Write a byte of data
    and r1, r1, 0

waitloop:
    add r1, r1, 1			; increment R1
    qbgt waitloop, r1, r2		
    jmp write



    HALT
