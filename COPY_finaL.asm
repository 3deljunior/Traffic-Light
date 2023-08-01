
_main:

;COPY_finaL.c,4 :: 		void main() {
;COPY_finaL.c,5 :: 		trisb=0;
	CLRF       TRISB+0
;COPY_finaL.c,6 :: 		trisc=0;
	CLRF       TRISC+0
;COPY_finaL.c,7 :: 		trisd=0;
	CLRF       TRISD+0
;COPY_finaL.c,8 :: 		trisc.b5=1;   // manual
	BSF        TRISC+0, 5
;COPY_finaL.c,9 :: 		trisc.b6=1;           // street switch
	BSF        TRISC+0, 6
;COPY_finaL.c,10 :: 		portb=0;
	CLRF       PORTB+0
;COPY_finaL.c,11 :: 		portc=0;
	CLRF       PORTC+0
;COPY_finaL.c,12 :: 		portd=0;
	CLRF       PORTD+0
;COPY_finaL.c,14 :: 		while(1){
L_main0:
;COPY_finaL.c,15 :: 		for(k=15;k>=0;k--){
	MOVLW      15
	MOVWF      _k+0
	MOVLW      0
	MOVWF      _k+1
L_main2:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      0
	SUBWF      _k+0, 0
L__main53:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;COPY_finaL.c,16 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main5:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      50
	SUBWF      _i+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;COPY_finaL.c,18 :: 		while(portc.b5){            // c5 Auto/manual
L_main8:
	BTFSS      PORTC+0, 5
	GOTO       L_main9
;COPY_finaL.c,19 :: 		portb=0;
	CLRF       PORTB+0
;COPY_finaL.c,20 :: 		d=0;
	CLRF       PORTD+0
;COPY_finaL.c,21 :: 		if(portc.b6){                // c6 street switch
	BTFSS      PORTC+0, 6
	GOTO       L_main10
;COPY_finaL.c,23 :: 		d.b0=1;
	BSF        PORTD+0, 0
;COPY_finaL.c,24 :: 		d.b4=1;
	BSF        PORTD+0, 4
;COPY_finaL.c,25 :: 		wait(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;COPY_finaL.c,26 :: 		d.b4=0;
	BCF        PORTD+0, 4
;COPY_finaL.c,27 :: 		d.b5=1;
	BSF        PORTD+0, 5
;COPY_finaL.c,28 :: 		while(portc.b6&&portc.b5);
L_main12:
	BTFSS      PORTC+0, 6
	GOTO       L_main13
	BTFSS      PORTC+0, 5
	GOTO       L_main13
L__main51:
	GOTO       L_main12
L_main13:
;COPY_finaL.c,30 :: 		}
	GOTO       L_main16
L_main10:
;COPY_finaL.c,33 :: 		d.b3=1;
	BSF        PORTD+0, 3
;COPY_finaL.c,34 :: 		d.b1=1;
	BSF        PORTD+0, 1
;COPY_finaL.c,35 :: 		wait(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
;COPY_finaL.c,36 :: 		d.b1=0;
	BCF        PORTD+0, 1
;COPY_finaL.c,37 :: 		d.b2=1;
	BSF        PORTD+0, 2
;COPY_finaL.c,38 :: 		while(!(portc.b6)&&portc.b5);
L_main18:
	BTFSC      PORTC+0, 6
	GOTO       L_main19
	BTFSS      PORTC+0, 5
	GOTO       L_main19
L__main50:
	GOTO       L_main18
L_main19:
;COPY_finaL.c,39 :: 		}
L_main16:
;COPY_finaL.c,40 :: 		}
	GOTO       L_main8
L_main9:
;COPY_finaL.c,42 :: 		d=0;
	CLRF       PORTD+0
;COPY_finaL.c,43 :: 		d.b3=1;       // west Red led is on
	BSF        PORTD+0, 3
;COPY_finaL.c,44 :: 		d.b2=1;        // south green is on
	BSF        PORTD+0, 2
;COPY_finaL.c,45 :: 		if(k<4){d=0; d.b3=1; d.b1=1; d.b2=0; }
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      4
	SUBWF      _k+0, 0
L__main55:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
	CLRF       PORTD+0
	BSF        PORTD+0, 3
	BSF        PORTD+0, 1
	BCF        PORTD+0, 2
L_main22:
;COPY_finaL.c,47 :: 		portc=0;             // Display method on 7_Segment
	CLRF       PORTC+0
;COPY_finaL.c,48 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;COPY_finaL.c,49 :: 		portc.b3=1;
	BSF        PORTC+0, 3
;COPY_finaL.c,50 :: 		portb=k%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;COPY_finaL.c,51 :: 		wait(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	NOP
;COPY_finaL.c,52 :: 		portc=0;
	CLRF       PORTC+0
;COPY_finaL.c,53 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;COPY_finaL.c,54 :: 		portc.b2=1;
	BSF        PORTC+0, 2
;COPY_finaL.c,55 :: 		portb=k/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;COPY_finaL.c,56 :: 		wait(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
;COPY_finaL.c,16 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;COPY_finaL.c,57 :: 		}
	GOTO       L_main5
L_main6:
;COPY_finaL.c,15 :: 		for(k=15;k>=0;k--){
	MOVLW      1
	SUBWF      _k+0, 1
	BTFSS      STATUS+0, 0
	DECF       _k+1, 1
;COPY_finaL.c,58 :: 		}
	GOTO       L_main2
L_main3:
;COPY_finaL.c,59 :: 		d.b3=0;
	BCF        PORTD+0, 3
;COPY_finaL.c,60 :: 		d.b1=0;
	BCF        PORTD+0, 1
;COPY_finaL.c,61 :: 		for(k=23;k>=0;k--){
	MOVLW      23
	MOVWF      _k+0
	MOVLW      0
	MOVWF      _k+1
L_main25:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      0
	SUBWF      _k+0, 0
L__main56:
	BTFSS      STATUS+0, 0
	GOTO       L_main26
;COPY_finaL.c,62 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main28:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVLW      50
	SUBWF      _i+0, 0
L__main57:
	BTFSC      STATUS+0, 0
	GOTO       L_main29
;COPY_finaL.c,64 :: 		while(portc.b5){
L_main31:
	BTFSS      PORTC+0, 5
	GOTO       L_main32
;COPY_finaL.c,65 :: 		portb=0;
	CLRF       PORTB+0
;COPY_finaL.c,66 :: 		d=0;
	CLRF       PORTD+0
;COPY_finaL.c,67 :: 		if(portc.b6){
	BTFSS      PORTC+0, 6
	GOTO       L_main33
;COPY_finaL.c,69 :: 		d.b0=1;
	BSF        PORTD+0, 0
;COPY_finaL.c,70 :: 		d.b4=1;
	BSF        PORTD+0, 4
;COPY_finaL.c,71 :: 		wait(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
;COPY_finaL.c,72 :: 		d.b4=0;
	BCF        PORTD+0, 4
;COPY_finaL.c,73 :: 		d.b5=1;
	BSF        PORTD+0, 5
;COPY_finaL.c,74 :: 		while(portc.b6&&portc.b5);
L_main35:
	BTFSS      PORTC+0, 6
	GOTO       L_main36
	BTFSS      PORTC+0, 5
	GOTO       L_main36
L__main49:
	GOTO       L_main35
L_main36:
;COPY_finaL.c,76 :: 		}
	GOTO       L_main39
L_main33:
;COPY_finaL.c,79 :: 		d.b3=1;
	BSF        PORTD+0, 3
;COPY_finaL.c,80 :: 		d.b1=1;
	BSF        PORTD+0, 1
;COPY_finaL.c,81 :: 		wait(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
;COPY_finaL.c,82 :: 		d.b1=0;
	BCF        PORTD+0, 1
;COPY_finaL.c,83 :: 		d.b2=1;
	BSF        PORTD+0, 2
;COPY_finaL.c,84 :: 		while(!(portc.b6)&&portc.b5);
L_main41:
	BTFSC      PORTC+0, 6
	GOTO       L_main42
	BTFSS      PORTC+0, 5
	GOTO       L_main42
L__main48:
	GOTO       L_main41
L_main42:
;COPY_finaL.c,85 :: 		}
L_main39:
;COPY_finaL.c,86 :: 		}
	GOTO       L_main31
L_main32:
;COPY_finaL.c,89 :: 		d=0;
	CLRF       PORTD+0
;COPY_finaL.c,90 :: 		d.b0=1;            // SOUTH RED is on
	BSF        PORTD+0, 0
;COPY_finaL.c,91 :: 		d.b5=1;
	BSF        PORTD+0, 5
;COPY_finaL.c,93 :: 		if(k<4){d.b4=1; d.b5=0; }
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      4
	SUBWF      _k+0, 0
L__main58:
	BTFSC      STATUS+0, 0
	GOTO       L_main45
	BSF        PORTD+0, 4
	BCF        PORTD+0, 5
L_main45:
;COPY_finaL.c,95 :: 		portc=0;      // Display on 7_Segment
	CLRF       PORTC+0
;COPY_finaL.c,96 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;COPY_finaL.c,97 :: 		portc.b3=1;
	BSF        PORTC+0, 3
;COPY_finaL.c,98 :: 		portb=k%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;COPY_finaL.c,99 :: 		wait(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	NOP
;COPY_finaL.c,100 :: 		portc=0;
	CLRF       PORTC+0
;COPY_finaL.c,101 :: 		portc.b0=1;
	BSF        PORTC+0, 0
;COPY_finaL.c,102 :: 		portc.b2=1;
	BSF        PORTC+0, 2
;COPY_finaL.c,103 :: 		portb=k/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _k+0, 0
	MOVWF      R0+0
	MOVF       _k+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;COPY_finaL.c,104 :: 		wait(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	NOP
;COPY_finaL.c,62 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;COPY_finaL.c,105 :: 		}
	GOTO       L_main28
L_main29:
;COPY_finaL.c,61 :: 		for(k=23;k>=0;k--){
	MOVLW      1
	SUBWF      _k+0, 1
	BTFSS      STATUS+0, 0
	DECF       _k+1, 1
;COPY_finaL.c,106 :: 		}
	GOTO       L_main25
L_main26:
;COPY_finaL.c,107 :: 		d.b0=0;
	BCF        PORTD+0, 0
;COPY_finaL.c,108 :: 		d.b4=0;
	BCF        PORTD+0, 4
;COPY_finaL.c,110 :: 		}
	GOTO       L_main0
;COPY_finaL.c,111 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
