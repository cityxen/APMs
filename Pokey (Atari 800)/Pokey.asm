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

screenmem  = 40000
mouthstart = screenmem+645
gogglesmem = screenmem+208

 	org $2000	;Start of code block

start	

	jsr drawgoggles
	
loop	
	;jsr incit
	;inc $5000

    ;lda $d40b	;Load VCOUNT
	;sta $d40a
	;and $5001
	;sta $d01a	;Change background color

	;cmp #$20
	;bcc loop2
    ;lda #$00		;Disable screen DMA
	;sta 559

; loop2
	; cmp #$c0
	; bcs loop3
	; lda #$ff
	; sta 559

; loop3

	jsr drawmouth
	jmp loop

drawmouth
	;lda #$ff
	;sta 559
	inc screenmem+120

	ldx #$00
dmmx
	inx
	cpx #$08
	lda mouth1,x
	sta mouthstart,x
	lda mouth1+7,x
	sta mouthstart+48,x
	lda mouth1+15,x
	sta mouthstart+96,x
	bne dmmx

	;lda #$00
	;sta 559
	
	rts


drawgoggles
	ldx #$00
dg1
	lda goggles,x
	sta gogglesmem,x

	lda goggles+18,x
	sta gogglesmem+48,x

	lda goggles+18+18,x
	sta gogglesmem+48+48,x

	lda goggles+18+18+18,x
	sta gogglesmem+48+48+48,x

	lda goggles+18+18+18+18,x
	sta gogglesmem+48+48+48+48,x

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
.byte 71,72,73,74,75,76,77
.byte 8,9,10,11,12,13,14
.byte 15,16,17,18,19,21,22

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

