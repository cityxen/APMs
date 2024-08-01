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
// August 1, 2024
//      - Added HAL 2001 Mode
//      - Also created Commodore PET Programming repo
//
// October 22, 2021:
//      - Added Power Pack Face mode
//
// September 13, 2020
//      - Added Fido.asm
//
//////////////////////////////////////////////////////////////////////////////////////

#import "../../Commodore_PET_Programming/include/Constants.asm"
#import "../../Commodore_PET_Programming/include/DrawPetMateScreenPET.asm"

.const eye_left         = SCREEN_RAM+135+160
.const eye_right        = SCREEN_RAM+145+160
.const mouth            = SCREEN_RAM+536

//////////////////////////////////////////////////////////////////////////////////////
// File stuff
.file [name="fido.prg", segments="Main"]
.disk [filename="fido.d64", name="CITYXEN FIDO", id="2020!" ] {
	[name="FIDO", type="prg",  segments="Main"],
}
//////////////////////////////////////////////////////////////////////////////////////
.segment Main [allowOverlap]

*=BASIC_START "BASIC"
 :BasicUpstart(BASIC_START+$20)
*=BASIC_START+$20

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

hal_mode:
.byte 0
hal_mode_shift:
.byte 0
hal_mode_shift_dir:
.byte 0
.const hal_mode_max_shift = $03
.const hal_mode_max_shift_2 = $06

//////////////////////////////////////////////////
// MAINLOOP
mainloop:

    jsr do_hal_mode

////////////////
    jsr $ffe4 // Check keyboard
    clc
    beq mainloop

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

*/

!keycheck:
    cmp #$31 // 1
    bne !keycheck+
    lda #$30
    jsr draw_eyes_2
    jmp mainloop
!keycheck:
    cmp #$32 // 2
    bne !keycheck+
    lda #$3F
    jsr draw_eyes_2
    jmp mainloop

/*
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
    */

!keycheck:
    cmp #$39 // 9
    bne !keycheck+
    
    jmp mainloop


!keycheck:
    cmp #$30 // 0
    bne !keycheck+
    jsr go_hal_mode
    jmp mainloop

!keycheck: // P
    cmp #$50
    bne !keycheck+
    DrawPetMateScreen(power_pack_face)
    jmp mainloop

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
draw_eyes_2:
    sta eye_left
    sta eye_right
    rts

draw_power_pack_face:
    DrawPetMateScreen(power_pack_face)
    rts

go_hal_mode:
    lda #$01
    sta hal_mode
    DrawPetMateScreen(hal2001)
    rts


hal_shift_chars_up:
    lda #<SCREEN_RAM
    sta SCREEN_PTR_LO
    lda #>SCREEN_RAM
    sta SCREEN_PTR_HI
    ldy #$00
hscu_loop: 
    lda (SCREEN_PTR),y
    cmp #$20
    beq !+
    adc #$01
    sta (SCREEN_PTR),y
!:
    inc SCREEN_PTR_LO
    bne !+
    inc SCREEN_PTR_HI
!:
    lda SCREEN_PTR_HI
    cmp #$84
    bne hscu_loop
    rts    

hal_shift_chars_down:
    lda #<SCREEN_RAM
    sta SCREEN_PTR_LO
    lda #>SCREEN_RAM
    sta SCREEN_PTR_HI
    ldy #$00
hscd_loop: 
    lda (SCREEN_PTR),y
    cmp #$20
    beq !+
    sbc #$01
    sta (SCREEN_PTR),y
!:
    inc SCREEN_PTR_LO
    bne !+
    inc SCREEN_PTR_HI
!:
    lda SCREEN_PTR_HI
    cmp #$84
    bne hscd_loop
    rts

do_hal_mode:
    lda hal_mode
    beq dhmx
    inc hal_mode_shift_dir
    lda hal_mode_shift_dir
    and #$01
    bne !+
    rts
!:

    lda hal_mode_shift
    cmp #hal_mode_max_shift
    bcs !+
    inc hal_mode_shift
    jsr hal_shift_chars_up
    jmp dhmx
!:
    jsr hal_shift_chars_down
    inc hal_mode_shift
    lda hal_mode_shift
    cmp #hal_mode_max_shift_2
    beq dhmx
    lda #$00
    sta hal_mode
    sta hal_mode_shift
    sta hal_mode_shift_dir
dhmx:
    rts

#import "mouthdata.asm"
#import "petmate_screens/f1d0-hal-2001.asm"
#import "petmate_screens/f1d0-pp-face.asm"

