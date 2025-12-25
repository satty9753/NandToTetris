(INIT)
    @SCREEN
    D=A
    @addr
    M=D

(LOOP)
    @KBD
    D=M
    @SET_BLACK
    D;JGT          

(SET_WHITE)
    @color
    M=0
    @DRAW
    0;JMP

(SET_BLACK)
    @color
    M=-1

(DRAW)
    @addr
    D=M
    @24576
    D=D-A
    @CHECK_KBD     
    D;JGE

    @color
    D=M
    @addr
    A=M
    M=D            
    
    @addr
    M=M+1          

(CHECK_KBD)
    @KBD
    D=M
    @temp_kbd
    M=D            
    
    @last_kbd
    D=D-M
    @INIT          
    D;JNE
    
    @LOOP          
    0;JMP