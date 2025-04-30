  ;Este exercício é idêntico ao anterior, mas pede a elaboração de uma sub-rotina. É
  ;pedido a sub-rotina de nome SOMA2, que armazena em R10 a soma das palavras de 16
  ;bits que estão nas posições 0x2400 e 0x2402.
  .cdecls "msp430.h"
  .global main
  .text

main:
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  call #soma
  jmp $
  nop

soma:
  mov.w &data, R10   ;R4 recebe o end que aponta para o dado iniciado em data 
  add.w &data+2, R10
  ret
  
  .data
  .retain
data: .byte 0x33, 0x22, 0x44, 0x55
