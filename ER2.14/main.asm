  ;ER 2.14. Escreva a sub-rotina INV8 que inverte a ordem dos elementos de um vetor
  ;formado por números de 8 bits, cujo endereço está em R5. Por exemplo, se receber o
  ;vetor [4, 7, 3, 9, 2], deve retornar o vetor [2, 9, 3, 7, 4], como indicado na figura abaixo.
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  mov.w #WDTPW|WDTHOLD,&WDTCTL

  call #inv8
  jmp $
  nop

inv8: 
  mov.w #vetor0, R5
  mov.b @R5, R6  ;tamanho do vetor
  add.w R6, R5 
  mov.w R5, R7  ;recebe endereço + tam. do vetor (onde guarderei os novos dados)
  inc.w R7
loop:
  mov.b @R5,0(R7)
  dec.w R5
  inc.w R7
salto:
  dec.w R6 ;decrementa a word de UM
  jnz loop
  ret

  .data
  .retain
vetor0: .byte 5, 4, 7, 3, 9, 2
vetor1: .byte 0x05, 0x04, 0x07, 0x03, 0x09, 0x02
vetor2: .byte 7, 1, 2, 3, 4, 5, 6, 7
vetor3: .byte 10, 1, 2, 3, 4, 5, 5, -4, -3, -2, -1
;vetor4: .byte 6, 1234, 4567, 3, 5, -7654, 0
