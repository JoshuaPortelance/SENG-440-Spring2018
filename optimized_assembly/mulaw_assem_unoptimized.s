	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"mulaw_clean.c"
	.text
	.align	2
	.global	fppwlog2
	.type	fppwlog2, %function
fppwlog2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-12]
	mov	r3, #4080
	add	r3, r3, #15
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L2
	mvn	r3, #0
	str	r3, [fp, #-8]
	b	.L3
.L2:
	mov	r3, #8128
	add	r3, r3, #63
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L4
	ldr	r3, [fp, #-12]
	sub	r3, r3, #4096
	str	r3, [fp, #-8]
	b	.L3
.L4:
	mov	r3, #16320
	add	r3, r3, #63
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L5
	ldr	r2, [fp, #-12]
	add	r3, r2, #2080768
	add	r3, r3, #8192
	mov	r3, r3, asl #11
	mov	r3, r3, lsr #12
	add	r3, r3, #4096
	str	r3, [fp, #-8]
	b	.L3
.L5:
	mov	r3, #32512
	add	r3, r3, #255
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L6
	ldr	r2, [fp, #-12]
	add	r3, r2, #4177920
	mov	r3, r3, asl #10
	mov	r3, r3, lsr #12
	add	r3, r3, #8192
	str	r3, [fp, #-8]
	b	.L3
.L6:
	mov	r3, #65536
	sub	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L7
	ldr	r2, [fp, #-12]
	add	r3, r2, #8323072
	add	r3, r3, #32768
	mov	r3, r3, asl #9
	mov	r3, r3, lsr #12
	add	r3, r3, #12288
	str	r3, [fp, #-8]
	b	.L3
.L7:
	mov	r3, #131072
	sub	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L8
	ldr	r2, [fp, #-12]
	add	r3, r2, #16711680
	mov	r3, r3, asl #8
	mov	r3, r3, lsr #12
	add	r3, r3, #16384
	str	r3, [fp, #-8]
	b	.L3
.L8:
	mov	r3, #262144
	sub	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L9
	ldr	r2, [fp, #-12]
	add	r3, r2, #33292288
	add	r3, r3, #131072
	mov	r3, r3, asl #7
	mov	r3, r3, lsr #12
	add	r3, r3, #20480
	str	r3, [fp, #-8]
	b	.L3
.L9:
	mov	r3, #524288
	sub	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L10
	ldr	r2, [fp, #-12]
	add	r3, r2, #66846720
	mov	r3, r3, asl #6
	mov	r3, r3, lsr #12
	add	r3, r3, #24576
	str	r3, [fp, #-8]
	b	.L3
.L10:
	mov	r3, #1048576
	sub	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L11
	ldr	r2, [fp, #-12]
	add	r3, r2, #133169152
	add	r3, r3, #524288
	mov	r3, r3, asl #5
	mov	r3, r3, lsr #12
	add	r3, r3, #28672
	str	r3, [fp, #-8]
	b	.L3
.L11:
	mvn	r3, #0
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	fppwlog2, .-fppwlog2
	.align	2
	.global	encode
	.type	encode, %function
encode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #8
	rsb	r3, r2, r3
	mov	r3, r3, lsr #3
	add	r3, r3, #4096
	mov	r0, r3
	bl	fppwlog2
	mov	r3, r0
	mov	r3, r3, asl #9
	mov	r3, r3, lsr #17
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	encode, .-encode
	.align	2
	.global	fppw2exp
	.type	fppw2exp, %function
fppw2exp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-12]
	mov	r3, #1020
	add	r3, r3, #3
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L16
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #7
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r3, r3, lsr #12
	add	r3, r3, #4096
	str	r3, [fp, #-8]
	b	.L17
.L16:
	mov	r3, #2032
	add	r3, r3, #15
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L18
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	ldr	r2, [fp, #-12]
	rsb	r3, r2, r3
	mov	r3, r3, asl #5
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r3, r3, lsr #12
	add	r3, r3, #3936
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #13
	str	r3, [fp, #-8]
	b	.L17
.L18:
	mov	r3, #3056
	add	r3, r3, #15
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L19
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-12]
	rsb	r3, r2, r3
	mov	r3, r3, lsr #12
	add	r3, r3, #3584
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	str	r3, [fp, #-8]
	b	.L17
.L19:
	mov	r3, #4080
	add	r3, r3, #15
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L20
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	mov	r2, r3, asl #6
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r3, r3, lsr #12
	add	r3, r3, #2976
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #6
	str	r3, [fp, #-8]
	b	.L17
.L20:
	mov	r3, #5056
	add	r3, r3, #63
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L21
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #7
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r3, r3, lsr #12
	add	r3, r3, #1664
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #7
	str	r3, [fp, #-8]
	b	.L17
.L21:
	mov	r3, #6080
	add	r3, r3, #63
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L22
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	ldr	r2, [fp, #-12]
	rsb	r3, r2, r3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-12]
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r3, r3, lsr #12
	add	r3, r3, #524
	str	r3, [fp, #-8]
	b	.L17
.L22:
	mov	r3, #7104
	add	r3, r3, #63
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L23
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-12]
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	mov	r3, r3, lsr #12
	sub	r3, r3, #1584
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #5
	str	r3, [fp, #-8]
	b	.L17
.L23:
	mov	r3, #8128
	add	r3, r3, #63
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L24
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	mov	r2, r3, asl #6
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r3, r3, lsr #12
	sub	r3, r3, #4416
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #40
	str	r3, [fp, #-8]
	b	.L17
.L24:
	mvn	r2, #0
	str	r2, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	fppw2exp, .-fppw2exp
	.align	2
	.global	fpexp8
	.type	fpexp8, %function
fpexp8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	mov	r3, r0
	mul	r2, r3, r3
	mov	r2, r2, lsr #12
	mul	r2, r3, r2
	mov	r2, r2, lsr #12
	mul	r2, r3, r2
	mov	r2, r2, lsr #12
	mul	r2, r3, r2
	mov	r2, r2, lsr #12
	mul	r2, r3, r2
	mov	r2, r2, lsr #12
	mul	r2, r3, r2
	mov	r2, r2, lsr #12
	mul	r3, r2, r3
	mov	r3, r3, lsr #12
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	fpexp8, .-fpexp8
	.align	2
	.global	decode
	.type	decode, %function
decode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #5
	mov	r0, r3
	bl	fppw2exp
	mov	r3, r0
	mov	r0, r3
	bl	fpexp8
	mov	r3, r0
	add	r3, r3, #267386880
	add	r3, r3, #1044480
	mov	r3, r3, asl #4
	mov	r3, r3, lsr #12
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	decode, .-decode
	.section	.rodata
	.align	2
.LC0:
	.ascii	"==== SAMPLE: %x \012\000"
	.align	2
.LC1:
	.ascii	"------------\000"
	.align	2
.LC2:
	.ascii	"Encoded Sample: %x \012\000"
	.align	2
.LC3:
	.ascii	"Decoded Sample: %x \012\000"
	.align	2
.LC4:
	.ascii	"Match??   %x == %x\012\000"
	.global	__aeabi_ui2d
	.global	__aeabi_ddiv
	.align	2
.LC5:
	.ascii	"decimal:  %f == %f\012\000"
	.align	2
.LC6:
	.ascii	"==~~~~~~~~~~~~~~~~~~~==\012\000"
	.text
	.align	2
	.global	test
	.type	test, %function
test:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #28
	str	r0, [fp, #-40]
	ldr	r0, .L32
	ldr	r1, [fp, #-40]
	bl	printf
	ldr	r0, [fp, #-40]
	bl	encode
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r0, .L32+4
	bl	puts
	ldr	r0, [fp, #-36]
	bl	decode
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r0, .L32+4
	bl	puts
	ldr	r0, .L32+8
	ldr	r1, [fp, #-36]
	bl	printf
	ldr	r0, .L32+12
	ldr	r1, [fp, #-32]
	bl	printf
	ldr	r0, .L32+16
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-32]
	bl	printf
	ldr	r0, [fp, #-40]
	bl	__aeabi_ui2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #14680064
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	mov	r7, r3
	mov	r8, r4
	ldr	r0, [fp, #-32]
	bl	__aeabi_ui2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #11534336
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	stmia	sp, {r3-r4}
	ldr	r0, .L32+20
	mov	r2, r7
	mov	r3, r8
	bl	printf
	ldr	r0, .L32+24
	bl	puts
	sub	sp, fp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	test, .-test
	.section	.rodata
	.align	2
.LC7:
	.ascii	"==============\000"
	.align	2
.LC8:
	.ascii	"Sanity Checks:\000"
	.align	2
.LC9:
	.ascii	"==============\012\000"
	.align	2
.LC10:
	.ascii	"Tests:\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L36
	bl	puts
	ldr	r0, .L36+4
	bl	puts
	ldr	r0, .L36+8
	bl	puts
	mov	r3, #4032
	add	r3, r3, #13
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #256
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	ldr	r0, .L36
	bl	puts
	ldr	r0, .L36+12
	bl	puts
	ldr	r0, .L36+8
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #3264
	add	r3, r3, #13
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #6528
	add	r3, r3, #26
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #9792
	add	r3, r3, #38
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #13056
	add	r3, r3, #51
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #16384
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #19456
	add	r3, r3, #205
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #22784
	add	r3, r3, #154
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #26112
	add	r3, r3, #102
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #29440
	add	r3, r3, #51
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #32512
	add	r3, r3, #255
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #32768
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
