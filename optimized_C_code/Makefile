CC=arm-linux-gcc
CFLAGS=-static

all: mulaw mulaw_clean mulaw_arm mulaw_arm_clean

mulaw: mulaw.c
	gcc -g -o mulaw.exe mulaw.c

mulaw_clean: mulaw_clean.c
	gcc -g -o mulaw_clean.exe mulaw_clean.c

mulaw_arm: mulaw.c
	arm-linux-gcc -static -g -o mulaw_arm.exe mulaw.c

mulaw_arm_clean: mulaw.c
	arm-linux-gcc -static -g -o mulaw_arm_clean.exe mulaw_clean.c

clean:
	rm *.exe *.o
