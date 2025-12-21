(LOOP)
    @KBD
    D=M

    @BLACK
    D;JGT

    @WHITE
    0;JMP

(BLACK)
    @SCREEN
    M=-1
    @LOOP
    0;JMP

(WHITE)
    @SCREEN
    M=0
    @LOOP
    0;JMP
