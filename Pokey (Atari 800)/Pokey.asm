;//////////////////////////////////////////////////////////////////////////////////////
;// Pokey by Deadline
;//////////////////////////////////////////////////////////////////////////////////////
;//
;// Pokey is the Atari 8 bit line digital puppet
;// 
;//////////////////////////////////////////////////////////////////////////////////////
;// 
;// History:
;// 
;// September 13, 2020
;//      - Added Pokey.asm
;//
;//////////////////////////////////////////////////////////////////////////////////////
;// screenmem  = 40000

 	org $2000	;Start of code block

start
	jsr setscreenram
	jsr drawgoggles
	
loop

	; lda $2fc ;	sta screenmem+2

	;jsr incit
	;inc $5000

    lda $d40b	;Load VCOUNT
	sta $d40a
	;and $5001
	adc #$30
	sta $d01a	;Change background color


	jsr drawmouth
	jmp loop

; /////////////////////// DRAW MOUTH
drawmouth
	ldx #$00
	ldy #$00
dmmx
	jsr setmouthram
	lda mouth1,x
	sta ($01),y

	lda $01
	adc #40
	sta $01

	lda mouth1+8,x
	sta ($01),y

	lda $01
	adc #40
	sta $01

	lda mouth1+16,x
	sta ($01),y

	iny
	inx
	cpx #$08
	bne dmmx
	rts


drawgoggles
	ldx #$00
	ldy #$00
dg1
	
	jsr setgoggleram
	lda goggles,x
	sta ($01),y

	lda $01
	adc #39
	sta $01	

	lda goggles+18,x
	sta ($01),y

	lda $01
	adc #40
	sta $01	

	lda goggles+18+18,x
	sta ($01),y

	lda $01
	adc #40
	sta $01	

	lda goggles+18+18+18,x
	sta ($01),y
	
	lda $01
	adc #40
	sta $01

	lda goggles+18+18+18+18,x
	sta ($01),y

	iny
	inx
	cpx #18 
	bne dg1

	rts

incit
	clc
	inc $5000
	lda $5000
	cmp #$ff
	beq moincit
	rts

moincit 
    lda #$00
    sta $5000
    inc $5001
    rts	
        
    run start	;Define run address


setscreenram
	lda 88
	sta $01
	lda 89
	sta $02
	; Get rid of wierd space thing
	ldy #$02
	lda #$00
	sta ($01),y
	rts

setmouthram
	lda 88
	adc #24
	sta $01
	lda 89
	adc #$02
	sta $02

	; // mouthstart = screenmem+536
	; //                      - 512
	; //                        24
	;

	rts

setgoggleram
	lda 89
	sta $02
	clc
	lda 88
	adc #211
	sta $01
	bcs sgr2
	rts
sgr2
	inc $02	
	; // gogglesmem = screenmem+211
	rts

; 61 = ^
; 62 = underscore
; 63 = HEART
; 64 = |-
; 65 =  |
; 66 = corner left up
; 67 =  -|
; 68 = corner left down
; 69 = /
; 70 = \
; 71 = right wedge
; 72 = bot right block
; 73 = left wedge
; 74 = top right block
; 75 = top left block
; 76 = line top
; 77 = line bottom
; 78 = bot left block
; 79 = CLUBS
; 80 = corner right down
; 81 = line middle
; 82 = CROSS line
; 83 = CIRCLE
; 84 = BLOCK BIG bottom
; 85 = line left
; 86 = 

mouth1
.byte 00,00,00,00,00,00,00,00
.byte 00,86,00,00,00,00,00,86
.byte 00,71,78,78,78,78,70,00

mouth2
.byte 0,0,0,0,0,0,0
.byte 0,0,0,0,0,0,0
.byte 0,0,0,0,0,0,0

mouth3
.byte 0,0,0,0,0,0,0
.byte 0,0,0,0,0,0,0
.byte 0,0,0,0,0,0,0

goggles
;      0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
.byte 70,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,71
.byte 86,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,66
.byte 86,00,00,00,47,00,00,00,00,00,00,00,00,47,00,00,00,66
.byte 86,00,00,00,00,00,00,00,78,78,00,00,00,00,00,00,00,66
.byte 71,78,78,78,78,78,78,70,00,00,71,78,78,78,78,78,78,70

