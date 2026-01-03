	.file	"calculadora.c"
	.text
	.globl	soma
	.type	soma, @function
soma:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	soma, .-soma
	.globl	sub
	.type	sub, @function
sub:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	subss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	sub, .-sub
	.globl	mult
	.type	mult, @function
mult:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	mult, .-mult
	.globl	divi
	.type	divi, @function
divi:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	divss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	divi, .-divi
	.globl	pot
	.type	pot, @function
pot:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	pxor	%xmm0, %xmm0
	cvtss2sd	-8(%rbp), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movq	%xmm2, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	cvtsd2ss	%xmm0, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	pot, .-pot
	.section	.rodata
.LC0:
	.string	"Hello World!"
	.align 8
.LC1:
	.string	"Operadores bin\303\241rios: + - * ^ "
	.align 8
.LC2:
	.string	"Funcoes unitarias de um so parametro: sqrt, sin, cos, tan"
.LC3:
	.string	"Utilize:"
	.align 8
.LC4:
	.string	"  %s num1 oper num2    (para + - * ^)\n"
	.align 8
.LC5:
	.string	"  %s num1 oper         (para sqrt sin cos tan)\n"
.LC6:
	.string	"sqrt"
.LC8:
	.string	"sqrt invalida para negativo.\n"
.LC9:
	.string	"sqrt(%.6f) = %.10f\n"
.LC10:
	.string	"sin"
.LC11:
	.string	"sin(%.6f radianos) = %.10f\n"
.LC12:
	.string	"cos"
.LC13:
	.string	"cos(%.6f radianos) = %.10f\n"
.LC14:
	.string	"tan"
	.align 8
.LC15:
	.string	"tangente(%.6f radianos) = %.10f\n"
	.align 8
.LC16:
	.string	"Funcao unitaria \"%s\" desconhecida.\n"
.LC17:
	.string	"Operacao %c nao definida.\n"
.LC18:
	.string	"Operacao: %f %c %f = %f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movl	$.LC0, %edi
	call	puts
	cmpl	$3, -84(%rbp)
	je	.L12
	cmpl	$4, -84(%rbp)
	je	.L12
	movl	$.LC1, %edi
	call	puts
	movl	$.LC2, %edi
	call	puts
	movl	$.LC3, %edi
	call	puts
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %eax
	jmp	.L13
.L12:
	cmpl	$3, -84(%rbp)
	jne	.L14
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L15
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jle	.L16
.L15:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L17
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L17
.L16:
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-96(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L18
.L17:
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-96(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L18:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atof
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L19
	pxor	%xmm0, %xmm0
	comisd	-40(%rbp), %xmm0
	jbe	.L32
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	call	fwrite
	movl	$3, %eax
	jmp	.L13
.L32:
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	movl	$.LC9, %edi
	movl	$2, %eax
	call	printf
	movl	$0, %eax
	jmp	.L13
.L19:
	movq	-16(%rbp), %rax
	movl	$.LC10, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L22
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	sin
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	movsd	-64(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	movl	$.LC11, %edi
	movl	$2, %eax
	call	printf
	movl	$0, %eax
	jmp	.L13
.L22:
	movq	-16(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L23
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	cos
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	movl	$.LC13, %edi
	movl	$2, %eax
	call	printf
	movl	$0, %eax
	jmp	.L13
.L23:
	movq	-16(%rbp), %rax
	movl	$.LC14, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L24
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	tan
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	movl	$.LC15, %edi
	movl	$2, %eax
	call	printf
	movl	$0, %eax
	jmp	.L13
.L24:
	movq	stderr(%rip), %rax
	movq	-16(%rbp), %rdx
	movl	$.LC16, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$4, %eax
	jmp	.L13
.L14:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -28(%rbp)
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$94, %eax
	je	.L25
	cmpl	$94, %eax
	jg	.L26
	cmpl	$47, %eax
	je	.L27
	cmpl	$47, %eax
	jg	.L26
	cmpl	$45, %eax
	je	.L28
	cmpl	$45, %eax
	jg	.L26
	cmpl	$42, %eax
	je	.L29
	cmpl	$43, %eax
	jne	.L26
	movss	-32(%rbp), %xmm0
	movl	-28(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	soma
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	jmp	.L30
.L28:
	movss	-32(%rbp), %xmm0
	movl	-28(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	sub
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	jmp	.L30
.L29:
	movss	-32(%rbp), %xmm0
	movl	-28(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	mult
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	jmp	.L30
.L27:
	movss	-32(%rbp), %xmm0
	movl	-28(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	divi
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	jmp	.L30
.L25:
	movss	-32(%rbp), %xmm0
	movl	-28(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	pot
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	jmp	.L30
.L26:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
.L30:
	pxor	%xmm1, %xmm1
	cvtss2sd	-4(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtss2sd	-32(%rbp), %xmm0
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	pxor	%xmm3, %xmm3
	cvtss2sd	-28(%rbp), %xmm3
	movq	%xmm3, %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movl	%edx, %esi
	movq	%rax, %xmm0
	movl	$.LC18, %edi
	movl	$3, %eax
	call	printf
	movl	$0, %eax
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20251211 (Red Hat 15.2.1-5)"
	.section	.note.GNU-stack,"",@progbits
