//////////////////////////////////////////////////////////////////////////////////////
// Fido by Deadline
//////////////////////////////////////////////////////////////////////////////////////
//
// Fido is the Commodore PET digital puppet
// 
//////////////////////////////////////////////////////////////////////////////////////
// 
// History:
// 
// September 13, 2020
//      - Added Fido.asm
//
//////////////////////////////////////////////////////////////////////////////////////

.const screenram = $8000
.const eye_left  = screenram+135+160
.const eye_right = screenram+145+160
.const mouth     = screenram+536

//////////////////////////////////////////////////////////////////////////////////////
// File stuff
.file [name="fido.prg", segments="Main"]
.disk [filename="fido.d64", name="CITYXEN FIDO", id="2020!" ] {
	[name="FIDO", type="prg",  segments="Main"],
}
//////////////////////////////////////////////////////////////////////////////////////
.segment Main [allowOverlap]

*=$0401 "BASIC"
 :BasicUpstart($0415)
*=$0415

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

draw_mouth:
    clc
    cmp #$01
    bne !dm+
    lda #<mouth_one
    sta $01
    lda #>mouth_one
    sta $02
    jmp draw_mouth_continue
!dm:
    cmp #$02
    bne !dm+
    lda #<mouth_two
    sta $01
    lda #>mouth_two
    sta $02
    jmp draw_mouth_continue
!dm:
    cmp #$03
    bne !dm+
    lda #<mouth_three
    sta $01
    lda #>mouth_three
    sta $02
    jmp draw_mouth_continue
!dm:
    cmp #$04
    bne !dm+
    lda #<mouth_four
    sta $01
    lda #>mouth_four
    sta $02
    jmp draw_mouth_continue
!dm:
    cmp #$05
    bne !dm+
    lda #<mouth_five
    sta $01
    lda #>mouth_five
    sta $02
    jmp draw_mouth_continue
!dm:
    cmp #$06
    bne !dm+
    lda #<mouth_small_line
    sta $01
    lda #>mouth_small_line
    sta $02
    jmp draw_mouth_continue
!dm:
    rts
    
draw_mouth_continue:
    ldy #$00
!dmlp:
    lda ($01),y
    sta mouth,y
    iny
    cpy #$09
    bne !dmlp-
    ldy #$09
!dmlp:
    lda ($01),y
    sta mouth+31,y
    iny
    cpy #$12
    bne !dmlp-
    ldy #$12
!dmlp:
    lda ($01),y
    sta mouth+62,y
    iny
    cpy #$1b
    bne !dmlp-
    ldy #$1b

    rts

draw_eyes:
    lda #$30
    sta eye_left
    sta eye_right
    rts

#import "mouthdata.asm"
