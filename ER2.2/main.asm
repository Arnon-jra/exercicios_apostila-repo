  ;Considerando R5 = 0x1234 e R6 = 0x 4321, armazenar em R6 soma em 8 bits de
  ;R5 + R6 (R6 = R5 + R6).
  
  .cdecls "msp430.h"
  .global main

  .text

main:
  ;WDTCTL = WDTPW+WDTHOLD;                   // Stop WDT //

  mov.w #0x1234, R5
  mov.w #0x4321, R6
  add.b R5, R6

  jmp $
  nop
