    PROCESSOR 6502

    include "vcs.h"
    include "macro.h"

    SEG code
    ORG $F000 ;; Define the origin of the ROM 

START:
    CLEAN_START ; MACRO to safely clear the memory ( 255 Bytes )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set Background luminosity color to yellow
;; https://en.wikipedia.org/wiki/List_of_video_game_console_palettes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA  #$71; Load color into A ($1E, ntSC Yellow ( hue, luma))
    STA COLUBK ; Store A to Background mem addres $09 , COLOUBK is alias

    jmp START ; Repeat From START;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FILL RoM SIZE to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    org $FFFC ; defines the origin to $FFFC
    .word START ; Reset Vector at FFFC WHere program start; 
    .word START ; unused in VCS
