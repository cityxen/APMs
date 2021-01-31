;//////////////////////////////////////////////////////////////////////////////////////
;// Apollol by Deadline
;//////////////////////////////////////////////////////////////////////////////////////
;//
;// Apollol is the Apple II e digital puppet
;// 
;//////////////////////////////////////////////////////////////////////////////////////
;//  VASM 6502 Required
;// http://www.ibaug.de/vasm/vasm6502.zip
;// 
;// History:
;// 
;// January 28, 2021
;//      - Added Apollol.asm
;//
;//////////////////////////////////////////////////////////////////////////////////////

NewLine equ $FC62	;CR - Carriage Return to Screen

	ORG $0C00	;Program Start
	
	jsr NewLine			;Start a new line

	lda #>HelloWorld
	sta $41
	lda #<HelloWorld
	sta $40
	jsr PrintStr

	lda #>HelloWorld1
	sta $41
	lda #<HelloWorld1
	sta $40
	jsr PrintStr

	lda #>HelloWorld2
	sta $41
	lda #<HelloWorld2
	sta $40
	jsr PrintStr

	lda #>HelloWorld3
	sta $41
	lda #<HelloWorld3
	sta $40
	jsr PrintStr

	lda #>HelloWorld4
	sta $41
	lda #<HelloWorld4
	sta $40
	jsr PrintStr
	lda #0

	lda #>HelloWorld5
	sta $41
	lda #<HelloWorld5
	sta $40
	jsr PrintStr

	lda #>HelloWorld6
	sta $41
	lda #<HelloWorld6
	sta $40
	jsr PrintStr
	
	lda #>HelloWorld7
	sta $41
	lda #<HelloWorld7
	sta $40
	jsr PrintStr

	lda #>HelloWorld8
	sta $41
	lda #<HelloWorld8
	sta $40
	jsr PrintStr
loop:
	jmp loop
	rts
	
HelloWorld:				;255 terminated string
	db "Do you remember? ",255
HelloWorld1:				;255 terminated string
	db "the old days? ",255
HelloWorld2:				;255 terminated string
	db "How we used to have fun. ",255	
HelloWorld3:				;255 terminated string
	db "How we played in the ",255		
HelloWorld4:				;255 terminated string
	db "backyard. ",255			
HelloWorld5:				;255 terminated string
	db "You would throw that ",255			
HelloWorld6:				;255 terminated string
	db "stick. I would go get ",255				
HelloWorld7:				;255 terminated string
	db "it. You petted me and ",255
HelloWorld8:				;255 terminated string
	db "called me a good boy. ",255				
	
	
PrintChar:
	pha
		clc
		adc #128		;Correction for weird character map!
		jsr $FDF0		;COUT1 - Output Character to Screen
	pla
	rts
	
				

PrintStr:
	ldy #0				;Set Y to zero
PrintStr_again:
	lda ($40),y			;Load a character from addr in $20+Y 
	
	cmp #255			;If we got 255, we're done
	beq PrintStr_Done
	
	jsr PrintChar		;Print Character
	iny					;Inc Y and repeat
	jmp PrintStr_again
PrintStr_Done:
	rts	

