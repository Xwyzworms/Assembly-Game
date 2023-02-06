    PROCESSOR 6502
    include "vcs.h"
    include "macro.h"
    SEG Code
    ORG $F000 ; Define the Origin of Cartridge
Start:
    CLEAN_START ; Clear RAM and TIA;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Start A new frame by turning ON VBLANK and VSYNC
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NextFrame:
    LDA #2 ; This turning ON binary %0000 0010
    STA VBLANK ; Turn on VBLANK;
    STA VSYNC ; Turn on VSYNC       

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Generate the three lines of VSYNC
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    STA WSYNC ; FirstScanLine
    STA WSYNC ; SecondScanLine
    STA WSYNC ; ThirdScanLine

    LDA #0; 
    STA VSYNC ; Turn OFF VSYNC

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Let TIA output the recommended 37 scanlines of VBLANK
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    LDX #37 ; store 37 decimal value into register X;
LoopVBlank:
    STA WSYNC ; Hit WSYNC and wait for the next scanline, Shoot the beam
    DEX ; decrement x;
    BNE LoopVBlank ; While x != 0

    ;; If Loop done, Turn off the VBlank
    LDA #0;
    STA VBLANK; Turn Off the VBlank

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Draw 192 Scanlines (Kernel)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    LDX #192 ; Counter for 192 visible scanlines

LoopVisible:
    STX COLUBK; Set the background color;
    STA WSYNC ; Wait for the next scanline
    DEX;
    BNE LoopVisible ; While (X != 0)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Output 30 more VBLANK lines ( Overscan) To complete the frame
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #2
    STA VBLANK ; Hit and turn on VBLANK
    
    LDX #30 ; Cntour for 30scanlinse
LoopOverscan:
    STA WSYNC ; Wait for the next scanline
    DEX ;
    bne LoopOverscan ; LoopWhile X != 0

    JMP NextFrame ; Go to the next frame;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Complete the ROM size to 4KB
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ORG $FFFC
    .word Start
    .word Start
    
    


