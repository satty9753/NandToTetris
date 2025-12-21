// Initialize screen address
(RESTART)
    @SCREEN
    D=A
    @addr
    M=D             // addr = SCREEN base (16384)

// Check keyboard status
(KBD_CHECK)
    @KBD
    D=M
    @SET_BLACK
    D;JGT           // if key pressed → black

    @SET_WHITE
    0;JMP           // else → white

// Set color = white
(SET_WHITE)
    @color
    M=0
    @START_DRAW
    0;JMP

// Set color = black
(SET_BLACK)
    @color
    M=-1

// Initialize draw counter
(START_DRAW)
    @8192
    D=A
    @count
    M=D             // number of screen words (8192)

// Draw loop
(LOOP)
    @addr
    A=M
    @color
    D=M
    M=D             // write color to screen word

    @addr
    M=M+1           // next screen address

    @count
    M=M-1
    D=M
    @LOOP
    D;JGT           // continue if count > 0

    @RESTART
    0;JMP           // redraw based on keyboard
