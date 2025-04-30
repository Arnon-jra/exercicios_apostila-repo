  ; Usaremos agora a memória RAM do MSP que inicia em 0x2400. É pedido para
  ;armazenar em R10 soma dos dois bytes que estão nas posições 0x2400 e 0x2401.
  
  .cdecls "msp430.h"
  .global main
  .text

  
main:
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  ;TODO:
  ;modo de endereçamento # ou &?
  mov.w #data, R4   ;R4 recebe o end que aponta para o dado iniciado em data 
  mov.b 1(R4), R10  
  mov.b 0(R4), R4
  add.b R4, R10
  
  jmp $
  nop

  .data
  .retain
data: .byte 0x33, 0x44
