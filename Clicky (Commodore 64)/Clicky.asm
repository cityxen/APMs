//////////////////////////////////////////////////////////////////////////////////////
// Clicky by Deadline
//////////////////////////////////////////////////////////////////////////////////////
//
// Clicky is the CityXen Youtube channel mascot
// He can be seen throughout our various videos often
// popping in unannounced, where he offers unsolicited
// advice or comments.
// 
// Valentine's Day 2020:
// Added Tears Decoration
// 
// Halloween 2019:
// Added Scar Decoration
// During the Halloween 2019 special, Clicky died and was 
// put to rest at the CityXen Memorial Gardens in 
// Douglasville, Ga.
// The special saw him being dug up out of his grave,
// and reassembled with parts from other Commodore 64's
// in the CityXen laboratory.
// He was brought back to life October 18th, 2019
// and he immediately took over the video making awful
// puns in between 3 stories, Tales from the Encrypt.
// 
// July 21, 2020:
//      - Added Set Expression Sub Routine
//      - Added Joyport 2 Control of Clicky
// 
//////////////////////////////////////////////////////////////////////////////////////
#import "../../Commodore64_Programming/include/Constants.asm"
.segment Sprites [allowOverlap]
*=$2000 "CLICKY EYES"
#import "Clicky_Eyes.asm"
//////////////////////////////////////////////////////////////////////////////////////
// File stuff
.file [name="prg_files/clicky.prg", segments="Main,Sprites"]
.disk [filename="prg_files/clicky.d64", name="CITYXEN CLICKY", id="2020!" ] {
	[name="CLICKY", type="prg",  segments="Main,Sprites"],
}
//////////////////////////////////////////////////////////////////////////////////////
.segment Main [allowOverlap]
*=$0801 "BASIC"
 :BasicUpstart($0815)
*=$080a "cITYxEN wORDS"
.byte $3a,99,67,73,84,89,88,69,78,99
*=$0815 "MAIN PROGRAM"
.const mouth_local_line=$0617
.const scar_local_line =$055c
program:
    lda #$00
    sta BACKGROUND_COLOR
    sta BORDER_COLOR

    // cursor color
    ldx color_table_offset
    lda characters_color_table,x
    sta CURSOR_COLOR

    lda #$93
    jsr KERNAL_CHROUT

    // SET DEFAULT POSITION ON SCREEN
    lda #$85
    sta SPRITE_0_X
    sta SPRITE_2_X  // Tear 1
    lda #$ca
    sta SPRITE_1_X
    sta SPRITE_3_X  // Tear 2
    lda #$00
    sta SPRITE_4_X
    sta SPRITE_5_X
    sta SPRITE_6_X
    sta SPRITE_7_X
    lda #$60
    sta SPRITE_0_Y
    lda #$60
    sta SPRITE_1_Y
    lda #$00
    sta SPRITE_2_Y  // Tear
    sta SPRITE_3_Y
    sta SPRITE_4_Y
    sta SPRITE_5_Y
    sta SPRITE_6_Y
    sta SPRITE_7_Y
    lda #$ff
    sta SPRITE_ENABLE
    sta SPRITE_MULTICOLOR

    // sprite colors
    ldx color_table_offset
    lda sprite_multicolor_0_table,x
    sta SPRITE_MULTICOLOR_0
    lda #WHITE
    sta SPRITE_MULTICOLOR_1
    lda sprite_multicolor_1_table,x
    sta SPRITE_0_COLOR
    sta SPRITE_1_COLOR
    sta SPRITE_2_COLOR
    sta SPRITE_3_COLOR
    sta SPRITE_4_COLOR
    sta SPRITE_5_COLOR
    sta SPRITE_6_COLOR
    sta SPRITE_7_COLOR

    lda #CLICKY_EYES_SOLID
    sta SPRITE_0_POINTER // eye left
    lda #CLICKY_EYES_DOWN_RIGHT
    sta SPRITE_1_POINTER // eye right
    lda #CLICKY_EYES_TEAR
    sta SPRITE_2_POINTER // tear left
    lda #CLICKY_EYES_TEAR
    sta SPRITE_3_POINTER // tear right
    lda #$00
    sta SPRITE_4_POINTER // future
    lda #$00
    sta SPRITE_5_POINTER // future
    lda #$00
    sta SPRITE_6_POINTER // future
    lda #$00
    sta SPRITE_7_POINTER // future

    // set up sid to produce random values
    lda #$FF  // maximum frequency value
    sta $D40E // voice 3 frequency low byte
    sta $D40F // voice 3 frequency high byte
    lda #$80  // noise waveform, gate bit off
    sta $D412 // voice 3 control register

