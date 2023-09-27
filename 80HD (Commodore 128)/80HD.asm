//////////////////////////////////////////////////////////////////////////////////////
// 80HD by Deadline
//////////////////////////////////////////////////////////////////////////////////////
//
// 80HD is the Commodore 128 digital puppet
// 
//////////////////////////////////////////////////////////////////////////////////////
// 
// History:
//
// September 20, 2023
//      - Added 80HD.asm (40 COLUMN C128 MODE)
//
//////////////////////////////////////////////////////////////////////////////////////

.const SCREEN_RAM       = 1024
.const eye_left         = SCREEN_RAM+134+160+40+40+40
.const eye_right        = SCREEN_RAM+145+160+40+40+40
.const mouth            = SCREEN_RAM+536
.const COLOR_RAM        = 55296
.const BACKGROUND_COLOR = 53280
.const BORDER_COLOR     = 53281

#import "DrawPetMateScreen.asm"

//////////////////////////////////////////////////////////////////////////////////////
.file [name="80hd.prg", segments="Main"]
.disk [filename="80hd(c128 mode only).d64", name="CITYXEN 80HD", id="2023!" ] {
	[name="80HD (C128 MODE)", type="prg",  segments="Main"],
}
//////////////////////////////////////////////////////////////////////////////////////
.segment Main [allowOverlap]

*=$1c01 "BASIC"
 :BasicUpstart($1c40)
*=$1c40



//////////////////////////////////////////////////
// START (DO SOME INITIALIZING HERE)
start:

    lda #$93 // clear screen
    jsr $ffd2

    lda #$00
    sta BACKGROUND_COLOR
    sta BORDER_COLOR

    DrawPetMateScreen(screen_001)

    jmp mainloop

//////////////////////////////////////////////////
// MAINLOOP
mainloop:

////////////////
    jsr $ffe4 // Check keyboard
    clc
    beq mainloop



!keycheck:
    cmp #$31 // 1
    bne !keycheck+
    lda #$30
    DrawPetMateScreen(screen_001)
    jmp mainloop
!keycheck:
    cmp #$32 // 2
    bne !keycheck+
    lda #$31
    DrawPetMateScreen(screen_002)
    jmp mainloop
!keycheck:
    cmp #$33 // 3
    bne !keycheck+
    lda #$08
    ldx #$00
    DrawPetMateScreen(screen_003)
    jmp mainloop
!keycheck:
    cmp #$34 // 4
    bne !keycheck+
    lda #$09
    ldx #$00
    DrawPetMateScreen(screen_004)
    jmp mainloop

// EYES
!keycheck:
    cmp #$9d // KEY_CURSOR_LEFT
    bne !keycheck+
    jsr draw_eyes_left
    jmp mainloop

!keycheck:
    cmp #$1d // KEY_CURSOR_RIGHT
    bne !keycheck+
    jsr draw_eyes_right
    jmp mainloop

!keycheck:
    cmp #$91 // KEY_CURSOR_UP
    bne !keycheck+
    jsr draw_eyes
    jmp mainloop


!keycheck:
    jmp mainloop
// END MAINLOOP
//////////////////////////////////////////////////

#import "80HD_mouthdata.asm"

draw_eyes:
    lda #$20
    sta eye_left-1
    sta eye_right-1
    lda #$51
    sta eye_left
    sta eye_right
    lda #$20
    sta eye_left+1
    sta eye_right+1
    rts

draw_eyes_left:
    lda #$51
    sta eye_left-1
    sta eye_right-1
    lda #$20
    sta eye_left
    sta eye_right
    lda #$20
    sta eye_left+1
    sta eye_right+1
    rts
rts

draw_eyes_right:
    lda #$20
    sta eye_left-1
    sta eye_right-1
    lda #$20
    sta eye_left
    sta eye_right
    lda #$51
    sta eye_left+1
    sta eye_right+1
    rts
rts


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

*=$2031
#import "petmate_screens/80HD.asm"


