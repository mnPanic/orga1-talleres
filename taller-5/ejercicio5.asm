SET R1, 0x01    ; R1 := Velocidad para curva
SET R2, 0x02    ; R2 := Velocidad máxima
SET R3, 0x02
STR [0xF0], R3  ; Arrancamos con velocidad máxima
SET R0, rai
STR [0x00], R0  ; Configura rutina de atención de interrupciones
STI             ; Habilito interrupciones

wait:
JMP wait

rai:
CMP R3, R2
JZ hayCurva      ; Si R3 == Velocidad Máxima, hayCurva
MOV R3, R2       ; Sino, setteamos velocida máxima
JMP endInterrupt

hayCurva:
MOV R3, R1      ; Setteamos la velocidad de curva

endInterrupt:
STR [0xF0], R3
IRET

