	.file	"leet_uni.cpp"
	.option nopic
	.attribute arch, "rv64i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	_ZN3CPU13get_hw_threadERy
	.type	_ZN3CPU13get_hw_threadERy, @function
_ZN3CPU13get_hw_threadERy:
.LFB0:
	.cfi_startproc
 #APP
# 8 "./533_cpu.h" 1
	mv	a5,tp
# 0 "" 2
 #NO_APP
	sd	a5,0(a0)
	ret
	.cfi_endproc
.LFE0:
	.size	_ZN3CPU13get_hw_threadERy, .-_ZN3CPU13get_hw_threadERy
	.align	2
	.globl	_ZN3CPU10get_sharedERyy
	.type	_ZN3CPU10get_sharedERyy, @function
_ZN3CPU10get_sharedERyy:
.LFB1:
	.cfi_startproc
	li	a5,16384
	slli	a1,a1,3
	add	a1,a1,a5
 #APP
# 12 "./533_cpu.h" 1
	ld	a1,0(a1)
# 0 "" 2
 #NO_APP
	sd	a1,0(a0)
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN3CPU10get_sharedERyy, .-_ZN3CPU10get_sharedERyy
	.align	2
	.globl	_ZN3CPU10set_sharedEyy
	.type	_ZN3CPU10set_sharedEyy, @function
_ZN3CPU10set_sharedEyy:
.LFB2:
	.cfi_startproc
	li	a5,16384
	slli	a1,a1,3
	add	a1,a1,a5
 #APP
# 20 "./533_cpu.h" 1
	sd	a0,0(a1)
# 0 "" 2
 #NO_APP
	ret
	.cfi_endproc
.LFE2:
	.size	_ZN3CPU10set_sharedEyy, .-_ZN3CPU10set_sharedEyy
	.align	2
	.globl	_ZN4FIFO8get_dataERyy
	.type	_ZN4FIFO8get_dataERyy, @function
_ZN4FIFO8get_dataERyy:
.LFB3:
	.cfi_startproc
	li	a5,1
	slli	a5,a5,35
	slli	a1,a1,3
	add	a1,a1,a5
 #APP
# 40 "./533_cpu.h" 1
	ld	a1,0(a1)
# 0 "" 2
 #NO_APP
	sd	a1,0(a0)
	ret
	.cfi_endproc
.LFE3:
	.size	_ZN4FIFO8get_dataERyy, .-_ZN4FIFO8get_dataERyy
	.align	2
	.globl	_ZN4FIFO8set_dataEyy
	.type	_ZN4FIFO8set_dataEyy, @function
_ZN4FIFO8set_dataEyy:
.LFB4:
	.cfi_startproc
	li	a5,1
	slli	a5,a5,35
	slli	a1,a1,3
	add	a1,a1,a5
 #APP
# 48 "./533_cpu.h" 1
	sd	a0,0(a1)
# 0 "" 2
 #NO_APP
	ret
	.cfi_endproc
.LFE4:
	.size	_ZN4FIFO8set_dataEyy, .-_ZN4FIFO8set_dataEyy
	.align	2
	.globl	_ZN4FIFO8get_ctrlERyy
	.type	_ZN4FIFO8get_ctrlERyy, @function
_ZN4FIFO8get_ctrlERyy:
.LFB5:
	.cfi_startproc
	li	a5,8388608
	addi	a5,a5,3
	slli	a5,a5,12
	slli	a1,a1,3
	add	a1,a1,a5
 #APP
# 57 "./533_cpu.h" 1
	ld	a1,0(a1)
# 0 "" 2
 #NO_APP
	sd	a1,0(a0)
	ret
	.cfi_endproc
.LFE5:
	.size	_ZN4FIFO8get_ctrlERyy, .-_ZN4FIFO8get_ctrlERyy
	.align	2
	.globl	_ZN4FIFO8set_ctrlEyy
	.type	_ZN4FIFO8set_ctrlEyy, @function
_ZN4FIFO8set_ctrlEyy:
.LFB6:
	.cfi_startproc
	li	a5,8388608
	addi	a5,a5,3
	slli	a5,a5,12
	slli	a1,a1,3
	add	a1,a1,a5
 #APP
# 65 "./533_cpu.h" 1
	sd	a0,0(a1)
# 0 "" 2
 #NO_APP
	ret
	.cfi_endproc
.LFE6:
	.size	_ZN4FIFO8set_ctrlEyy, .-_ZN4FIFO8set_ctrlEyy
	.align	2
	.globl	_ZN4FIFO8get_tailERy
	.type	_ZN4FIFO8get_tailERy, @function
