    Processor 6502
    SEG Code
    ORG $F000;
Start:

    LDA #$15 ; Load the register A with  literal Decimal value 15\
    TAX ; Transfer the value from register A to register X
    TAY ; Transfer the value from register A to register Y
    TXA ; Transfer the value from register X to register A
    TYA ; Transfer the value from register Y to register A

    LDX #6 ; Load the x With the decimal value of 6
    ;;; Transfer the X to y , There's no TXY and TYX thus we need to use Accumulator
    TXA ;
    TAY ;
    ;;;
    ORG $FFFC
    .word Start ; 
    .word Start 