

	SECTION	code_graphics

	PUBLIC	drawb
	PUBLIC	_drawb
	PUBLIC	___drawb

	EXTERN commonbox
        EXTERN plot

;void  drawb(int x, int y, int w, int h) __smallc
;Note ints are actually uint8_t
drawb:
_drawb:
___drawb:
	ld	hl,plot
	jp	commonbox
