CC=arm-linux-gcc
CFLAGS=-static

all: mulaw mulaw_arm

mulaw: mulaw.c
	gcc -g -o mulaw.exe mulaw.c

mulaw_arm: mulaw.c
	arm-linux-gcc -static -g -o mulaw_arm.exe mulaw.c

clean:
	rm *.exe *.o