//////////////////////////////////////////////////
// MAINLOOP
mainloop:    
    // animate stuff
    jsr subroutine_animate
    // Check keyboard
    jsr KERNAL_GETIN
    clc
!keycheck: // DEFAULT EXPRESSION
    cmp #$20 // SPACE
    bne !keycheck+
    lda #$01
    ldx #$01
    jsr set_expression
    jmp mainloop
!keycheck:
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

// MOUTH KEYS
!keycheck: // clear mouth
    cmp #$41 // A
    bne !keycheck+
    lda #$00
    ldx #$01
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$53 // S
    bne !keycheck+
    lda #$00
    ldx #$02
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$44 // D
    bne !keycheck+
    lda #$00
    ldx #$03
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$46 // F
    bne !keycheck+
    lda #$00
    ldx #$04
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$47 // G
    bne !keycheck+
    lda #$00
    ldx #$05
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$48 // H
    bne !keycheck+
    lda #$00
    ldx #$06
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$4A // J
    bne !keycheck+
    lda #$00
    ldx #$07
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$4B // K
    bne !keycheck+
    lda #$00
    ldx #$08
    jsr set_expression
    jmp mainloop

!keycheck:
    cmp #$4C // L
    bne !keycheck+
    lda #$00
    ldx #$09
    jsr set_expression
    jmp mainloop

//////////////////////////////////////////////////
// F1 (toggle frankenstein type scar on Clicky's face)

!keycheck:
    cmp #$85 // F1
    bne !keycheck+
    lda halloween_scar_status
    beq scar_turn_on
scar_turn_off: // turn scar off
    ldx #$00
    stx halloween_scar_status
scarloop0:
    lda halloween_scar_clear,x
    sta scar_local_line,x
    lda halloween_scar_clear+9,x
    sta scar_local_line+40,x
    lda halloween_scar_clear+18,x
    sta scar_local_line+80,x
    lda halloween_scar_clear+27,x
    sta scar_local_line+120,x
    inx
    cpx #$09
    bne scarloop0
    jmp mainloop
scar_turn_on: // turn scar on
    ldx #$00
    inc halloween_scar_status
scarloop1:
    lda halloween_scar,x
    sta scar_local_line,x
    lda halloween_scar+9,x
    sta scar_local_line+40,x
    lda halloween_scar+18,x
    sta scar_local_line+80,x
    lda halloween_scar+27,x
    sta scar_local_line+120,x
    inx
    cpx #$09
    bne scarloop1
    jmp mainloop
//////////////////////////////////////////////////
// F2 Toggle Cry mode
!keycheck:
    cmp #$89 // F2
    bne !keycheck+
    lda valentine_cry_status
    beq cry_turn_on
cry_turn_off:
    lda #$00
    sta valentine_cry_status
    jmp mainloop
cry_turn_on:
    inc valentine_cry_status
    lda #$68
    sta SPRITE_2_Y    
    jmp mainloop
//////////////////////////////////////////////////
// F3
!keycheck:
    cmp #$86 // F3
    bne !keycheck+
    jmp mainloop
//////////////////////////////////////////////////
// F4
!keycheck:
    cmp #$8a
    bne !keycheck+
    jmp mainloop
//////////////////////////////////////////////////
// F5
!keycheck:
    cmp #$87 // F5
    bne !keycheck+
    jmp mainloop
//////////////////////////////////////////////////
// F6
!keycheck:
    cmp #$8b // F6
    bne !keycheck+
    jmp mainloop
