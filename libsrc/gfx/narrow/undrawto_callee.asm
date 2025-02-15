; ----- void __CALLEE__ undrawto(int x2, int y2)


  IF    !__CPU_INTEL__&!__CPU_GBZ80__
        SECTION code_graphics

        PUBLIC  undrawto_callee
        PUBLIC  _undrawto_callee
        PUBLIC  asm_undrawto


        EXTERN  swapgfxbk
        EXTERN  __graphics_end

        EXTERN  Line
        EXTERN  respixel

        EXTERN  __gfx_coords
        INCLUDE "graphics/grafix.inc"


undrawto_callee:
_undrawto_callee:
        pop     af                      ; ret addr
        pop     de                      ; y2
        pop     hl
        ld      d, l                    ; x2
        push    af                      ; ret addr

asm_undrawto:
        ld      hl, (__gfx_coords)
        push    ix
    IF  NEED_swapgfxbk=1
        call    swapgfxbk
    ENDIF
        push    hl
        push    de
        call    respixel
        pop     de
        pop     hl
        ld      ix, respixel
        call    Line
    IF  NEED_swapgfxbk
        jp      __graphics_end
    ELSE
      IF    !__CPU_INTEL__&!__CPU_GBZ80__
        pop     ix
      ENDIF
        ret
    ENDIF

  ENDIF
