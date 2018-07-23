	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 18, 4
	.file	"mulaw_clean.c"
	.text
	.align	2
	.global	fppwlog2
	.type	fppwlog2, %function
fppwlog2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #4096
	bcc	.L2
	cmp	r0, #8192
	subcc	r0, r0, #4096
	bxcc	lr
	cmp	r0, #16384
	bcs	.L5
	add	r3, r0, #2080768
	add	r3, r3, #8192
	mov	r3, r3, asl #11
	mov	r3, r3, lsr #12
	add	r0, r3, #4096
	bx	lr
.L5:
	cmp	r0, #32768
	bcs	.L6
	add	r3, r0, #4177920
	mov	r3, r3, asl #10
	mov	r3, r3, lsr #12
	add	r0, r3, #8192
	bx	lr
.L6:
	cmp	r0, #65536
	bcs	.L7
	add	r3, r0, #8323072
	add	r3, r3, #32768
	mov	r3, r3, asl #9
	mov	r3, r3, lsr #12
	add	r0, r3, #12288
	bx	lr
.L7:
	cmp	r0, #131072
	bcs	.L8
	add	r3, r0, #16711680
	mov	r3, r3, asl #8
	mov	r3, r3, lsr #12
	add	r0, r3, #16384
	bx	lr
.L8:
	cmp	r0, #262144
	bcs	.L9
	add	r3, r0, #33292288
	add	r3, r3, #131072
	mov	r3, r3, asl #7
	mov	r3, r3, lsr #12
	add	r0, r3, #20480
	bx	lr
.L9:
	cmp	r0, #524288
	bcs	.L10
	add	r3, r0, #66846720
	mov	r3, r3, asl #6
	mov	r3, r3, lsr #12
	add	r0, r3, #24576
	bx	lr
.L10:
	cmp	r0, #1048576
	bcs	.L2
	add	r3, r0, #133169152
	add	r3, r3, #524288
	mov	r3, r3, asl #5
	mov	r3, r3, lsr #12
	add	r0, r3, #28672
	bx	lr
.L2:
	mvn	r0, #0
	bx	lr
	.size	fppwlog2, .-fppwlog2
	.align	2
	.global	encode
	.type	encode, %function
encode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #255
	mul	r0, r3, r0
	mov	r0, r0, lsr #3
	stmfd	sp!, {r4, lr}
	add	r0, r0, #4096
	bl	fppwlog2
	mov	r0, r0, asl #9
	mov	r0, r0, lsr #17
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	encode, .-encode
	.align	2
	.global	fppw2exp
	.type	fppw2exp, %function
fppw2exp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1024
	bcs	.L15
	ldr	r3, .L25
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	add	r0, r3, #4096
	bx	lr
.L15:
	cmp	r0, #2048
	bcs	.L17
	ldr	r3, .L25+4
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	add	r0, r3, #3936
	add	r0, r0, #13
	bx	lr
.L17:
	cmp	r0, #3072
	bcs	.L18
	ldr	r3, .L25+8
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	add	r0, r3, #3584
	add	r0, r0, #12
	bx	lr
.L18:
	cmp	r0, #4096
	bcs	.L19
	ldr	r3, .L25+12
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	add	r0, r3, #2976
	add	r0, r0, #6
	bx	lr
.L19:
	cmp	r0, #5120
	bcs	.L20
	ldr	r3, .L25+16
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	add	r0, r3, #1664
	add	r0, r0, #7
	bx	lr
.L20:
	cmp	r0, #6144
	bcs	.L21
	ldr	r3, .L25+20
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	add	r0, r3, #524
	bx	lr
.L21:
	cmp	r0, #7168
	bcs	.L22
	ldr	r3, .L25+24
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	sub	r0, r3, #1584
	sub	r0, r0, #5
	bx	lr
.L22:
	cmp	r0, #8192
	ldrcc	r3, .L25+28
	mulcc	r3, r0, r3
	movcc	r3, r3, lsr #12
	subcc	r0, r3, #4416
	mvncs	r0, #0
	subcc	r0, r0, #40
	bx	lr
.L26:
	.align	2
