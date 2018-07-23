	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
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
	movcc	r3, #2080768
	addcc	r3, r3, #8192
	addcc	r3, r0, r3
	movcc	r3, r3, asl #11
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #4096
	bxcc	lr
	cmp	r0, #32768
	addcc	r3, r0, #4177920
	movcc	r3, r3, asl #10
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #8192
	bxcc	lr
	cmp	r0, #65536
	movcc	r3, #8323072
	addcc	r3, r3, #32768
	addcc	r3, r0, r3
	movcc	r3, r3, asl #9
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #12288
	bxcc	lr
	cmp	r0, #131072
	addcc	r3, r0, #16711680
	movcc	r3, r3, asl #8
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #16384
	bxcc	lr
	cmp	r0, #262144
	movcc	r3, #33292288
	addcc	r3, r3, #131072
	addcc	r3, r0, r3
	movcc	r3, r3, asl #7
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #20480
	bxcc	lr
	cmp	r0, #524288
	addcc	r3, r0, #66846720
	movcc	r3, r3, asl #6
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #24576
	bxcc	lr
	cmp	r0, #1048576
	movcc	r3, #133169152
	addcc	r3, r3, #524288
	addcc	r3, r0, r3
	movcc	r3, r3, asl #5
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #28672
	bxcc	lr
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
	stmfd	sp!, {r4, lr}
	mov	r3, r0, asl #8
	rsb	r3, r0, r3
	mov	r3, r3, lsr #3
	add	r0, r3, #4096
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
	movcc	r3, r0, asl #5
	subcc	r3, r3, r0, asl #3
	movcc	r2, r3, asl #7
	addcc	r3, r3, r2
	addcc	r3, r3, r0
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #4096
	bxcc	lr
	cmp	r0, #2048
	movcc	r3, r0, asl #5
	subcc	r3, r3, r0, asl #3
	rsbcc	r3, r0, r3
	movcc	r3, r3, asl #5
	addcc	r3, r3, r0
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	addcc	r3, r3, r0
	movcc	r2, #3936
	addcc	r2, r2, #13
	addcc	r0, r2, r3, lsr #12
	bxcc	lr
	cmp	r0, #3072
	movcc	r3, r0, asl #6
	subcc	r3, r3, r0, asl #2
	addcc	r3, r3, r0
	movcc	r2, r3, asl #3
	addcc	r3, r3, r2
	movcc	r3, r3, asl #3
	rsbcc	r3, r0, r3
	movcc	r2, #3584
	addcc	r2, r2, #12
	addcc	r0, r2, r3, lsr #12
	bxcc	lr
	cmp	r0, #4096
	movcc	r2, r0, asl #3
	movcc	r3, r0, asl #9
	addcc	r2, r2, r3
	addcc	r2, r2, r0
	movcc	r3, r2, asl #2
	addcc	r2, r2, r3
	movcc	r2, r2, asl #1
	movcc	r3, #2976
	addcc	r3, r3, #6
	addcc	r0, r3, r2, lsr #12
	bxcc	lr
	cmp	r0, #5120
	movcc	r3, r0, asl #6
	subcc	r3, r3, r0, asl #4
	movcc	r2, r3, asl #7
	addcc	r3, r3, r2
	addcc	r3, r3, r0
	movcc	r2, #1664
	addcc	r2, r2, #7
	addcc	r0, r2, r3, lsr #12
	bxcc	lr
	cmp	r0, #6144
	movcc	r3, r0, asl #5
	subcc	r3, r3, r0, asl #3
	rsbcc	r3, r0, r3
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	movcc	r3, r3, asl #2
	addcc	r3, r3, r0
	movcc	r3, r3, asl #2
	rsbcc	r3, r0, r3
	movcc	r3, r3, asl #2
	addcc	r3, r3, r0
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #524
	bxcc	lr
	cmp	r0, #7168
	movcc	r3, r0, asl #6
	subcc	r3, r3, r0, asl #2
	addcc	r3, r3, r0
	movcc	r2, r3, asl #3
	addcc	r3, r3, r2
	movcc	r3, r3, asl #3
	rsbcc	r3, r0, r3
	movcc	r3, r3, asl #1
	mvncc	r2, #1584
	subcc	r2, r2, #4
	addcc	r0, r2, r3, lsr #12
	bxcc	lr
	cmp	r0, #8192
	mvncs	r0, #0
	bxcs	lr
	mov	r2, r0, asl #3
	mov	r3, r0, asl #9
	add	r2, r2, r3
	add	r2, r2, r0
	mov	r3, r2, asl #2
	add	r2, r2, r3
	mov	r2, r2, asl #2
	mvn	r3, #4416
	sub	r3, r3, #39
	add	r0, r3, r2, lsr #12
	bx	lr
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
	mov	r0, r0, asl #4
	sub	r0, r0, #65536
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
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	mov	r5, r0
	ldr	r0, .L31
	mov	r1, r5
	bl	printf
	mov	r0, r5
	bl	encode
	mov	r7, r0
	ldr	r4, .L31+4
	mov	r0, r4
	bl	puts
	mov	r0, r7
	bl	decode
	mov	r6, r0
	mov	r0, r4
	bl	puts
	ldr	r0, .L31+8
	mov	r1, r7
	bl	printf
	ldr	r0, .L31+12
	mov	r1, r6
	bl	printf
	ldr	r0, .L31+16
	mov	r1, r5
	mov	r2, r6
	bl	printf
	mov	r0, r5
	bl	__aeabi_ui2d
	mov	r2, #0
	mov	r3, #1056964608
	bl	__aeabi_dmul
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	bl	__aeabi_ui2d
	mov	r2, #0
	mov	r3, #1056964608
	add	r3, r3, #3145728
	bl	__aeabi_dmul
	stmia	sp, {r0-r1}
	ldr	r0, .L31+20
	mov	r2, r4
	mov	r3, r5
	bl	printf
	ldr	r0, .L31+24
	bl	puts
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
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
	ldr	r5, .L35
	mov	r0, r5
	bl	puts
	ldr	r0, .L35+4
	bl	puts
	ldr	r4, .L35+8
	mov	r0, r4
	bl	puts
	mov	r0, #4032
	add	r0, r0, #13
	bl	test
	mov	r0, #256
	bl	test
	mov	r0, r5
	bl	puts
	ldr	r0, .L35+12
	bl	puts
	mov	r0, r4
	bl	puts
	mov	r0, #0
	bl	test
	mov	r0, #3264
	add	r0, r0, #13
	bl	test
	mov	r0, #6528
	add	r0, r0, #26
	bl	test
	mov	r0, #9792
	add	r0, r0, #38
	bl	test
	mov	r0, #13056
	add	r0, r0, #51
	bl	test
	mov	r0, #16384
	bl	test
	mov	r0, #19456
	add	r0, r0, #205
	bl	test
	mov	r0, #22784
	add	r0, r0, #154
	bl	test
	mov	r0, #26112
	add	r0, r0, #102
	bl	test
	mov	r0, #29440
	add	r0, r0, #51
	bl	test
	mov	r0, #32512
	add	r0, r0, #255
	bl	test
	mov	r0, #32768
	bl	test
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"==== SAMPLE: %x \012\000"
	.space	2
.LC1:
	.ascii	"------------\000"
	.space	3
.LC2:
	.ascii	"Encoded Sample: %x \012\000"
	.space	3
.LC3:
	.ascii	"Decoded Sample: %x \012\000"
	.space	3
.LC4:
	.ascii	"Match??   %x == %x\012\000"
.LC5:
	.ascii	"decimal:  %f == %f\012\000"
.LC6:
	.ascii	"==~~~~~~~~~~~~~~~~~~~==\012\000"
	.space	3
.LC7:
	.ascii	"==============\000"
	.space	1
.LC8:
	.ascii	"Sanity Checks:\000"
	.space	1
.LC9:
	.ascii	"==============\012\000"
.LC10:
	.ascii	"Tests:\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
