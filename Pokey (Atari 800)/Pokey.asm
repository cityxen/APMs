;//////////////////////////////////////////////////////////////////////////////////////
;// Pokey by Deadline
;//////////////////////////////////////////////////////////////////////////////////////
;//
;// Pokey is the Atari 8 bit line digital puppet
;// 
;//////////////////////////////////////////////////////////////////////////////////////
;//  MADS assembler is required
;//  http://mads.atari8.info/
;//  https://github.com/tebe6502/Mad-Assembler/releases
;// 
;// History:
;// 
;// September 13, 2020
;//      - Added Pokey.asm
;//
;//////////////////////////////////////////////////////////////////////////////////////

 	org $2000	;Start of code block

start
	jsr setscreenram
	jsr drawgoggles
	
loop
    lda $d40b	;Load VCOUNT
	sta $d40a
	
	adc #$30
	sta $d01a	;Change background color


	; KEYBOARD SCAN ROUTINE
	; // https://www.atariarchives.org/c3ba/page004.php (keyboard scan codes)


	jsr seteyeleftram
	lda $02FC ; get last key pressed

	; cmp #31 ; 1
	; cmp #30 ; 2
	; cmp #26 ; 3
	; cmp #24 ; 4
	; cmp #29 ; 5
	; cmp #27 ; 6
	; cmp #51 ; 7
	; cmp #53 ; 8
	; cmp #48 ; 9
	; cmp #50 ; 0


; // EYES KEYS 
	cmp #47 ; Q (Regular    O   O   )
	bne gke2
	ldy #41
	lda #47
	sta ($01),y
	ldy #50
	lda #47
	sta ($01),y
	jmp endkeys
	
gke2
	cmp #46 ; W (Worried Look /  \)
	bne gke3

	; Toggle
	inc worried
	lda worried
	and #$01
	beq worryoff
worryon
	ldy #0
	lda #70
	sta ($01),y
	ldy #11
	lda #71
	sta ($01),y
	jmp endkeys
worryoff
	ldy #0
	lda #0
	sta ($01),y
	ldy #11
	lda #0
	sta ($01),y
	jmp endkeys

	
gke3
	cmp #42 ; E (Blink   -  -  )
	bne gke4
	ldy #41
	lda #82
	sta ($01),y
	ldy #50
	lda #82
	sta ($01),y
	jmp endkeys

gke4
	cmp #40 ; R (Look Left <  <  )
	bne gke5
	ldy #41
	lda #30
	sta ($01),y
	ldy #50
	lda #30
	sta ($01),y
	jmp endkeys

gke5
	cmp #45 ; T (Look Right >  > )
	bne gke6
	ldy #41
	lda #28
	sta ($01),y
	ldy #50
	lda #28
	sta ($01),y
	jmp endkeys

gke6
	cmp #43 ; Y
	bne gke7
	ldy #41
	lda #33
	sta ($01),y
	ldy #50
	lda #34
	sta ($01),y
	jmp endkeys

gke7
	; cmp #11 ; U
	; cmp #13 ; I
	; cmp #8  ; O
	; cmp #10 ; P

	; cmp #54 ; <
	; cmp #55 ; >
	; cmp #52 ; DEL
	; cmp #14 ; -
	; cmp #15 ; =
	; cmp #12 ; RETURN
	; cmp #2  ; ;
	; cmp #6  ; +
	; cmp #7  ; *
	; cmp #60 ; CAPS
	; cmp #33 ; SPACE
	; cmp #28 ; ESC
	; cmp #44 ; TAB


	; //// MOUTH KEYS
	cmp #63 ; A
	bne gkp2
	jsr drawmouth1

gkp2
	cmp #62 ; S
	bne gkp3
	jsr drawmouth2
	jmp endkeys

gkp3
	cmp #58 ; D
	bne gkp4
	jsr drawmouth3
	jmp endkeys

gkp4
	cmp #56 ; F
	bne gkp5
	jsr drawmouth4
	jmp endkeys

gkp5
	cmp #61 ; G
	bne gkp6
	jsr drawmouth5
	jmp endkeys

gkp6
	cmp #57 ; H
	bne gkp7
	jsr drawmouth6
	jmp endkeys

gkp7

	; cmp #1  ; J
	; cmp #5  ; K
	; cmp #0  ; L

endkeys
	lda #$00
	sta $02FC

	jmp loop

; /////////////////////// DRAW MOUTHS
drawmouth1
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

drawmouth2
	ldx #$00
	ldy #$00
dmmx2
	jsr setmouthram
	lda mouth2,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth2+8,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth2+16,x
	sta ($01),y
	iny
	inx
	cpx #$08
	bne dmmx2
	rts

drawmouth3
	ldx #$00
	ldy #$00
dmmx3
	jsr setmouthram
	lda mouth3,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth3+8,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth3+16,x
	sta ($01),y
	iny
	inx
	cpx #$08
	bne dmmx3
	rts	

drawmouth4
	ldx #$00
	ldy #$00
dmmx4
	jsr setmouthram
	lda mouth4,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth4+8,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth4+16,x
	sta ($01),y
	iny
	inx
	cpx #$08
	bne dmmx4
	rts	

drawmouth5
	ldx #$00
	ldy #$00
dmmx5
	jsr setmouthram
	lda mouth5,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth5+8,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth5+16,x
	sta ($01),y
	iny
	inx
	cpx #$08
	bne dmmx5
	rts	

drawmouth6
	ldx #$00
	ldy #$00
dmmx6
	jsr setmouthram
	lda mouth6,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth6+8,x
	sta ($01),y
	lda $01
	adc #40
	sta $01
	lda mouth6+16,x
	sta ($01),y
	iny
	inx
	cpx #$08
	bne dmmx6
	rts		

; /////////////////////// DRAW GOGGLES

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

; /////////////////////// SET MEMORY LOCATIONS

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

seteyeleftram
	jsr setgoggleram
	clc
	lda $01
	adc #43
	sta $01
	bcc selr2
	inc $02
selr2
	rts

mouth1 ; no mouth
.byte 00,00,00,00,00,00,00,00
.byte 00,00,00,00,00,00,00,00
.byte 00,00,00,00,00,00,00,00

mouth2 ; smile
.byte 00,00,00,00,00,00,00,00
.byte 00,86,00,00,00,00,66,00
.byte 00,71,78,78,78,78,70,00

mouth3 ; line
.byte 00,00,00,00,00,00,00,00
.byte 00,00,78,78,78,78,00,00
.byte 00,00,00,00,00,00,00,00

mouth4 ; talk 1
.byte 00,78,78,78,78,78,78,00
.byte 00,86,00,00,00,00,66,00
.byte 00,71,78,78,78,78,70,00

mouth5 ; talk 2
.byte 00,00,00,00,00,00,00,00
.byte 00,00,70,77,77,71,00,00
.byte 00,00,71,78,78,70,00,00

mouth6 ; talk 3
.byte 00,00,00,00,00,00,00,00
.byte 00,00,28,70,71,30,00,00
.byte 00,00,00,71,70,00,00,00

goggles
.byte 70,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,71
.byte 86,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,66
.byte 86,00,00,00,47,00,00,00,00,00,00,00,00,47,00,00,00,66
.byte 86,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,66
.byte 71,78,78,78,78,78,78,70,77,77,71,78,78,78,78,78,78,70

worried
.byte 0

	run start	;Define run address