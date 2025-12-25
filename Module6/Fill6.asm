@lastKBD
M=0
@currentKBD
M=0

(RESTART)
    @KBD
    D=M
    @lastKBD
    M=D

    @SCREEN
    D=A
    @addr
    M=D             // addr = SCREEN base (16384)

(LOOP)
    @KBD
    D=M
    @currentKBD
    M=D

    @lastKBD
    D=D-M
    @RESTART
    D;JNE

    @currentKBD
    D=M

    @BLACK
    D;JGT

    @WHITE
    0;JMP

(BLACK)
    @24576
    D=A
    @addr
    D=D-M
    @LOOP
    D;JLE

    @addr
    A=M
    M=-1
    @addr
    M=M+1           // next screen address

    @LOOP
    0;JMP

(WHITE)
    @24576
    D=A
    @addr
    D=D-M
    @LOOP
    D;JGT

    @addr
    A=M
    M=0
    @addr
    M=M+1           // next screen address

    @LOOP
    0;JMP