//////////////////////////////////////////////////
// F7 Increment color being used
!keycheck:
    cmp #$88 // F7
    bne !keycheck+
    inc color_table_offset
    // cursor color
    ldx color_table_offset
    lda characters_color_table,x
    cmp #$ff
    bne f7_chg_colors
    ldx #$00
    stx color_table_offset
    lda characters_color_table,x
f7_chg_colors:
    ldy #$00
f7_chg_colors_loop_1:
    sta COLOR_RAM,y
    sta COLOR_RAM+256,y
    sta COLOR_RAM+256+256,y
    sta COLOR_RAM+256+256+256,y
    iny
    cpy #$00
    bne f7_chg_colors_loop_1
    sta CURSOR_COLOR
    // sprite colors
    lda sprite_multicolor_0_table,x
    sta SPRITE_MULTICOLOR_0
    lda sprite_multicolor_1_table,x
    sta SPRITE_0_COLOR
    sta SPRITE_1_COLOR
    sta SPRITE_2_COLOR
    sta SPRITE_3_COLOR
    jmp mainloop
//////////////////////////////////////////////////
// F8
!keycheck:
    cmp #$89 // F8
    bne !keycheck+
    jmp mainloop

!keycheck: // end_keyboard_checks

// Joystick port 2 control of Clicky
    lda 56320
// Middle, no move 127
// UP
    cmp #126
    bne !joy2check+
    lda #$05 // WORRIED EYES
    ldx #$04 // SURPRISED MOUTH
    jsr set_expression

!joy2check:
// DOWN
    cmp #125
    bne !joy2check+
    lda #$02 // MAD EYES
    ldx #$02 // LINE MOUTH
    jsr set_expression

!joy2check:
// LEFT
    cmp #123
    bne !joy2check+
    lda #$0E // CHEEKY EYES
    ldx #$03 // SMILE
    jsr set_expression

!joy2check:
// RIGHT
    cmp #119
    bne !joy2check+
    lda #$0A
    ldx #$02
    jsr set_expression

!joy2check:
//  UP+LEFT
    cmp #122
    bne !joy2check+
    lda #$09
    ldx #$03
    jsr set_expression

!joy2check:
// UP+RIGHT
    cmp #118
    bne !joy2check+
    lda #$0B
    ldx #$02
    jsr set_expression

!joy2check:
// DOWN+LEFT
    cmp #121
    bne !joy2check+

!joy2check:
// DOWN+RIGHT
    cmp #117
    bne !joy2check+

// Middle, no move+FIRE 111
    cmp #111
    bne !joy2check+

!joy2check:
// UP+FIRE
    cmp #110
    bne !joy2check+
    lda #$00
    ldx #$03
    jsr set_expression

!joy2check:
// DOWN+FIRE
    cmp #109
    bne !joy2check+
    lda #$00
    ldx #$04
    jsr set_expression

!joy2check:
// LEFT+FIRE
    cmp #107
    bne !joy2check+
    lda #$00
    ldx #$05
    jsr set_expression

!joy2check:
// RIGHT+FIRE
    cmp #103
    bne !joy2check+
    lda #$00
    ldx #$06
    jsr set_expression

!joy2check:
//  UP+LEFT+FIRE
    cmp #106
    bne !joy2check+
    lda #$00
    ldx #$02
    jsr set_expression

!joy2check:
// UP+RIGHT+FIRE
    cmp #102
    bne !joy2check+

!joy2check:
// DOWN+LEFT+FIRE
    cmp #105
    bne !joy2check+

!joy2check:
// DOWN+RIGHT+FIRE
    cmp #101
    bne joy2check_end
    lda #$00
    ldx #$07
    jsr set_expression

joy2check_end:

    jmp mainloop
// END MAINLOOP
//////////////////////////////////////////////////

//////////////////////////////////////////////////
// ANIMATE SUBROUTINE
subroutine_animate: // Animations subroutine

    // do crying
    lda valentine_cry_status
    bne more_cry
    lda #$00
    sta SPRITE_2_Y
    sta SPRITE_3_Y
    inc SPRITE_3_Y
    jmp !animate+
