;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author : Xorose Lacknatas Ingradu Jernair
; Description : Increment and Decrement Based on the mem addr 
; DATE : Unknown 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PROCESSOR 6502
    SEG Code
    ORG $F000

Start:
    LDA #10 ;Load the Register A with the literal decimal 10
    STA $80 ; Store the value To mem position $80;

    ;;; Much more faster compare with adding it Manually
    
    INC $80 ; Increment the value inside a (Zero page) memory position $80
    DEC $80 ; Decrement the value inside a (Zero page) memory positioin $80

    ORG $FFFC ; End the ROM , by adding 4 Bytes
    .word Start ; Put 2 Bytes with reset addr at mem position $FFFC
    .word Start ; Put 2 Bytes with break addr at mem position $FFFE