	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
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
	addcc	r3, r0, #2080768
	addcc	r3, r3, #8192
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
	addcc	r3, r0, #8323072
	addcc	r3, r3, #32768
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
	addcc	r3, r0, #33292288
	addcc	r3, r3, #131072
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
	addcc	r3, r0, #133169152
	addcc	r3, r3, #524288
	movcc	r3, r3, asl #5
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #28672
	bxcc	lr
.L2:
	mvn	r0, #0
	bx	lr
	.size	fppwlog2, .-fppwlog2
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
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #3936
	addcc	r0, r0, #13
	bxcc	lr
	cmp	r0, #3072
	movcc	r3, r0, asl #6
	subcc	r3, r3, r0, asl #2
	addcc	r3, r3, r0
	movcc	r2, r3, asl #3
	addcc	r3, r3, r2
	movcc	r3, r3, asl #3
	rsbcc	r3, r0, r3
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #3584
	addcc	r0, r0, #12
	bxcc	lr
	cmp	r0, #4096
	movcc	r3, r0, asl #3
	movcc	r2, r0, asl #9
	addcc	r3, r3, r2
	addcc	r3, r3, r0
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	movcc	r3, r3, asl #1
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #2976
	addcc	r0, r0, #6
	bxcc	lr
	cmp	r0, #5120
	movcc	r3, r0, asl #6
	subcc	r3, r3, r0, asl #4
	movcc	r2, r3, asl #7
	addcc	r3, r3, r2
	addcc	r3, r3, r0
	movcc	r3, r3, lsr #12
	addcc	r0, r3, #1664
	addcc	r0, r0, #7
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
	movcc	r3, r3, lsr #12
	subcc	r0, r3, #1584
	subcc	r0, r0, #5
	bxcc	lr
	cmp	r0, #8192
	mvncs	r0, #0
	bxcs	lr
	mov	r2, r0, asl #9
	mov	r3, r0, asl #3
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r3, r3, lsr #12
	sub	r0, r3, #4416
	sub	r0, r0, #40
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
	mul	r2, r0, r3
	mov	r2, r2, lsr #12
	mul	r3, r0, r2
	mov	r3, r3, lsr #12
	mul	r2, r0, r3
	mov	r2, r2, lsr #12
	mul	r3, r0, r2
	mov	r3, r3, lsr #12
	mul	r2, r0, r3
	mov	r2, r2, lsr #12
	mul	r0, r2, r0
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
	@ link register save eliminated.
	mov	r1, r0, asl #5
	cmp	r1, #1024
	movcc	r3, r0, asl #10
	subcc	r3, r3, r0, asl #8
	movcc	r2, r3, asl #7
	addcc	r3, r3, r2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #4096
	bcc	.L28
	cmp	r1, #2048
	movcc	r3, r0, asl #10
	subcc	r3, r3, r0, asl #8
	rsbcc	r3, r1, r3
	movcc	r3, r3, asl #5
	addcc	r3, r3, r1
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #3936
	addcc	r1, r1, #13
	bcc	.L28
	cmp	r1, #3072
	movcc	r3, r0, asl #11
	subcc	r3, r3, r0, asl #7
	addcc	r3, r3, r1
	movcc	r2, r3, asl #3
	addcc	r3, r3, r2
	movcc	r3, r3, asl #3
	rsbcc	r3, r1, r3
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #3584
	addcc	r1, r1, #12
	bcc	.L28
	cmp	r1, #4096
	movcc	r2, r0, asl #8
	movcc	r3, r0, asl #14
	addcc	r2, r2, r3
	addcc	r2, r2, r1
	movcc	r3, r2, asl #2
	addcc	r2, r2, r3
	movcc	r2, r2, asl #1
	movcc	r2, r2, lsr #12
	addcc	r1, r2, #2976
	addcc	r1, r1, #6
	bcc	.L28
	cmp	r1, #5120
	movcc	r3, r0, asl #11
	subcc	r3, r3, r0, asl #9
	movcc	r2, r3, asl #7
	addcc	r3, r3, r2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #1664
	addcc	r1, r1, #7
	bcc	.L28
	cmp	r1, #6144
	movcc	r3, r0, asl #10
	subcc	r3, r3, r0, asl #8
	rsbcc	r3, r1, r3
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	movcc	r3, r3, asl #2
	addcc	r3, r3, r1
	movcc	r3, r3, asl #2
	rsbcc	r3, r1, r3
	movcc	r3, r3, asl #2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #524
	bcc	.L28
	cmp	r1, #7168
	movcc	r3, r0, asl #11
	subcc	r3, r3, r0, asl #7
	addcc	r3, r3, r1
	movcc	r2, r3, asl #3
	addcc	r3, r3, r2
	movcc	r3, r3, asl #3
	rsbcc	r3, r1, r3
	movcc	r3, r3, asl #1
	movcc	r3, r3, lsr #12
	subcc	r1, r3, #1584
	subcc	r1, r1, #5
	bcc	.L28
	cmp	r1, #8192
	mvncs	r1, #0
	bcs	.L28
	mov	r3, r0, asl #14
	mov	r2, r0, asl #8
	add	r2, r2, r3
	add	r2, r2, r1
	mov	r3, r2, asl #2
	add	r2, r2, r3
	mov	r2, r2, asl #2
	mov	r2, r2, lsr #12
	sub	r1, r2, #4416
	sub	r1, r1, #40
