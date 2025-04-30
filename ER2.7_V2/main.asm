  ;Escreva a sub-rotina SOMA, que armazena em R10 o somatório dos números de
  ;8 bits que estão armazenados a partir do endereço 0x2400. A quantidade de bytes a
  ;serem somados é indicada por R6. Por simplicidade, vamos supor que o somatório não
  ;ultrapasse a representação em 8 bits.
  
  .cdecls "msp430.h"
  .global main
  .text

main:

  ;R5 = ponteiro, inicializado com 0x2400;
  ;R6 = contador, decrementado a cada iteração e
  ;R10 = somatório, inicializado com zero.
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  mov.w #0x05, R6   ;recebe qtde de bytes a serem somados
  call #soma
  jmp $
  nop

soma: 
  clr R10
  mov.w #data, R5
loop_soma 
  add.b @R5, R10
  inc.w R5  ;aqui usa-se .w pois incrementa-se UM a um ponteiro de endereço (16 bits)
  dec.w R6  ;usa-se .w pois pode haver muitos zeros ex: 0000 0000 0000 0011, ou ser n com sinal
  jnz loop_soma
  ret

  .data
  .retain
data: .byte 100,100,100,100,100 ;the msb are ignored due the add.b
