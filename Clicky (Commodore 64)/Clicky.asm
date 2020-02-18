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
// 
//////////////////////////////////////////////////////////////////////////////////////
#import "../Commodore64_Programming/include/Constants.asm"
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
check_space_hit: // DEFAULT EXPRESSION
    cmp #$20
    bne check_q_hit
    lda #CLICKY_EYES_ZEROIZE
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_ZEROIZE
    sta SPRITE_1_POINTER
    jmp mainloop
check_q_hit:
    cmp #$51
    bne check_w_hit
    lda #CLICKY_EYES_MAD1_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_MAD1_RIGHT
    sta SPRITE_1_POINTER
    jmp mainloop
check_w_hit:
    cmp #$57
    bne check_e_hit
    lda #CLICKY_EYES_SMUG_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_SMUG_RIGHT
    sta SPRITE_1_POINTER
    jmp mainloop
check_e_hit:
    cmp #$45
    bne check_r_hit
    lda #CLICKY_EYES_BLINK
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_BLINK
    sta SPRITE_1_POINTER
    jmp mainloop
check_r_hit:
    cmp #$52
    bne check_1_hit
    lda #CLICKY_EYES_WORRIED_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_WORRIED_RIGHT
    sta SPRITE_1_POINTER
    jmp mainloop
check_1_hit:
    cmp #$31
    bne check_2_hit
    lda #CLICKY_EYES_X
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_X
    sta SPRITE_1_POINTER
    jmp mainloop
check_2_hit:
    cmp #$32
    bne check_3_hit
    lda #CLICKY_EYES_MAD2_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_MAD2_RIGHT
    sta SPRITE_1_POINTER
    jmp mainloop
check_3_hit:
    cmp #$33
    bne check_4_hit
    lda #CLICKY_EYES_V
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_POWER
    sta SPRITE_1_POINTER
    jmp mainloop
check_4_hit:
    cmp #$34
    bne check_5_hit
    lda #CLICKY_EYES_SAD_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_SAD_RIGHT
    sta SPRITE_1_POINTER
    jmp mainloop
check_5_hit:
    cmp #$35
    bne check_6_hit
    lda #CLICKY_EYES_DOWN_RIGHT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_DOWN_RIGHT
    sta SPRITE_1_POINTER
    jmp mainloop
check_6_hit:
    cmp #$36
    bne check_7_hit
    lda #CLICKY_EYES_UP_LEFT
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_UP_LEFT
    sta SPRITE_1_POINTER
    jmp mainloop
check_7_hit:
    cmp #$37
    bne check_8_hit
    lda #CLICKY_EYES_HEART
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_HEART
    sta SPRITE_1_POINTER
    jmp mainloop
check_8_hit:
    cmp #$38
    bne check_9_hit
    lda #CLICKY_EYES_F_SLASH
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_B_SLASH
    sta SPRITE_1_POINTER
    jmp mainloop
check_9_hit:
    cmp #$39
    bne check_0_hit
    lda #CLICKY_EYES_NOT_SURE
    sta SPRITE_0_POINTER
    lda #CLICKY_EYES_NOT_SURE
    sta SPRITE_1_POINTER
    jmp mainloop
check_0_hit:
check_a_hit: // clear mouth
    cmp #$41
    bne check_s_hit
    ldx #$00
!mloop:
    lda #$20
    sta mouth_local_line,x
    sta mouth_local_line+40,x
    sta mouth_local_line+80,x
    inx
    cpx #$09
    bne !mloop-
    jmp mainloop
check_s_hit:
    cmp #$53
    bne check_d_hit
    ldx #$00
!mloop:
    lda mouth_one,x
    sta mouth_local_line,x
    lda mouth_one+9,x
    sta mouth_local_line+40,x
    lda mouth_one+18,x
    sta mouth_local_line+80,x
    inx
    cpx #$09
    bne !mloop-    
    jmp mainloop
check_d_hit:
    cmp #$44
    bne check_f_hit
    ldx #$00
!mloop:
    lda mouth_two,x
    sta mouth_local_line,x
    lda mouth_two+9,x
    sta mouth_local_line+40,x
    lda mouth_two+18,x
    sta mouth_local_line+80,x
    inx
    cpx #$09
    bne !mloop-
    jmp mainloop
check_f_hit:
    cmp #$46
    bne check_g_hit
    ldx #$00
!mloop:    
    lda mouth_three,x
    sta mouth_local_line,x
    lda mouth_three+9,x
    sta mouth_local_line+40,x
    lda mouth_three+18,x
    sta mouth_local_line+80,x
    inx
    cpx #$09
    bne !mloop-
    jmp mainloop
check_g_hit:
    cmp #$47
    bne check_h_hit
    ldx #$00
!mloop:    
    lda mouth_four,x
    sta mouth_local_line,x
    lda mouth_four+9,x
    sta mouth_local_line+40,x
    lda mouth_four+18,x
    sta mouth_local_line+80,x
    inx
    cpx #$09
    bne !mloop-
    jmp mainloop
check_h_hit:
    cmp #$48
    bne check_j_hit
    ldx #$00
!mloop:    
    lda mouth_five,x
    sta mouth_local_line,x
    lda mouth_five+9,x
    sta mouth_local_line+40,x
    lda mouth_five+18,x
    sta mouth_local_line+80,x
    inx
    cpx #$09
    bne !mloop-
    jmp mainloop
check_j_hit:
//////////////////////////////////////////////////
// F1 (toggle frankenstein type scar on Clicky's face)
check_f1_hit:
    cmp #$85
    bne check_f2_hit
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
check_f2_hit:
    cmp #$89
    bne check_f3_hit
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
check_f3_hit:
    cmp #$86
    bne check_f4_hit
    jmp mainloop
//////////////////////////////////////////////////
// F4
check_f4_hit:
    cmp #$8a
    bne check_f5_hit
    jmp mainloop
//////////////////////////////////////////////////
// F5
check_f5_hit:
    cmp #$87
    bne check_f6_hit
    jmp mainloop
//////////////////////////////////////////////////
// F6
check_f6_hit:
    cmp #$8b
    bne check_f7_hit
    jmp mainloop
//////////////////////////////////////////////////
// F7 Increment color being used
check_f7_hit:
    cmp #$88
    bne check_f8_hit
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
check_f8_hit:
    cmp #$89
    bne end_keyboard_checks
    jmp mainloop
end_keyboard_checks:
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
    sta $710,x
end_glitch:
    rts
// END ANIMATE
//////////////////////////////////////////////////

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

