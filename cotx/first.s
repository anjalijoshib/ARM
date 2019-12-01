; cotx series
     AREA    tan,CODE,READONLY
     IMPORT printMsg4p
     IMPORT printMsg
     EXPORT __main
     ENTRY
__main  FUNCTION
        
		VLDR.F32 S17,=360 ; end angle in degree
		VLDR.F32 S18,=1   ;increase angle value by 1 degree
		
        MOV R7,#10 ;total number of terms i
       
        
		VLDR.F32 S0,=1;temporary variable t for sine
        VLDR.F32 S1,=1;temporary variable t for sine
        
		VLDR.F32 S2,=0; Value of theta in degrees
		
LOOP3	MOV R8,#1; N ;start of counter
		 
		; to print theta in degrees
		VMOV.F32 S19,S2
		VCVT.U32.F32 S19,S19
		VMOV.U32 R0,S19
		
		;theta in radians
		VLDR.F32 S7,=0.0174533; value of 1 degree in radians
		VMUL.F32 S30,S2,S7 ; Converting degress into radians
		
		;to print theta in radians
		VLDR.F32 S15,=1000
		VMUL.F32 S14,S30,S15
		VCVT.U32.F32 S14,S14
		VMOV.U32 R1,S14
		
		
		
		VMOV.F32 S1,S30; var=x for sine, since sine series starts from x
		VMOV.F32 S0,S30; sum=x for sine
		
		VLDR.F32 S8,=1; var=1 for cosine, since cosine series starts from 1
		VLDR.F32 S9,=1; sum=1 for cosine
		
LOOP1   CMP R8,R7;Comparing N and i
        BLE LOOP;if N < i go to  LOOP
		
		BL printMsg4p
		
		
		VADD.F32 S2,S2,S18  ;incremnting theta value
		VCMP.F32 S2,S17      ;compare if theta is less than 360 or not
	    vmrs APSR_nzcv,FPSCR
		BLE LOOP3
		
stop    B stop;else stop

LOOP  	VMOV.F32 S3,R8; shifting the value of 'N' in fp register
        VCVT.F32.U32 S3,S3; Converting the value of N into 32 bit unsigned fp Number 
		VNMUL.F32 S4,S30,S30; -(x^2)
		MOV R9,#2
		MUL R3,R8,R9; 2N
		ADD R4,R3,#1; 2N+1 for sine
		MUL R4,R3,R4; 2N*(2N+1)  for sine
		VMOV.F32 S5,R4; moving the value of '2N*(2N+1)' in floating register
		VCVT.F32.U32 S5,S5; Converting the value into 32 bit unsigned fp Number 
		VDIV.F32 S6,S4,S5 ; -(x^2)/2N*(2N+1)
		VMUL.F32 S1,S1,S6; var=var*(-(x^2))/2N*(2N+1)
		
		SUB R5,R3,#1; 2N-1 for cosine
		MUL R6,R3,R5; 2N*(2N-1) for cosine
        VMOV.F32 S10,R6; moving the value of '2N*(2N-1)' in floating register
        VCVT.F32.U32 S10,S10; Converting the value into 32 bit unsigned fp Number 
		VDIV.F32 S11,S4,S10 ; -(x^2)/2N*(2N-1)
		VMUL.F32 S8,S8,S11; var=var*(-(x^2))/2N*(2N-1)
		
		VADD.F32 S0,S0,S1;Finally add 'S' to 'var'(S1) and store it in 'S'
		VADD.F32 S9,S9,S8;Finally add 'S' to 'var'(S8) and store it in 'S'
		VDIV.F32 S12,S9,S0; final output of cotx series
		
		;to print cotx value
		VMUL.F32 S12,S12,S15
		VCVT.S32.F32 S13,S12
		VMOV.S32 R2,S13
        
		
		ADD R8,R8,#1; increment the value of N by 1
		B LOOP1;Compare again
		 
		
		endfunc
        end