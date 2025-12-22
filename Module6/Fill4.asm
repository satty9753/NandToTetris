(RESTART)
    @SCREEN
    D=A
    @addr
    M=D             // addr = SCREEN base (16384)

(LOOP)
    @KBD
    D=M

    @BLACK
    D;JGT

    @WHITE
    0;JMP

(BLACK)
    @addr
    A=M
    M=-1
    @addr
    M=M+1           // next screen address

    @LOOP
    0;JMP

(WHITE)
    @addr
    A=M
    M=0
    @addr
    M=M+1           // next screen address
    @LOOP
    0;JMP
