  ;Vamos propor um exercício muito semelhante ao anterior. Escreva a sub-rotina
  ;SOMA que calcula o somatório dos números de 16 bits que estão armazenados a partir
  ;do endereço 0x2400. A quantidade de números a serem somados é indicada por R6. O
  ;resultado do somatório deve ser calculado com 32 bits, usando os registradores R10
  ;(LSWord) e R11 (MSWord).
  
  .cdecls "msp430.h"
  .global main
  .text

main:
  ;Sub-rotina SOMA16:
  ;R6: qtde de n a serem somados (decrementa a cada soma)
  ;R10: LSW ; resultado
  ;R11: MSW ; resultado
  ;Recursos a serem usados pela sub-rotina:
  ;R5
  ;R10: LSW ; resultado
  ;R11: MSW ; resultado
  ;
  
  mov.w #WDTPW|WDTHOLD,&WDTCTL
  mov.w #0x05, R6   ;recebe qtde de words a serem somadas
  call #soma16
  jmp $
  nop

soma16: 
  clr R10
  clr R11
  mov.w #data, R5
loop_soma 
  add.w @R5+, R10  ;recebe soma lsw
  adc.w R11  ;recebe soma msw
  dec.w R6  ;usa-se .w pois pode haver muitos zeros ex: 0000 0000 0000 0011, ou ser n com sinal
  jnz loop_soma
  ret

  .data
  .retain
data: .word 0xABCD,0xEEEE,0x1111,0xBA98, 0xAAAA
