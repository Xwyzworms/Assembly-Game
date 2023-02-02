    processor 6502 ; You do need to define this

    seg code
    org $F000 ; Define the code origin at $F000

Start:
    SEI ; Disable Interrups
    CLD ; Disable the BCD decimal math mode
    LDX #$FF; Load the register X with #$FF
    TXS ; TRANSFER the X register to the ( Stack ) pointer  // Set the pointer to FF
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Region ( $00 to $FF ) 
; Maksudnya clear the entiner RAM and TIA Register
; Ram
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    LDA #0 ; Load Register A with #0 A = 0
    LDX #$FF ; Load Register X with #$FF ( Immediate ) X = #$FF
    STA $FF ; We do know A is zero Right, then we store that value in Memory $FF
MEMLOOP:
    ;;; Awalnya kita tau value di register X itu kan #$FF ya, terus kita 
    dex ; Decrement x
    STA $0,X ; Store the value of A inside memory address $0 + x
    BNE MEMLOOP; Loop until x is equal to ZERO ( while z-flag != 0 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   FILL THE ROM size to 4KB  ( Required by the processor 6502 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

     org $FFFC ;; FIlle the starting, $FFFC and $ FFFD , also $FFFE and $FFFF
     .word Start ; Reset Vector at $FFFC (Location of program Start)
     .word Start ; Intterupt vector at ($FFFE)