.L28:
	mul	r3, r1, r1
	mov	r3, r3, lsr #12
	mul	r2, r1, r3
	mov	r2, r2, lsr #12
	mul	r3, r1, r2
	mov	r3, r3, lsr #12
	mul	r2, r1, r3
	mov	r2, r2, lsr #12
	mul	r3, r1, r2
	mov	r3, r3, lsr #12
	mul	r2, r1, r3
	mov	r2, r2, lsr #12
	mul	r0, r1, r2
	mov	r0, r0, lsr #12
	add	r0, r0, #267386880
	add	r0, r0, #1044480
	mov	r0, r0, asl #4
	mov	r0, r0, lsr #12
	bx	lr
	.size	decode, .-decode
	.align	2
	.global	encode
	.type	encode, %function
encode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0, asl #8
	rsb	r3, r0, r3
	mov	r2, r3, lsr #3
	add	r3, r2, #4096
	cmp	r3, #8192
	movcc	r3, r2, asl #9
	movcc	r0, r3, lsr #17
	bxcc	lr
	cmp	r3, #16384
	addcc	r3, r2, #2080768
	addcc	r3, r3, #12288
	movcc	r3, r3, asl #11
	movcc	r3, r3, lsr #12
	addcc	r3, r3, #4096
	movcc	r3, r3, asl #9
	movcc	r0, r3, lsr #17
	bxcc	lr
	mov	r0, #32512
	add	r0, r0, #255
	cmp	r3, r0
	addls	r3, r3, #4177920
	movls	r3, r3, asl #10
	movls	r3, r3, lsr #12
	addls	r3, r3, #8192
	movls	r3, r3, asl #9
	movls	r0, r3, lsr #17
	bxls	lr
	cmp	r3, #65536
	addcc	r3, r2, #8323072
	addcc	r3, r3, #36864
	movcc	r3, r3, asl #9
	movcc	r3, r3, lsr #12
	addcc	r3, r3, #12288
	movcc	r3, r3, asl #9
	movcc	r0, r3, lsr #17
	bxcc	lr
	cmp	r3, #131072
	addcc	r3, r3, #16711680
	movcc	r3, r3, asl #8
	movcc	r3, r3, lsr #12
	addcc	r3, r3, #16384
	movcc	r3, r3, asl #9
	movcc	r0, r3, lsr #17
	bxcc	lr
	cmp	r3, #262144
	addcc	r3, r2, #33292288
	addcc	r3, r3, #135168
	movcc	r3, r3, asl #7
	movcc	r3, r3, lsr #12
	addcc	r3, r3, #20480
	movcc	r3, r3, asl #9
	movcc	r0, r3, lsr #17
	bxcc	lr
	cmp	r3, #524288
	addcc	r3, r3, #66846720
	movcc	r3, r3, asl #6
	movcc	r3, r3, lsr #12
	addcc	r3, r3, #24576
	movcc	r3, r3, asl #9
	movcc	r0, r3, lsr #17
	bxcc	lr
	cmp	r3, #1048576
	bxcs	lr
	add	r3, r2, #133169152
	add	r3, r3, #528384
	mov	r3, r3, asl #5
	mov	r3, r3, lsr #12
	add	r3, r3, #28672
	mov	r3, r3, asl #9
	mov	r0, r3, lsr #17
	bx	lr
	.size	encode, .-encode
	.global	__aeabi_ui2d
	.global	__aeabi_dmul
	.align	2
	.global	test
	.type	test, %function
test:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, r0
	mov	r6, r0
	sub	sp, sp, #8
	ldr	r0, .L68
	bl	printf
	mov	r3, r6, asl #8
	rsb	r3, r6, r3
	mov	r2, r3, lsr #3
	add	r3, r2, #4096
	cmp	r3, #8192
	bcc	.L49
	cmp	r3, #16384
	addcc	r3, r2, #2080768
	addcc	r3, r3, #12288
	movcc	r3, r3, asl #11
	movcc	r3, r3, lsr #12
	addcc	r2, r3, #4096
	bcc	.L49
	mov	r4, #32512
	add	r4, r4, #255
	cmp	r3, r4
	addls	r3, r3, #4177920
	movls	r3, r3, asl #10
	movls	r3, r3, lsr #12
	addls	r2, r3, #8192
	bls	.L49
	cmp	r3, #65536
	addcc	r3, r2, #8323072
	addcc	r3, r3, #36864
	movcc	r3, r3, asl #9
	movcc	r3, r3, lsr #12
	addcc	r2, r3, #12288
	bcc	.L49
	cmp	r3, #131072
	addcc	r3, r3, #16711680
	movcc	r3, r3, asl #8
	movcc	r3, r3, lsr #12
	addcc	r2, r3, #16384
	bcc	.L49
	cmp	r3, #262144
	addcc	r3, r2, #33292288
	addcc	r3, r3, #135168
	movcc	r3, r3, asl #7
	movcc	r3, r3, lsr #12
	addcc	r2, r3, #20480
	bcc	.L49
	cmp	r3, #524288
	addcc	r3, r3, #66846720
	movcc	r3, r3, asl #6
	movcc	r3, r3, lsr #12
	addcc	r2, r3, #24576
	bcc	.L49
	cmp	r3, #1048576
	bcs	.L56
	add	r3, r2, #133169152
	add	r3, r3, #528384
	mov	r3, r3, asl #5
	mov	r3, r3, lsr #12
	add	r2, r3, #28672
.L49:
	mov	r3, r2, asl #9
	ldr	r0, .L68+4
	mov	r5, r3, lsr #17
	bl	puts
	mov	r1, r5, asl #5
	cmp	r1, #1024
	movcc	r3, r5, asl #10
	subcc	r3, r3, r5, asl #8
	movcc	r2, r3, asl #7
	addcc	r3, r3, r2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #4096
	bcs	.L67
