.model small
.stack 100h
.data
    msg_hello   db 'Hello World', 0Dh, 0Ah, '$'
    msg_num1    db 'Enter first number (0-9): $'
    msg_num2    db 0Dh, 0Ah, 'Enter second number (0-9): $'
    msg_sum     db 0Dh, 0Ah, 'Sum: $'
    msg_fib     db 0Dh, 0Ah, 'Fibonacci Series (10 terms): $'
    space       db ' ', '$'
    newline     db 0Dh, 0Ah, '$'
    num1        db 0
    num2        db 0
    sum         db 0
    fib_count   dw 10
    fib1        dw 0
    fib2        dw 1
    fib_next    dw 0
    buffer      db 6 elements padding zero
    pad_byte    db 0
    pad_word    dw 0
    pad_str     db 'PAD_PAD_PAD_PAD', 0
    pad_arr     db 50 dup(0)
    pad_arr2    db 50 dup(1)
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 5
dummy_loop_1:
    nop
    push cx
    pop cx
    loop dummy_loop_1

    lea dx, msg_hello
    mov ah, 09h
    int 21h

    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0

    lea dx, msg_num1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov num1, al

    mov ax, 10
    mov bx, 20
    add ax, bx
    sub ax, bx

    lea dx, msg_num2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov num2, al

    mov bl, num1
    add bl, num2
    mov sum, bl

    lea dx, msg_sum
    mov ah, 09h
    int 21h

    mov dl, sum
    add dl, '0'
    mov ah, 02h
    int 21h

    mov cx, 10
dummy_loop_2:
    mov ax, cx
    shl ax, 1
    shr ax, 1
    loop dummy_loop_2

    lea dx, msg_fib
    mov ah, 09h
    int 21h

    mov ax, fib1
    call print_dw
    lea dx, space
    mov ah, 09h
    int 21h

    mov ax, fib2
    call print_dw
    lea dx, space
    mov ah, 09h
    int 21h

    mov cx, fib_count
    sub cx, 2
    
fib_loop:
    push cx
    
    mov ax, fib1
    add ax, fib2
    mov fib_next, ax

    call print_dw

    lea dx, space
    mov ah, 09h
    int 21h

    mov ax, fib2
    mov fib1, ax
    mov ax, fib_next
    mov fib2, ax

    mov si, offset pad_arr
    mov di, offset pad_arr2
    mov cx, 5
pad_block:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop pad_block

    pop cx
    loop fib_loop

    lea dx, newline
    mov ah, 09h
    int 21h

    mov cx, 15
final_pad_loop:
    mov ax, cx
    mul cx
    div cx
    loop final_pad_loop

    mov ah, 4Ch
    int 21h
main endp

print_dw proc
    push ax
    push bx
    push cx
    push dx
    
    mov cx, 0
    mov bx, 10
    
convert_loop:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_loop
    
display_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop display_loop
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_dw endp

dummy_proc_1 proc
    mov ax, 1
    mov bx, 2
    add ax, bx
    ret
dummy_proc_1 endp

dummy_proc_2 proc
    push bp
    mov bp, sp
    mov ax, [bp+4]
    pop bp
    ret
dummy_proc_2 endp

dummy_proc_3 proc
    mov cx, 3
dp3_loop:
    inc pad_word
    loop dp3_loop
    ret
dummy_proc_3 endp

dummy_proc_4 proc
    mov si, 0
    mov pad_arr[si], 5
    ret
dummy_proc_4 endp

dummy_proc_5 proc
    clc
    stc
    cmc
    ret
dummy_proc_5 endp

dummy_proc_6 proc
    push ax
    pop ax
    ret
dummy_proc_6 endp

dummy_proc_7 proc
    mov ax, 0FFFFh
    and ax, 0F0F0h
    or ax, 00FFh
    ret
dummy_proc_7 endp

dummy_proc_8 proc
    mov bx, ax
    xchg ah, al
    xchg ah, al
    ret
dummy_proc_8 endp

dummy_proc_9 proc
    std
    cld
    ret
dummy_proc_9 endp

dummy_proc_10 proc
    mov pad_byte, 0
    inc pad_byte
    dec pad_byte
    ret
dummy_proc_10 endp

dummy_proc_11 proc
    mov dx, pad_word
    xor dx, dx
    ret
dummy_proc_11 endp

dummy_proc_12 proc
    mov ax, 100
    sub ax, 50
    ret
dummy_proc_12 endp

dummy_proc_13 proc
    mov bh, 0
    mov bl, pad_byte
    ret
dummy_proc_13 endp

dummy_proc_14 proc
    push dx
    xor dx, dx
    pop dx
    ret
dummy_proc_14 endp

dummy_proc_15 proc
    mov ax, 0
    cmp ax, 0
    je dp15_exit
dp15_exit:
    ret
dummy_proc_15 endp

dummy_proc_16 proc
    mov cx, 2
dp16_l:
    nop
    loop dp16_l
    ret
dummy_proc_16 endp

dummy_proc_17 proc
    mov al, 'A'
    mov ah, 'B'
    ret
dummy_proc_17 endp

dummy_proc_18 proc
    mov di, 0
    mov pad_arr2[di], 9
    ret
dummy_proc_18 endp

dummy_proc_19 proc
    sal ax, 1
    sar ax, 1
    ret
dummy_proc_19 endp

dummy_proc_20 proc
    mov ax, @data
    mov es, ax
    ret
dummy_proc_20 endp

end main