more_cry:
    inc valentine_cry_status+1
    lda valentine_cry_status+1
    cmp #$30
    bne !animate+
    inc valentine_cry_status+2
    lda valentine_cry_status+2
    cmp #$01
    bne !animate+
    lda #$00
    sta valentine_cry_status+1
    sta valentine_cry_status+2

    lda valentine_cry_status+3
    bne tear_two
    inc SPRITE_2_Y
    lda SPRITE_2_Y
    bne !animate+
    inc valentine_cry_status+3
    lda #$68
    sta SPRITE_3_Y
tear_two:
    inc SPRITE_3_Y
    lda SPRITE_3_Y
    bne !animate+
    dec valentine_cry_status+3
    lda #$68
    sta SPRITE_2_Y

!animate:
    // do some glitchy looking stuff
    lda $d41b
    ldx VIC_RASTER_COUNTER
    cpx #80
    bcs end_glitch
    sta $400,x
    sta $0710,x
end_glitch:
    rts
// END ANIMATE
//////////////////////////////////////////////////

//////////////////////////////////////////////////
// SET EXPRESSION SUBROUTINE
// A = which eyes (0 will ignore redraw of eyes)
// X = which mouth (0 will ignore redraw of mouth)
set_expression:
    clc
    cmp #$00
    bne !set_expression_next+
    jmp set_exp_mouth
!set_expression_next:
    cmp #$01 // eyes $01
    bne !set_expression_next+
    lda #CLICKY_EYES_ZEROIZE
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_ZEROIZE
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$02 // eyes $02
    bne !set_expression_next+
    lda #CLICKY_EYES_MAD1_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_MAD1_RIGHT
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$03 // eyes $03
    bne !set_expression_next+
    lda #CLICKY_EYES_SMUG_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_SMUG_RIGHT
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$04 // eyes $04
    bne !set_expression_next+
    lda #CLICKY_EYES_BLINK
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_BLINK
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$05 // eyes $05
    bne !set_expression_next+
    lda #CLICKY_EYES_WORRIED_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_WORRIED_RIGHT
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$06 // eyes $06
    bne !set_expression_next+
    lda #CLICKY_EYES_X
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_X
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$07 // eyes $07
    bne !set_expression_next+
    lda #CLICKY_EYES_MAD2_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_MAD2_RIGHT
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$08 // eyes $08
    bne !set_expression_next+
    lda #CLICKY_EYES_V
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_POWER
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$09 // eyes $09
    bne !set_expression_next+
    lda #CLICKY_EYES_SAD_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_SAD_RIGHT
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$0A // eyes $0A
    bne !set_expression_next+
    lda #CLICKY_EYES_DOWN_RIGHT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_DOWN_RIGHT
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$0B // eyes $0B
    bne !set_expression_next+
    lda #CLICKY_EYES_UP_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_UP_LEFT
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$0C // eyes $0C
    bne !set_expression_next+
    lda #CLICKY_EYES_HEART
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_HEART
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$0D // eyes $0D
    bne !set_expression_next+
    lda #CLICKY_EYES_F_SLASH
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_B_SLASH
    sta SPRITE_1_POINTER
    jmp set_exp_mouth
!set_expression_next:
    cmp #$0E // eyes $0E
    bne !set_expression_next+
    lda #CLICKY_EYES_NOT_SURE
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_NOT_SURE
    sta SPRITE_1_POINTER
    jmp set_exp_mouth

set_exp_mouth:
    txa
    cmp #$00
    bne !set_expression_next+
    jmp end_set_expression

!set_expression_next:
    cmp #$01 // mouth clear
    bne !set_expression_next+
    DrawMouth(mouth_clear)
    jmp end_set_expression

!set_expression_next:
    cmp #$02 // mouth 2
    bne !set_expression_next+
    DrawMouth(mouth_one)
    jmp end_set_expression

!set_expression_next:
    cmp #$03 // mouth 3
    bne !set_expression_next+
    DrawMouth(mouth_two)
    jmp end_set_expression

!set_expression_next:
    cmp #$04 // mouth 4
    bne !set_expression_next+
    DrawMouth(mouth_three)
    jmp end_set_expression

