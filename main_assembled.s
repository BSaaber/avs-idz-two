	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%c"
	.text
	.globl	fill_array
	.type	fill_array, @function
fill_array:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi #  переменная array, хранится на стеке по смещению -24
	mov	DWORD PTR -28[rbp], esi # переменная array_size, хранится на стеке по смещению -28
	mov	DWORD PTR -4[rbp], 0 # переменная i, хранится на стеке по смещению -4
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L3
	nop
	nop
	leave
	ret # выход из функции. Возвращаемого значения нет
	.size	fill_array, .-fill_array
	.section	.rodata
.LC1:
	.string	"%c\n"
.LC2:
	.string	"no such sequence"
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi # переменная array хранится на стеке по смещению -24
	mov	DWORD PTR -28[rbp], esi # переменная start хранится на стеке по смещению -28
	mov	DWORD PTR -32[rbp], edx # переменная n хранится на стеке по смещению -32
	cmp	DWORD PTR -32[rbp], 1
	jne	.L5
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L4
.L5:
	cmp	DWORD PTR -28[rbp], -1
	je	.L7
	mov	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -4[rbp], eax # переменная i, хранится на стеке по смещению -4
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
	add	DWORD PTR -4[rbp], 1
.L8:
	mov	edx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -32[rbp]
	add	eax, edx
	cmp	DWORD PTR -4[rbp], eax
	jl	.L9
	jmp	.L10
.L7:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L10:
	mov	edi, 10
	call	putchar@PLT
.L4:
	leave
	ret  # выход из функции. Возвращаемого значения нет
	.size	print_array, .-print_array
	.section	.rodata
.LC3:
	.string	"%d %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rdx, -36[rbp] # переменная array_size, хранится на стеке по смещению -36
	lea	rax, -40[rbp] # переменная n, хранится на стеке по смещению -40
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax # переменная array, хранится на стеке по смещению -16
	mov	edx, DWORD PTR -36[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, edx # регистром esi передаем в функцию переменную array_size
	mov	rdi, rax # регистром rdi передаем в функцию переменную array
	call	fill_array # вызов функции fill_array
	mov	DWORD PTR -32[rbp], -1 # переменная start, хранится на стеке по смещению -32
	mov	DWORD PTR -28[rbp], 1  # переменная cur хранится на стеке по смещению -28
	mov	DWORD PTR -24[rbp], 0 # переменная t хранится на стеке по смещению -24
	mov	DWORD PTR -20[rbp], 0 # переменная i хранится на стеке по смещению -20
	jmp	.L12
.L17:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rcx, 1[rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jle	.L13
	add	DWORD PTR -28[rbp], 1
	jmp	.L14
.L13:
	mov	eax, DWORD PTR -20[rbp]
	add	eax, 1
	mov	DWORD PTR -24[rbp], eax
	mov	DWORD PTR -28[rbp], 1
.L14:
	mov	eax, DWORD PTR -40[rbp]
	cmp	DWORD PTR -28[rbp], eax
	jne	.L15
	mov	eax, DWORD PTR -24[rbp]
	mov	DWORD PTR -32[rbp], eax
	jmp	.L16
.L15:
	add	DWORD PTR -20[rbp], 1
.L12:
	mov	eax, DWORD PTR -36[rbp]
	sub	eax, 1
	cmp	DWORD PTR -20[rbp], eax
	jl	.L17
.L16:
	mov	edx, DWORD PTR -40[rbp] # регистром edx передаем в функцию параметр n
	mov	ecx, DWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, ecx # регистром esi передаем в функцию параметр start
	mov	rdi, rax # регистром rdi передаем в функцию параметр array
	call	print_array # вызов print_array
	mov	eax, 0                      # задаем возвращаемое функцией значение, установив его в регистр eax
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	ret # выход из функции. Возвращаемое значение - в регистре eax
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
