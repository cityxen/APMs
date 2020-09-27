//////////////////////////////////////////////////
// MAINLOOP
mainloop:

////////////////
    jsr $ffe4 // Check keyboard
    clc
!keycheck: // DEFAULT EXPRESSION
    cmp #$20 // SPACE
    bne !keycheck+
    lda #$01
    jsr draw_mouth
    jmp mainloop

!keycheck:
    /*

    cmp #$51 // Q
    bne !keycheck+
    lda #$02
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$57 // W
    bne !keycheck+
    lda #$03
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$45 // E
    bne !keycheck+
    lda #$04
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck: // R
    cmp #$52
    bne !keycheck+
    lda #$05
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck: // T
    cmp #$54
    bne !keycheck+
    lda #$0F
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$31 // 1
    bne !keycheck+
    lda #$06
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$32 // 2
    bne !keycheck+
    lda #$07
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$33 // 3
    bne !keycheck+
    lda #$08
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$34 // 4
    bne !keycheck+
    lda #$09
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck: 
    cmp #$35 // 5
    bne !keycheck+
    lda #$0A
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$36 // 6
    bne !keycheck+
    lda #$0B
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$37 // 7
    bne !keycheck+
    lda #$0C
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$38 // 8
    bne !keycheck+
    lda #$0D
    ldx #$00
    jsr set_expression
    jmp mainloop
!keycheck:
    cmp #$39 // 9
    bne !keycheck+
    lda #$0E
    ldx #$00
    jsr set_expression
    jmp mainloop

*/
// MOUTH KEYS
!keycheck: // clear mouth
    cmp #$41 // A
    bne !keycheck+
    lda #$00
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$53 // S
    bne !keycheck+
    lda #$01
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$44 // D
    bne !keycheck+
    lda #$02
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$46 // F
    bne !keycheck+
    lda #$03
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$47 // G
    bne !keycheck+
    lda #$04
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$48 // H
    bne !keycheck+
    lda #$05
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$4A // J
    bne !keycheck+
    lda #$06
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$4B // K
    bne !keycheck+
    lda #$07
    jsr draw_mouth
    jmp mainloop

!keycheck:
    cmp #$4C // L
    bne !keycheck+
    lda #$08
    jsr draw_mouth
    jmp mainloop

!keycheck: // end_keyboard_checks

    jmp mainloop
// END MAINLOOP
//////////////////////////////////////////////////