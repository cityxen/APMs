
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

    ;jsr incit
	;inc $5000
	;and $5001