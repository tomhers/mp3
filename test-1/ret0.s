	.text
	.file	"ret0.ll"
	.globl	Main_main                       # -- Begin function Main_main
	.p2align	4, 0x90
	.type	Main_main,@function
Main_main:                              # @Main_main
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$0, -4(%rsp)
	cmpl	$5, -4(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %true.0
                                        # =>This Inner Loop Header: Depth=1
	incl	-4(%rsp)
	cmpl	$5, -4(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %false.0
	movl	$1, %eax
	retq
.Lfunc_end0:
	.size	Main_main, .Lfunc_end0-Main_main
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	Main_main@PLT
	movl	$main.printout.str, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	main.printout.str,@object       # @main.printout.str
	.section	.rodata,"a",@progbits
	.p2align	4
main.printout.str:
	.asciz	"Main.main() returned %d\n"
	.size	main.printout.str, 25

	.section	".note.GNU-stack","",@progbits
