//////////////////////////////////////////////////////////////////////////////////////
// Victoria by Deadline
//////////////////////////////////////////////////////////////////////////////////////
//
// Victoria is the Commodore VIC 20 digital puppet
// 
//////////////////////////////////////////////////////////////////////////////////////
// 
// History:
// 
// September 27, 2020
//      - Added Victoria.asm
//
//////////////////////////////////////////////////////////////////////////////////////


.const screenram = $1e00
.const eye_left  = screenram+183
.const eye_right = screenram+189
.const mouth     = screenram+314
.const colorram  = $9600  //  - $97FF

//////////////////////////////////////////////////////////////////////////////////////
// File stuff
.file [name="victoria.prg", segments="Main"]
.disk [filename="victoria.d64", name="CITYXEN VICTORIA", id="2020!" ] {
	[name="VICTORIA", type="prg",  segments="Main"],
}
//////////////////////////////////////////////////////////////////////////////////////
.segment Main [allowOverlap]

*=$1001 "BASIC"
BasicUpstart($1010)
*=$1010

start:
    lda #$93 // clear screen
    jsr $ffd2
    
	lda #$cc 
	sta $900f // change background / border color

	ldx #$00
cramx:
	lda #$00
	sta colorram,x
	sta colorram+256,x
	sta colorram+512,x
	inx
	cpx #$00
	bne cramx

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
    sta mouth+13,y
    iny
    cpy #$12
    bne !dmlp-
    ldy #$12
!dmlp:
    lda ($01),y
    sta mouth+26,y
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