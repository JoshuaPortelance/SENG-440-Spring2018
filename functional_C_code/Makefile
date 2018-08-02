CC=arm-linux-gcc
CFLAGS=-static -g

all: mulaw mulaw_arm

mulaw: mulaw.c
	gcc $(CFLAGS) -o mulaw.exe mulaw.c

mulaw_arm: mulaw.c
	arm-linux-gcc $(CFLAGS) -o mulaw_arm.exe mulaw.c

clean:
	rm *.exe *.o
