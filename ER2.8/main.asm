  ;Vamos repetir o ER 2.7, mas agora armazenando o somatório em um espaço de
  ;16 bits, ou seja, usaremos os 16 bits de R10.
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  ;Sub-rotina SOMA:
  ;Recebe: R6 = quantidade de números de 8 bits, a partir de 0x2400, a serem somados;
  ;Retorna: R10 = resultado do somatório.
  ;Recursos a serem usados pela sub-rotina:
  ;R5 = ponteiro, inicializado com 0x2400;
  ;R6 = contador, decrementado a cada iteração e
  ;R7 = registrador auxiliar para realizar a soma em 16 bits
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
  mov.b @R5, R7
  add.w R7, R10
  inc.w R5  ;aqui usa-se .w pois incrementa-se UM a um ponteiro de endereço (16 bits)
  dec.w R6  ;usa-se .w pois pode haver muitos zeros ex: 0000 0000 0000 0011, ou ser n com sinal
  jnz loop_soma
  ret

  .data
  .retain
data: .byte 100,100,100,100,100 ;the msb arent ignored due the add.w
