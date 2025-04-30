  ;Escreva a sub-rotina MAIOR8, que armazena em R10 o maior elemento de um
  ;vetor com números de 8 bits sem sinal, cujo endereço está em R5.
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  ;Sub-rotina maior8:
  ;R6: qtde de n a serem somados (decrementa a cada soma)
  ;R10: resultado
  ;Recursos a serem usados pela sub-rotina:
  ;R5: end que aponta para inicio dos dados
  ;R6
  ;R10
  ;
  
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  mov.w &vetor4, R6   ;recebe qtde de words a serem somadas
  call #sum16
  jmp $
  nop

sum16: 
  clr R10
  mov.w #vetor4+2, R5
loop_soma 
  add.w @R5+, R10  
  dec.w R6 ;decrementa a word de UM
  jnz loop_soma
  ret

  .data
  .retain
vetor1: .word 0x05, 0x04, 0x07, 0x03, 0x09, 0x02
vetor2: .word 7, 1, 2, 3, 4, 5, 6, 7
vetor3: .word 10, 1, 2, 3, 4, 5, 5, -4, -3, -2, -1
vetor4: .word 6, 1234, 4567, 3, 5, -7654, 0
