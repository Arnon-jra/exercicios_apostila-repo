  ;Este exercício é semelhante ao anterior, mas opera com 16 bits. É pedido para
  ;armazenar em R10 soma das palavras de 16 bits que estão nas posições 0x2400 e
  ;0x2402 (note os endereços pares).
  
  .cdecls "msp430.h"
  .global main
  .text

  
main:
  mov.w #WDTPW|WDTHOLD,&WDTCTL

func:
  mov.w #data, R4   ;R4 recebe o end que aponta para o dado iniciado em data 
  mov.w 0(R4), R5  
  mov.w 2(R4), R10
  add.w R5, R10

  jmp $
  nop
  
  .data
  .retain
data: .byte 0x33, 0x22, 0x44, 0x55
