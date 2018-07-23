CC=arm-linux-gcc
CFLAGS=-static

all: mulaw mulaw_extended mulaw_arm

mulaw: mulaw.c
	gcc -g -o mulaw.exe mulaw.c

mulaw_extended: mulaw_extended.c
	gcc -o mulaw_extended.exe mulaw_extended.c

mulaw_arm: mulaw.c
	arm-linux-gcc -static -o mulaw_arm.exe mulaw.c

clean:
	rm *.exe *.o
