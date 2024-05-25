# Looping in Assembly Language

This repository contains examples of assembly language programs demonstrating the use of `for`, `while`, and `do-while` loops. The examples are written in x86-64 assembly and are intended to be run in a Linux environment.

## Files

- `for_loop.asm` - Example of a `for` loop in assembly.
- `while_loop.asm` - Example of a `while` loop in assembly.
- `do_while_loop.asm` - Example of a `do-while` loop in assembly.


## For Loop
[Replit](https://replit.com/@AljonFernando/Assembly-x64#for_loop.asm)
[CHATGPT Explanation](https://chatgpt.com/share/637ee1f3-7fa7-4aeb-b604-2c311b841878)
[Code](https://github.com/ennonn/loop_in_asm/blob/3f2167732bee6ea1fa8e9f2f7ada6018326a5d83/for_loop.asm)
[Online Compiler](https://onecompiler.com/assembly/42e93mhxq)

## While Loop
[Replit](https://replit.com/@AljonFernando/Assembly-x64#while_loop.asm)
[CHATGPT Explanation](https://chatgpt.com/share/20bdea6c-c8c4-4959-a4a5-3ecb02f011b9)
[Code](https://github.com/ennonn/loop_in_asm/blob/3f2167732bee6ea1fa8e9f2f7ada6018326a5d83/while_loop.asm)
[Online Compiler](https://onecompiler.com/assembly/42e93qszd)

## Do-While Loop
[Replit](https://replit.com/@AljonFernando/Assembly-x64#do-while_loop.asm)
[CHATGPT Explanation](https://chatgpt.com/share/591fb937-e3fd-4d93-9c8d-7db068d38904)
[Code](https://github.com/ennonn/loop_in_asm/blob/3f2167732bee6ea1fa8e9f2f7ada6018326a5d83/do-while_loop.asm)
[Online Compiler](https://onecompiler.com/assembly/42e93v2qw)


## Setup and Running on these programs

You can run these programs on Replit [here](https://replit.com/@AljonFernando/Assembly-x64?v=1)
You can also run these on online compiler by copy & pasting the code

## Assembly Loops Examples


### For Loop

[Replit](https://replit.com/@AljonFernando/Assembly-x64#for_loop.asm)
[CHATGPT Explanation](https://chatgpt.com/share/637ee1f3-7fa7-4aeb-b604-2c311b841878)

```asm
section .data
    msg db 'For loop: ', 0Ah
    msg_len equ $-msg
    digit db '0', 0Ah

section .bss
    count resb 1

section .text
    global _start

_start:
    ; Print message
    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, msg        ; message to write
    mov rdx, msg_len    ; message length
    syscall             ; call kernel

    ; Initialize loop counter
    mov byte [count], 0

for_loop:
    ; Loop condition
    mov al, [count]
    cmp al, 10
    jge end_for_loop

    ; Body of the loop: Print the current counter
    movzx rax, byte [count]
    add rax, '0'        ; convert to ASCII
    mov [digit], al

    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, digit      ; digit to write
    mov rdx, 2          ; digit length (including newline)
    syscall             ; call kernel

    ; Increment loop counter
    inc byte [count]
    jmp for_loop

end_for_loop:
    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; call kernel

```


## While Loop

[Replit](https://replit.com/@AljonFernando/Assembly-x64#while_loop.asm)
[CHATGPT Explanation](https://chatgpt.com/share/20bdea6c-c8c4-4959-a4a5-3ecb02f011b9)

```asm
section .data
    msg db 'While loop: ', 0Ah
    msg_len equ $-msg
    digit db '0', 0Ah

section .bss
    count resb 1

section .text
    global _start

_start:
    ; Print message
    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, msg        ; message to write
    mov rdx, msg_len    ; message length
    syscall             ; call kernel

    ; Initialize loop counter
    mov byte [count], 0

while_loop:
    ; Loop condition
    mov al, [count]
    cmp al, 10
    jge end_while_loop

    ; Body of the loop: Print the current counter
    movzx rax, byte [count]
    add rax, '0'        ; convert to ASCII
    mov [digit], al

    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, digit      ; digit to write
    mov rdx, 2          ; digit length (including newline)
    syscall             ; call kernel

    ; Increment loop counter
    inc byte [count]
    jmp while_loop

end_while_loop:
    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; call kernel

```


## Do-While Loop

[Replit](https://replit.com/@AljonFernando/Assembly-x64#do-while_loop.asm)
[CHATGPT Explanation](https://chatgpt.com/share/591fb937-e3fd-4d93-9c8d-7db068d38904)
```asm
section .data
    msg db 'Do-while loop: ', 0Ah
    msg_len equ $-msg
    digit db '0', 0Ah

section .bss
    count resb 1

section .text
    global _start

_start:
    ; Print message
    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, msg        ; message to write
    mov rdx, msg_len    ; message length
    syscall             ; call kernel

    ; Initialize loop counter
    mov byte [count], 0

do_while_loop:
    ; Body of the loop: Print the current counter
    movzx rax, byte [count]
    add rax, '0'        ; convert to ASCII
    mov [digit], al

    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, digit      ; digit to write
    mov rdx, 2          ; digit length (including newline)
    syscall             ; call kernel

    ; Increment loop counter
    inc byte [count]

    ; Loop condition
    mov al, [count]
    cmp al, 10
    jl do_while_loop

    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; call kernel

```
