  ;ER 2.15. Escreva a sub-rotina FIBn que gera os “n” primeiros números da Sequência de
  ;Fibonacci e os armazena na memória RAM a partir da posição indicada por R5. O valor
  ;de “n” é indicado por R6. O leitor se lembra do programa apresentado logo no início deste
  ;capítulo?
  ;R5: pos de memoria onde serao colocados os numeros
  ;R6: n
  .cdecls "msp430.h"
  .global main
  .text

main:
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  mov.w #0x0A, R6
  call #fibn
  jmp $
  nop

fibn: 
  clr R7
  mov.w #0x2400, R5
  mov.w #0x00, 0(R5)
  incd.w R5
  dec.w R6
  mov.w #0x01, 0(R5)
  incd.w R5
  dec.w R6
loop:
  mov.w -2(R5), R7
  add.w -4(R5), R7
  mov.w R7, 0(R5)
  incd.w R5
  dec.w R6
  jnz loop
  ret

  .data
  .retain
vetor0: .byte 5, 4, 7, 3, 9, 2
vetor1: .byte 0x05, 0x04, 0x07, 0x03, 0x09, 0x02
vetor2: .byte 7, 1, 2, 3, 4, 5, 6, 7
vetor3: .byte 10, 1, 2, 3, 4, 5, 5, -4, -3, -2, -1
;vetor4: .byte 6, 1234, 4567, 3, 5, -7654, 0
