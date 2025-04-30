  ;Escreva a sub-rotina SOMA, que armazena em R10 o somatório dos números de
  ;8 bits que estão armazenados a partir do endereço 0x2400. A quantidade de bytes a
  ;serem somados é indicada por R6. Por simplicidade, vamos supor que o somatório não
  ;ultrapasse a representação em 8 bits.
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  mov.w #0x04, R6   ;recebe qtde de bytes a serem somados
  call #soma
  jmp $
  nop

soma: 
  mov.b &data, R4   ;R4 recebe 1° elemento byte
  mov.w #data+1, R5 ;R5 recebe endereço do 2° elemento byte
  dec.w R6
loop_soma: 
  add.b @R5+, R4
  dec.w R6  ; supoe-se aqui que o contador é de 16bits
  jnz loop_soma
  mov.w R4, R10
  ret

  .data
  .retain
data: .byte 0x03, 0x02, 0x04, 0x05
