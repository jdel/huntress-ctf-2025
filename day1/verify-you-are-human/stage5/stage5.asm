.global _main
.align 4

_main:
    push   rbp
    mov    ebp,esp
    sub    esp,0x80
    push   0xffffffff8484d893
    push   0xffffffff97c6c390
    push   0xffffffff929390c3
    push   0xffffffffc7c3c490
    push   0xffffffff939c939c
    push   0xffffffffc6c69cc0
    push   0xffffffff939cc697
    push   0xffffffffc19dc794
    push   0xffffffff9196c1de
    push   0xffffffffc2c4c9c3
    mov    ecx,0xa
    mov    edi,esp
    xor    DWORD PTR [rdi],0xa5a5a5a5
    add    edi,0x4
    rex.WB jne 0x42
    mov    BYTE PTR [rsp+0x26],0x0
    mov    BYTE PTR [rbp-0x81],0x0
    mov    esi,esp
    lea    edi,[rbp-0x80]
    mov    ecx,0x26
    mov    al,BYTE PTR [rsi]
    mov    BYTE PTR [rdi],al
    rex.RX
    rex.RXB
    rex.WB jne 0x64
    mov    BYTE PTR [rdi],0x0
    lea    edi,[rsp]
    mov    ecx,0x40
    mov    al,0x1
    mov    BYTE PTR [rdi],al
    rex.RXB
    rex.WB jne 0x7a
    leave
    ret