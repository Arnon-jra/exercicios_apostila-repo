  ;ER2.13 - Escreva a sub-rotina MENOR8, que armazena em R10 o menor elemento de um
  ;vetor com números de 8 bits com sinal, cujo endereço está em R5.
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  ;Sub-rotina menor8:
  ;R6: numero de elem. do vetor
  ;R10: guarda menor valor
  ;Recursos a serem usados pela sub-rotina:
  ;R5: end que aponta para inicio dos dados
  ;R6
  ;R10
  ;
  
  mov.w #WDTPW|WDTHOLD,&WDTCTL

  call #menor8
  jmp $
  nop

menor8: 
  clr R10
  mov.w #vetor3, R5
  mov.b @R5+, R6
  mov.b @R5+, R10
  dec.w R6
loop:
  cmp.b @R5+, R10
  jl salto
  mov.b -1(R5), R10
salto:
  dec.w R6 ;decrementa a word de UM
  jnz loop
  ret

  .data
  .retain
vetor1: .byte 0x05, 0x04, 0x07, 0x03, 0x09, 0x02
vetor2: .byte 7, 1, 2, 3, 4, 5, 6, 7
vetor3: .byte 10, 1, 2, 3, 4, 5, 5, -4, -3, -2, -1
;vetor4: .byte 6, 1234, 4567, 3, 5, -7654, 0
