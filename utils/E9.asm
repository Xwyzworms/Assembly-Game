    PROCESSOR 6502
    SEG Code
    ORG $F000

Start:
    LDA #1 ; Init register A with the decimal Value of 1

MainLoop:
    CLC ; Clear the Carry Flag first, to do addition
    ADC #1; ADd the literal value of 1
    CMP #10 ; Compare Current value with 
    BNE MainLoop ; Back to mainLoop if the cmp was not equal to zero

    .org $FFFC
    .word Start
    .word Start


