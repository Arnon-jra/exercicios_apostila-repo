  ;Considerando R5 = 0xABCD e R6 = 0xDCBA, armazenar em R6 soma em 16 bits
  ;de R5 + R6 (R6 = R5 + R6).
  
  .cdecls "msp430.h"
  .global main

  .text

main:
  ;WDTCTL = WDTPW+WDTHOLD;                   // Stop WDT

  mov.w #0xABCD, R5
  mov.w #0xDCBA, R6
  add.w R5, R6        ;gera carry no SR

  jmp $
  nop