_ZN4FIFO8get_tailERy:
.LFB7:
	.cfi_startproc
	li	a5,2097152
	addi	a5,a5,1
	slli	a5,a5,14
 #APP
# 73 "./533_cpu.h" 1
	ld	a5,0(a5)
# 0 "" 2
 #NO_APP
	sd	a5,0(a0)
	ret
	.cfi_endproc
.LFE7:
	.size	_ZN4FIFO8get_tailERy, .-_ZN4FIFO8get_tailERy
	.align	2
	.globl	_ZN4FIFO8set_tailEy
	.type	_ZN4FIFO8set_tailEy, @function
_ZN4FIFO8set_tailEy:
.LFB8:
	.cfi_startproc
	li	a5,2097152
	addi	a5,a5,1
	slli	a5,a5,14
 #APP
# 80 "./533_cpu.h" 1
	sd	a0,0(a5)
# 0 "" 2
 #NO_APP
	ret
	.cfi_endproc
.LFE8:
	.size	_ZN4FIFO8set_tailEy, .-_ZN4FIFO8set_tailEy
	.align	2
	.globl	_ZN4FIFO8get_headERy
	.type	_ZN4FIFO8get_headERy, @function
_ZN4FIFO8get_headERy:
.LFB9:
	.cfi_startproc
	li	a5,8388608
	addi	a5,a5,5
	slli	a5,a5,12
 #APP
# 88 "./533_cpu.h" 1
	ld	a5,0(a5)
# 0 "" 2
 #NO_APP
	sd	a5,0(a0)
	ret
	.cfi_endproc
.LFE9:
	.size	_ZN4FIFO8get_headERy, .-_ZN4FIFO8get_headERy
	.align	2
	.globl	_ZN4FIFO8set_headEy
	.type	_ZN4FIFO8set_headEy, @function
_ZN4FIFO8set_headEy:
.LFB10:
	.cfi_startproc
	li	a5,8388608
	addi	a5,a5,5
	slli	a5,a5,12
 #APP
# 95 "./533_cpu.h" 1
	sd	a0,0(a5)
# 0 "" 2
 #NO_APP
	ret
	.cfi_endproc
.LFE10:
	.size	_ZN4FIFO8set_headEy, .-_ZN4FIFO8set_headEy
	.align	2
	.globl	_ZN4FIFO8get_fullERy
	.type	_ZN4FIFO8get_fullERy, @function
_ZN4FIFO8get_fullERy:
.LFB11:
	.cfi_startproc
	li	a5,4194304
	addi	a5,a5,3
	slli	a5,a5,13
 #APP
# 103 "./533_cpu.h" 1
	ld	a5,0(a5)
# 0 "" 2
 #NO_APP
	sd	a5,0(a0)
	ret
	.cfi_endproc
.LFE11:
	.size	_ZN4FIFO8get_fullERy, .-_ZN4FIFO8get_fullERy
	.align	2
	.globl	_ZN4FIFO8set_doneEv
	.type	_ZN4FIFO8set_doneEv, @function
_ZN4FIFO8set_doneEv:
.LFB12:
	.cfi_startproc
	li	a5,8388608
	addi	a5,a5,7
	slli	a5,a5,12
 #APP
# 110 "./533_cpu.h" 1
	sd	zero,0(a5)
# 0 "" 2
 #NO_APP
	ret
	.cfi_endproc
.LFE12:
	.size	_ZN4FIFO8set_doneEv, .-_ZN4FIFO8set_doneEv
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	li	a2,8388608
	li	a0,4194304
	li	a6,2097152
	li	a5,16384
	addi	t0,a2,5
	addi	t2,a2,3
	sd	ra,88(sp)
	sd	s0,80(sp)
	addi	a0,a0,3
	addi	a6,a6,1
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	li	s0,1
	li	ra,20480
	addi	a2,a2,7
 #APP
# 8 "./533_cpu.h" 1
	mv	t5,tp