.L25:
	.word	3097
	.word	3686
	.word	4391
	.word	5210
	.word	6193
	.word	7373
	.word	8782
	.word	10420
	.size	fppw2exp, .-fppw2exp
	.align	2
	.global	fpexp8
	.type	fpexp8, %function
fpexp8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mul	r3, r0, r0
	mov	r3, r3, lsr #12
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	mul	r3, r0, r3
	mov	r3, r3, lsr #12
	mul	r0, r3, r0
	mov	r0, r0, lsr #12
	bx	lr
	.size	fpexp8, .-fpexp8
	.align	2
	.global	decode
	.type	decode, %function
decode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, r0, asl #5
	bl	fppw2exp
	bl	fpexp8
	add	r0, r0, #267386880
	add	r0, r0, #1044480
	mov	r0, r0, asl #4
	mov	r0, r0, lsr #12
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	decode, .-decode
	.global	__aeabi_ui2d
	.global	__aeabi_dmul
	.align	2
	.global	test
	.type	test, %function
test:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r0, r1, r2, r4, r5, r6, r7, lr}
	mov	r1, r0
	mov	r4, r0
	ldr	r0, .L33
	bl	printf
	mov	r0, r4
	bl	encode
	ldr	r7, .L33+4
	mov	r5, r0
	mov	r0, r7
	bl	puts
	mov	r0, r5
	bl	decode
	mov	r6, r0
	mov	r0, r7
	bl	puts
	mov	r1, r5
	ldr	r0, .L33+8
	bl	printf
	mov	r1, r6
	ldr	r0, .L33+12
	bl	printf
	mov	r2, r6
	mov	r1, r4
	ldr	r0, .L33+16
	bl	printf
	mov	r0, r4
	bl	__aeabi_ui2d
	mov	r2, #0
	mov	r3, #1056964608
	bl	__aeabi_dmul
	mov	r4, r0
	mov	r0, r6
	mov	r5, r1
	bl	__aeabi_ui2d
	mov	r2, #0
	ldr	r3, .L33+20
	bl	__aeabi_dmul
	mov	r2, r4
	stmia	sp, {r0-r1}
	mov	r3, r5
	ldr	r0, .L33+24
	bl	printf
	ldr	r0, .L33+28
	bl	puts
	ldmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	1060110336
	.word	.LC5
	.word	.LC6
	.size	test, .-test
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L37
	ldr	r5, .L37+4
	mov	r0, r4
	bl	puts
	ldr	r0, .L37+8
	bl	puts
	mov	r0, r5
	bl	puts
	ldr	r0, .L37+12
	bl	test
	mov	r0, #256
	bl	test
	mov	r0, r4
	bl	puts
	ldr	r0, .L37+16
	bl	puts
	mov	r0, r5
	bl	puts
	mov	r0, #0
	bl	test
	ldr	r0, .L37+20
	bl	test
	ldr	r0, .L37+24
	bl	test
	ldr	r0, .L37+28
	bl	test
	ldr	r0, .L37+32
	bl	test
	mov	r0, #16384
	bl	test
	ldr	r0, .L37+36
	bl	test
	ldr	r0, .L37+40
	bl	test
	ldr	r0, .L37+44
	bl	test
	ldr	r0, .L37+48
	bl	test
	ldr	r0, .L37+52
	bl	test
	mov	r0, #32768
	bl	test
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LC7
	.word	.LC9
	.word	.LC8
	.word	4045
	.word	.LC10
	.word	3277
	.word	6554
	.word	9830
	.word	13107
	.word	19661
	.word	22938
	.word	26214
	.word	29491
	.word	32767
	.size	main, .-main
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"==== SAMPLE: %x \012\000"
.LC1:
	.ascii	"------------\000"
.LC2:
	.ascii	"Encoded Sample: %x \012\000"
.LC3:
	.ascii	"Decoded Sample: %x \012\000"
.LC4:
	.ascii	"Match??   %x == %x\012\000"
.LC5:
	.ascii	"decimal:  %f == %f\012\000"
.LC6:
	.ascii	"==~~~~~~~~~~~~~~~~~~~==\012\000"
.LC7:
	.ascii	"==============\000"
.LC8:
	.ascii	"Sanity Checks:\000"
.LC9:
	.ascii	"==============\012\000"
.LC10:
	.ascii	"Tests:\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
