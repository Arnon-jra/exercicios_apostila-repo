  ;Escreva a sub-rotina SUM8, que armazena em R10 o somatório dos elementos
  ;de um vetor composto por bytes, cujo endereço está em R5.
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  ;Sub-rotina sum8:
  ;R6: qtde de n a serem somados (decrementa a cada soma)
  ;R10: resultado
  ;Recursos a serem usados pela sub-rotina:
  ;R5: end que aponta para inicio dos dados
  ;R6
  ;R10
  ;
  
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  mov.b &vetor3, R6   ;recebe qtde de words a serem somadas
  call #sum8
  jmp $
  nop

sum8: 
  clr R10
  mov.w #vetor3+1, R5
loop_soma 
  add.b @R5+, R10  
  dec.b R6 
  jnz loop_soma
  ret

  .data
  .retain
vetor1: .byte 0x05, 0x04, 0x07, 0x03, 0x09, 0x02
vetor2: .byte 7, 1, 2, 3, 4, 5, 6, 7
vetor3: .byte 10, 1, 2, 3, 4, 5, 5, -4, -3, -2, -1
