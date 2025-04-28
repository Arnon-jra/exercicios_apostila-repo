
;ER 2.1. Considerando R5 = 0x1234 e R6 = 0x4321, escreva um programa que armaze em
;R6 soma em 16 bits de R5 + R6 (R6 = R5 + R6).

  .cdecls "msp430.h"
  .global main

  .text

main:
    mov.w #0x1234, R5
    mov.w #0x4321, R6

    add.w R5, R6

    jmp $
    nop

    dsds



