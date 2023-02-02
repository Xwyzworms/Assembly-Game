;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author : Xorose Lacknatas Ingradu Jernair
; Description : Increment and Decrement Structure of data
; DATE : Unknown 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PROCESSOR 6502
    SEG Code ; Define a new segment name "Code"
    ORG $F000
Start:
    LDA #1 ; Load the Register A with the decimal value 1
    LDX #2 ; Load the register X with the decimal value 2 
    LDY #3 ; Load the register Y with the decimal value 3

    INX ; Increment X
    INY ; Increment Y
    CLC; Clear the Carry flag
    ADC #1; Add the Accumulator by 1

    DEX ; Decrement X
    DEY ; Decrement Y
    SEC ; Set Carry Flag before substraction
    SBC #1; Substract the ACcumulator by 1;

    ORG $FFFC
    .word Start ; Put 2 bytes with reset address at mem position $FFFC
    .word Start ; Put 2 Bytes with reset address at mem position $FFFE