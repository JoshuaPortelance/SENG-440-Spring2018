CC=arm-linux-gcc
CFLAGS=-static

all: mulaw mulaw_clean mulaw_arm

mulaw: mulaw.c
	gcc -g -o mulaw.exe mulaw.c

mulaw_clean: mulaw_clean.c
	gcc -g -o mulaw_clean.exe mulaw_clean.c

mulaw_arm: mulaw.c
	arm-linux-gcc -static -o mulaw_arm.exe mulaw.c

clean:
	rm *.exe *.o