.L58:
	mul	r3, r1, r1
	mov	r3, r3, lsr #12
	mul	r2, r1, r3
	mov	r2, r2, lsr #12
	mul	r3, r1, r2
	mov	r3, r3, lsr #12
	mul	r2, r1, r3
	mov	r2, r2, lsr #12
	mul	r3, r1, r2
	mov	r3, r3, lsr #12
	mul	r2, r1, r3
	mov	r2, r2, lsr #12
	mul	r4, r1, r2
	mov	r4, r4, lsr #12
	add	r4, r4, #267386880
	add	r4, r4, #1044480
	mov	r4, r4, asl #4
	ldr	r0, .L68+4
	bl	puts
	mov	r4, r4, lsr #12
	mov	r1, r5
	ldr	r0, .L68+8
	bl	printf
	mov	r1, r4
	ldr	r0, .L68+12
	bl	printf
	mov	r2, r4
	mov	r1, r6
	ldr	r0, .L68+16
	bl	printf
	mov	r0, r6
	bl	__aeabi_ui2d
	mov	r2, #0
	mov	r3, #1056964608
	bl	__aeabi_dmul
	mov	r5, r0
	mov	r0, r4
	mov	r6, r1
	bl	__aeabi_ui2d
	mov	r3, #1056964608
	mov	r2, #0
	add	r3, r3, #3145728
	bl	__aeabi_dmul
	mov	r2, r5
	stmia	sp, {r0-r1}
	mov	r3, r6
	ldr	r0, .L68+20
	bl	printf
	ldr	r0, .L68+24
	bl	puts
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L67:
	cmp	r1, #2048
	movcc	r3, r5, asl #10
	subcc	r3, r3, r5, asl #8
	rsbcc	r3, r1, r3
	movcc	r3, r3, asl #5
	addcc	r3, r3, r1
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #3936
	addcc	r1, r1, #13
	bcc	.L58
	cmp	r1, #3072
	movcc	r3, r5, asl #11
	subcc	r3, r3, r5, asl #7
	addcc	r3, r3, r1
	movcc	r2, r3, asl #3
	addcc	r3, r3, r2
	movcc	r3, r3, asl #3
	rsbcc	r3, r1, r3
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #3584
	addcc	r1, r1, #12
	bcc	.L58
	cmp	r1, #4096
	movcc	r3, r5, asl #8
	movcc	r2, r5, asl #14
	addcc	r3, r3, r2
	addcc	r3, r3, r1
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	movcc	r3, r3, asl #1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #2976
	addcc	r1, r1, #6
	bcc	.L58
	cmp	r1, #5120
	movcc	r3, r5, asl #11
	subcc	r3, r3, r5, asl #9
	movcc	r2, r3, asl #7
	addcc	r3, r3, r2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #1664
	addcc	r1, r1, #7
	bcc	.L58
	b	.L62
.L56:
	ldr	r0, .L68+4
	bl	puts
	mov	r1, #1044480
	mov	r5, r4
	add	r1, r1, #4064
.L62:
	cmp	r1, #6144
	movcc	r3, r1, asl #5
	subcc	r3, r3, r1, asl #3
	rsbcc	r3, r1, r3
	movcc	r2, r3, asl #2
	addcc	r3, r3, r2
	movcc	r3, r3, asl #2
	addcc	r3, r3, r1
	movcc	r3, r3, asl #2
	rsbcc	r3, r1, r3
	movcc	r3, r3, asl #2
	addcc	r3, r3, r1
	movcc	r3, r3, lsr #12
	addcc	r1, r3, #524
	bcc	.L58
	cmp	r1, #7168
	movcc	r3, r1, asl #6
	subcc	r3, r3, r1, asl #2
	addcc	r3, r3, r1
	movcc	r2, r3, asl #3
	addcc	r3, r3, r2
	movcc	r3, r3, asl #3
	rsbcc	r3, r1, r3
	movcc	r3, r3, asl #1
	movcc	r3, r3, lsr #12
	subcc	r1, r3, #1584
	subcc	r1, r1, #5
	bcc	.L58
	cmp	r1, #8192
	mvncs	r1, #0
	bcs	.L58
	mov	r2, r1, asl #9
	mov	r3, r1, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r3, r3, lsr #12
	sub	r1, r3, #4416
	sub	r1, r1, #40
	b	.L58
.L69:
	.align	2
.L68:
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
	ldr	r4, .L72
	ldr	r5, .L72+4
	mov	r0, r4
	bl	puts
	ldr	r0, .L72+8
	bl	puts
	mov	r0, r5
	bl	puts
	mov	r0, #4032
	add	r0, r0, #13
	bl	test
	mov	r0, #256
	bl	test
	mov	r0, r4
	bl	puts
	ldr	r0, .L72+12
	bl	puts
	mov	r0, r5
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
.L73:
	.align	2
.L72:
	.word	.LC7
	.word	.LC9
	.word	.LC8
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