!set_expression_next:
    cmp #$05 // mouth 5
    bne !set_expression_next+
    DrawMouth(mouth_four)
    jmp end_set_expression

!set_expression_next:
    cmp #$06 // mouth 6
    bne !set_expression_next+
    DrawMouth(mouth_five)
    jmp end_set_expression

!set_expression_next:
    cmp #$07 // mouth 7
    bne !set_expression_next+
    DrawMouth(mouth_small_line)
    jmp end_set_expression

!set_expression_next:
    cmp #$08 // mouth 8
    bne !set_expression_next+
    DrawMouth(mouth_smile)
    jmp end_set_expression

!set_expression_next:
    cmp #$09 // mouth 9
    bne !set_expression_next+
    DrawMouth(mouth_frown)
    jmp end_set_expression



!set_expression_next:
end_set_expression:
    rts
// END SET EXPRESSION SUBROUTINE
//////////////////////////////////////////////////

.macro DrawMouth(whichmouth) {
    ldx #$00
!mloop:
    lda whichmouth,x
    sta mouth_local_line,x
    lda whichmouth+9,x
    sta mouth_local_line+40,x
    lda whichmouth+18,x
    sta mouth_local_line+80,x
    inx
    cpx #$09
    bne !mloop-
}


//////////////////////////////////////////////////
// TABLES
color_table_offset:
.byte 0
characters_color_table:
.byte GREEN
.byte RED
.byte BLUE
.byte YELLOW
.byte PURPLE
.byte GRAY
.byte $ff
sprite_multicolor_0_table:
.byte GREEN
.byte RED
.byte BLUE
.byte YELLOW
.byte PURPLE
.byte GRAY
sprite_multicolor_1_table:
.byte LIGHT_GREEN
.byte LIGHT_RED
.byte LIGHT_BLUE
.byte ORANGE
.byte CYAN
.byte LIGHT_GRAY

mouth_clear:
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20

mouth_one:
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$40,$40,$40,$40,$40,$20,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20

mouth_two:
.byte $20,$49,$20,$20,$20,$20,$20,$55,$20
.byte $20,$4a,$40,$40,$40,$40,$40,$4b,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20

mouth_three:
.byte $20,$20,$55,$44,$44,$44,$49,$20,$20
.byte $20,$20,$42,$20,$20,$20,$42,$20,$20
.byte $20,$20,$6d,$44,$44,$44,$7d,$20,$20

mouth_four:
.byte $20,$20,$55,$43,$43,$43,$49,$20,$20
.byte $20,$3c,$73,$20,$20,$20,$6b,$3e,$20
.byte $20,$20,$4a,$43,$43,$43,$4b,$20,$20

mouth_five:
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$28,$55,$43,$49,$29,$20,$20
.byte $20,$20,$20,$4a,$43,$4b,$20,$20,$20

mouth_small_line:
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$40,$40,$40,$20,$20,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20

mouth_smile:
.byte $20,$70,$F8,$F8,$F8,$F8,$F8,$6E,$20
.byte $20,$42,$EA,$EA,$EA,$EA,$A0,$42,$20
.byte $20,$4a,$46,$46,$46,$46,$46,$4b,$20

mouth_frown:
.byte $20,$E9,$A0,$A0,$A0,$A0,$A0,$DF,$20
.byte $20,$A0,$69,$20,$20,$20,$5F,$A0,$20
.byte $20,$A0,$20,$20,$20,$20,$20,$A0,$20


// Decorations
halloween_scar_status:
.byte 0
halloween_scar:
.byte $20,$20,$20,$4d,$4e,$20,$20,$20,$20
.byte $20,$20,$4d,$4e,$4d,$20,$20,$20,$20
.byte $20,$4d,$4e,$4d,$20,$20,$20,$20,$20
.byte $20,$4e,$4d,$20,$20,$20,$20,$20,$20
halloween_scar_clear:
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $20,$20,$20,$20,$20,$20,$20,$20,$20

valentine_cry_status:
.byte 0,0,0,0,0

