CC=arm-linux-gcc
CFLAGS=-static -g

all: mulaw mulaw_clean mulaw_arm

mulaw: mulaw.c
	gcc $(CFLAGS) -o mulaw.exe mulaw.c
	
mulaw_arm: mulaw_clean.c
	arm-linux-gcc $(CFLAGS) -o mulaw_arm.exe mulaw_clean.c

clean:
	rm *.exe *.o
