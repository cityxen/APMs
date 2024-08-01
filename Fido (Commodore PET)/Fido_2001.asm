#import "../../Commodore_PET_Programming/include/Constants.asm"

.const FACE_DATA_PTR     = $54
.const FACE_DATA_PTR_LO  = $54
.const FACE_DATA_PTR_HI  = $55

*=$0401 "BASIC"
 :BasicUpstart($0415)
*=$0415

//////////////////////////////////////////////////
// START (DO SOME INITIALIZING HERE)
start:
    jsr draw_circle_face   

//////////////////////////////////////////////////
// MAINLOOP
mainloop:

////////////////
    jsr $ffe4 // Check keyboard
    clc
    beq mainloop
    jsr shift_chars
    jmp mainloop

!keycheck:
    jmp mainloop


shift_chars:

    lda #<SCREEN_RAM
    sta SCREEN_PTR_LO
    lda #>SCREEN_RAM
    sta SCREEN_PTR_HI
    ldy #$00

sc_loop: 
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
    bne sc_loop

    rts

draw_circle_face:
    lda #$93 // clear screen
    jsr $ffd2

    ldy #$00
    lda #<face_data
    sta FACE_DATA_PTR_LO
    lda #>face_data
    sta FACE_DATA_PTR_HI
    
    lda #<SCREEN_RAM
    sta SCREEN_PTR_LO
    lda #>SCREEN_RAM
    sta SCREEN_PTR_HI

dcf_loop:
    lda (FACE_DATA_PTR),y
    sta (SCREEN_PTR),y

    inc FACE_DATA_PTR_LO
    bne !+
    inc FACE_DATA_PTR_HI
!:
    inc SCREEN_PTR_LO
    bne !+
    inc SCREEN_PTR_HI
!:
    lda (FACE_DATA_PTR),y
    bne dcf_loop
    rts

face_data:
.encoding "screencode_upper"
.text "1234567890123456789012345678901234567890"
.text "                                        "
.text "1234567890123456789012345678901234567890"
.text "                                        "
.text "1234567890123456789012345678901234567890"
.text "                                        "
.text "1234567890123456789012345678901234567890"
.text "                                        "
.text "      TEST                              "
.text "          TEST                          "
.text "              TEST                      "
.text "                  TEST                  "
.text "                      TEST              "
.text "                          TEST          "
.text "                              TEST      "
.text "                                        "
.text "1234567890123456789012345678901234567890"
.text "                                        "
.text "1234567890123456789012345678901234567890"
.text "                                        "
.text "1234567890123456789012345678901234567890"
.text "                                        "
.text "1234567890123456789012345678901234567890"
.text "1234567890123456789012345678901234567890"
.text "1234567890123456789012345678901234567890"
.byte 0
       