    PROCESSOR 6502 
    SEG Code ; Define new Segment name code;
    ORG $F000 ; Define the Origin of the ROM code at mem addres $F000
Start: 
    LDA #$A; Load the A register with the hexadecimal value $A
    LDX #%11111111 ; Load the Register X with the binary Value 11111111

    STA $80; Store the value in the A register into mem address $80
    STX $81; Store the value in the X Register into mem address $81;

    ORG $FFFC ; End the ROM by adding the required values to memory position : $FFFC
    .word Start
    .word Start 