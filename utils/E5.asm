;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author : Xorose Lacknatas Ingradu Jernair
; Description : Arithmetic Logic Using the stored data at some mem addr
; DATE : Unknown 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PROCESSOR 6502
    SEG Code
    ORG $F000 ; Set the origin address to $F000
Start:
    LDA #$A; Load the register A with the Literal hexadecimal A
    LDX #%1010 ; Load the register X with the Binary value %1010

    STA $80; Store the value in the A register into ( Zero page ) Mem addr $80
    STX $81; Store the value  in the A register into ( Zero page) mem addr $81

    LDA #10 ; Load the register A with the literal decimal value 10;
    CLC ; Clear Carry Flag;
    ADC $80; Get the Content of the mem addr $80;
    CLC ; Clear Carry Flag; 
    ADC $81; Get the content of the mem addr $81

    STA $82; Store the value a into RAM POSITION $82;

    org $FFFC ; End the Rom By Adding required values  to mem position $FFFC
    .word Start ; Put 2 Bytes with the reset  addres at mem position #FFFC
    .word Start ; Put 2 Bytes with the  reset address at mem position #FFFE
