main:   
SET R0, 0x05 ; Solo para probar
SET R1, 0x00
loop:   
JZ fin
ADD R1, R0
DEC R0
JMP loop
fin:    
JMP fin