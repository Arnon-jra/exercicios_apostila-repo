  ;Escreva a sub-rotina MAIOR8, que armazena em R10 o maior elemento de um
  ;vetor com números de 8 bits sem sinal, cujo endereço está em R5.
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  ;Sub-rotina maior8:
  ;R6: qtde de n a serem somados (decrementa a cada soma)
  ;R10: maior elemento
  ;Recursos a serem usados pela sub-rotina:
  ;R5: end que aponta para inicio dos dados
  ;R6
  ;R10
  ;
  
  mov.w #WDTPW|WDTHOLD,&WDTCTL
    
  call #maior8
  jmp $
  nop

maior8: 
  clr R10
  mov.w #vetor, R5
  mov.b @R5+, R6
  mov.b @R5+, R10
  dec.w R6
loop_maior8:
  mov.b @R5+, R11
  cmp R11, R10 
  jge salto   ;TODO: jhs? tanto faz?
  mov.b R11, R10
salto:
  dec.w R6 ;decrementa a word de UM
  jnz loop_maior8
  ret

  .data
  .retain
vetor: .byte 0x05, 0x04, 0x07, 0x03, 0x09, 0x02

akadka