JMP seguir      ; Se salta a `seguir`
seguir:         
SET R0, 0xFF    ; R0 := 0xFF
SET R1, 0x11    ; R1 := 0x11
siguiente:
ADD R0, R1      ; R0 := R0 + R1
JC siguiente    ; Si hubo carry, se salta a `siguiente` y se vuelve a sumar...
halt:
JMP halt        ; Se queda "esperando" de por vida