# 0 "" 2
 #NO_APP
	slli	t4,t5,3
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	sd	s5,40(sp)
	sd	s6,32(sp)
	sd	s7,24(sp)
	sd	s8,16(sp)
	sd	s9,8(sp)
	sd	s10,0(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	add	t4,t4,a5
	slli	a0,a0,13
	slli	a6,a6,14
	slli	t0,t0,12
	slli	t2,t2,12
	slli	s1,s0,35
	addi	s2,a5,128
	addi	ra,ra,-1920
	li	s3,255
	li	s4,51
	li	s5,0
	slli	a2,a2,12
.L16:
 #APP
# 103 "./533_cpu.h" 1
	ld	a4,0(a0)
# 0 "" 2
 #NO_APP
	beq	a4,zero,.L16
 #APP
# 73 "./533_cpu.h" 1
	ld	a1,0(a6)
# 0 "" 2
# 88 "./533_cpu.h" 1
	ld	a4,0(t0)
# 0 "" 2
 #NO_APP
	sub	a1,a1,a4
	bge	a1,zero,.L17
	addi	a1,a1,512
.L17:
	add	a4,t5,a4
	mv	t6,t5
	li	s9,1
	li	s6,511
	li	s7,101
	li	s8,64
.L18:
	bgtu	a1,t6,.L24
	bne	t5,zero,.L25
	addi	a3,a5,8
	addi	a1,a5,16
	addi	a7,a5,24
.L26:
 #APP
# 12 "./533_cpu.h" 1
	ld	t3,0(a3)
# 0 "" 2
# 12 "./533_cpu.h" 1
	ld	t1,0(a1)
# 0 "" 2
# 12 "./533_cpu.h" 1
	ld	a4,0(a7)
# 0 "" 2
 #NO_APP
	beq	t3,zero,.L26
	beq	t1,zero,.L26
	beq	a4,zero,.L26
 #APP
# 110 "./533_cpu.h" 1
	sd	zero,0(a2)
# 0 "" 2
# 20 "./533_cpu.h" 1
	sd	s0,0(a5)
# 0 "" 2
 #NO_APP
	addi	a1,a5,8
	addi	a7,a5,16
	addi	t1,a5,24
.L29:
 #APP
# 12 "./533_cpu.h" 1
	ld	t3,0(a1)
# 0 "" 2
# 12 "./533_cpu.h" 1
	ld	a4,0(a7)
# 0 "" 2
# 12 "./533_cpu.h" 1
	ld	a3,0(t1)
# 0 "" 2
 #NO_APP
	bne	t3,zero,.L29
	or	a4,a4,a3
	bne	a4,zero,.L29
 #APP
# 20 "./533_cpu.h" 1
	sd	a4,0(a5)
# 0 "" 2
 #NO_APP
	j	.L16
.L24:
	mv	a3,a4
	bleu	a4,s6,.L19
	addi	a3,a4,-512
.L19:
	slli	a3,a3,3
	add	t1,a3,t2
 #APP
# 57 "./533_cpu.h" 1
	ld	t1,0(t1)
# 0 "" 2
 #NO_APP
	add	a3,a3,s1
 #APP
# 40 "./533_cpu.h" 1
	ld	a7,0(a3)
# 0 "" 2
 #NO_APP
	slli	t3,t6,3
	add	s10,t3,s2
 #APP
# 20 "./533_cpu.h" 1
	sd	t1,0(s10)
# 0 "" 2
 #NO_APP
	add	t3,t3,ra
 #APP
# 20 "./533_cpu.h" 1
	sd	a7,0(t3)
# 0 "" 2
 #NO_APP
	beq	s9,zero,.L20
	bne	t1,zero,.L21
.L20:
 #APP
# 20 "./533_cpu.h" 1
	sd	t1,0(s10)
# 0 "" 2
 #NO_APP
	li	t1,0
.L23:
	srl	t3,a7,t1
	andi	t3,t3,255
	sext.w	s9,t1
	bne	t3,s7,.L22
	sll	t3,s3,s9
	not	t3,t3
	and	a7,t3,a7
	sll	s9,s4,s9
	add	a7,a7,s9
.L22:
	addi	t1,t1,8
	bne	t1,s8,.L23
 #APP
# 48 "./533_cpu.h" 1
	sd	a7,0(a3)
# 0 "" 2
 #NO_APP
	li	s9,0
.L21:
	addi	t6,t6,4
	addi	a4,a4,4
	j	.L18
.L25:
 #APP
# 20 "./533_cpu.h" 1
	sd	s0,0(t4)
# 0 "" 2
 #NO_APP
.L32:
 #APP
# 12 "./533_cpu.h" 1
	ld	a4,0(a5)
# 0 "" 2
 #NO_APP
	beq	a4,zero,.L32
 #APP
# 20 "./533_cpu.h" 1
	sd	s5,0(t4)
# 0 "" 2
 #NO_APP
.L33:
 #APP
# 12 "./533_cpu.h" 1
	ld	a4,0(a5)
# 0 "" 2
 #NO_APP
	bne	a4,zero,.L33
	j	.L16
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.1.0"
