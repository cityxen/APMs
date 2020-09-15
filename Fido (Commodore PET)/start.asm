//////////////////////////////////////////////////
// START (DO SOME INITIALIZING HERE)
start:
    lda #$93 // clear screen
    jsr $ffd2

    lda #$01
    jsr draw_eyes
    lda #$01
    jsr draw_mouth
    








    jmp mainloop