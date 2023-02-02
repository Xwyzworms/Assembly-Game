;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author : Xorose Lacknatas Ingradu Jernair
; Description : Arithmetic Logic
; DATE : Unknown 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PROCESSOR 6502
    SEG Code
    ORG $F000 ; Set the origin of the ROM COde at mem address $F000
Start:
    CLD ; Disabled the BCD Decimal Mode to avoid wrong arithmetic computation
    LDA #100 ; Load the register A with the literal decimal value of 100
    CLC ; ALWAYS CLEAR THE CARRY FLAG BEFORE Perform the addition
    ADC #5 ; Add the decimal value 5 to the Accumulator
    SEC ; ALWAYS SET THE CARRY FLAG BEFORE Substraction in the processor 6502
    SBC #10;  Register A should now have decimal value 95

    ORG $FFFC; End the ROM by adding required values to mem position #FFFC
    .word Start ; Put 2 bytes with the reset address at mem address $FFFC
    .word Start ; Put 2 Bytse with the break address at mem address $FFFE