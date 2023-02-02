    PROCESSOR 6502
    seg Code ; Define new Segment Code
    
    ORG $F000 ; Mendefinisikan origin of the ROM code at mem address $F000
Start:
    LDA #$82 ; # Load the A Register with the LITERAL HEXADECIMAL $82
    LDX #82 ;  Load the X Register with the LITERAL DECIMAL $82
    LDY $82 ;  Load the Y Register with the value inside the mem address $82;

    ORG $FFFC ; End the ROM by adding Requireed values to mem position $FFFC
    .word Start ;put 2 bytes with the reset address at memory position $FFFC
    .word Start ;put 2 bytes with the break address at memory position $FFFE

