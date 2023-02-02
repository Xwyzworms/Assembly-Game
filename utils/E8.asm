;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author : Xorose Lacknatas Ingradu Jernair
; Description : Loop 
; DATE : Unknown 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PROCESSOR 6502
    SEG Code
    ORG #F000;
Start:
    LDY #10;
MainLoop:
    TYA; Transfer y to A, 
    STA $80,Y; Store the value in A inside the mem position $80+y
    DEY;
    BNE MainLoop

    org $FFFC
    .word Start
    .word Start
