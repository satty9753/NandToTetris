@R2
M=0
@i
M=1
(LOOP)
    @i
    D=M
    @R1
    D=D-M
    @End
    D;JGT
    // R2 = R2 + R0
    @R0
    D=M
    @R2
    M=D+M
    // i = i+1
    @i
    M=M+1

    @LOOP
    0;JMP
(END)
    @END
    0;JMP