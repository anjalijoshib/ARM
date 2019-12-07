;logic gate implementation using neural network
 
 ; format for switch case statement in arm assembly
; ADR.W R0, BranchTable_Byte
;TBB [R0, R1] ; R1 is the index, R0 is the base address of the
; branch table
;Case1
; an instruction sequence follows
;Case2
; an instruction sequence follows
;Case3
; an instruction sequence follows
;BranchTable_Byte
;DCB 0 ; Case1 offset calculation
;DCB ((Case2-Case1)/2) ; Case2 offset calculation
;DCB ((Case3-Case1)/2) ; Case3 offset calculation

 PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsgAND
	 IMPORT printMsgOR
	 IMPORT printMsgNOT
	 IMPORT printMsgNAND
	 IMPORT printMsgNOR
     IMPORT printMsg4p
	 ENTRY 
__main  FUNCTION

	    ;for LOGIC_NOT following are the valid combination of input as can be seen in python code 
		;X0->1, X1->0, X2->0 ; we are considering third input X2(deactive) to keep similarity for all logic operations
		;X0->1, X1->1, X2->0
		
;		VLDR.F32 S29,=1 ;X0
;		VLDR.F32 S30,=1	;X1
;		VLDR.F32 S31,=0	;X2
		
		;to display it we have to store input in registers
;		MOV R0,#1
;		MOV R1,#1
;		MOV R2,#0
;		ADR.W  R6, BranchTable_Byte ; generate register relative address accorfing to Branchtable_Byte lable
		
		;MOV R7,#0 ; to select one option in switch case (gates)
		;0->LOGIC_AND
		;1->LOGIC_OR
		;2->LOGIC_NOT
		;3->LOGIC_NAND
		;4->LOGIC_NOR
		;5->LOGIC_XOR
		;6->LOGIC_XNOR
		;TBB   [R6, R7] ; switch case equivalent in Arm cortex M4 so it will save table with length equivlent to BranchTable_Byte and R holds the table pointer
		
		;S0 = W0,S1 = W1, S2 = W2, S3 = (Bias) as provided in the python code

LOGIC_AND	BL printMsgAND
			VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.2
			VLDR.F32 S2,=0.2
			VLDR.F32 S3,=-0.2
			B INPUTS_1

LOGIC_OR	BL printMsgOR
			VLDR.F32 S0,=-0.1
			VLDR.F32 S1,=0.7
			VLDR.F32 S2,=0.7
			VLDR.F32 S3,=-0.1
			B INPUTS_1

LOGIC_NOT	BL printMsgNOT
			VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=0
			VLDR.F32 S3,=0.1
			B INPUTS_1

LOGIC_NAND	BL printMsgNAND
			VLDR.F32 S0,=0.6
			VLDR.F32 S1,=-0.8
			VLDR.F32 S2,=-0.8
			VLDR.F32 S3,=0.3
			B INPUTS_1

LOGIC_NOR	BL printMsgNOR
			VLDR.F32 S0,=0.5
			VLDR.F32 S1,=-0.7
			VLDR.F32 S2,=-0.7
			VLDR.F32 S3,=0.1
			B INPUTS_1

INPUTS_1	MOV R0,#1; X1
			VMOV.F32 S29,R0 ; shifting input to floating point register
			VCVT.F32.S32 S29,S29; converting input to signed floating point register
			MOV R1,#0; X2
			VMOV.F32 S30,R1 ; shifting input to floating point register
			VCVT.F32.S32 S30,S30; converting input to signed floating point register
			MOV R2,#0; X3
			VMOV.F32 S31,R2 ; shifting input to floating point register
			VCVT.F32.S32 S31,S31; converting input to signed floating point register
			B EXP_X_CALCULATION

INPUTS_2	MOV R0,#1; X1
			VMOV.F32 S29,R0 ; shifting input to floating point register
			VCVT.F32.S32 S29,S29; converting input to signed floating point register
			MOV R1,#0; X2
			VMOV.F32 S30,R1 ; shifting input to floating point register
			VCVT.F32.S32 S30,S30; converting input to signed floating point register
			MOV R2,#1; X3
			VMOV.F32 S31,R2 ; shifting input to floating point register
			VCVT.F32.S32 S31,S31; converting input to signed floating point register
			B EXP_X_CALCULATION

INPUTS_3	MOV R0,#1; X1
			VMOV.F32 S29,R0 ; shifting input to floating point register
			VCVT.F32.S32 S29,S29; converting input to signed floating point register
			MOV R1,#1; X2
			VMOV.F32 S30,R1 ; shifting input to floating point register
			VCVT.F32.S32 S30,S30; converting input to signed floating point register
			MOV R2,#0; X3
			VMOV.F32 S31,R2 ; shifting input to floating point register
			VCVT.F32.S32 S31,S31; converting input to signed floating point register
			B EXP_X_CALCULATION

INPUTS_4	MOV R0,#1; X1
			VMOV.F32 S29,R0 ; shifting input to floating point register
			VCVT.F32.S32 S29,S29; converting input to signed floating point register
			MOV R1,#1; X2
			VMOV.F32 S30,R1 ; shifting input to floating point register
			VCVT.F32.S32 S30,S30; converting input to signed floating point register
			MOV R2,#1; X3
			VMOV.F32 S31,R2 ; shifting input to floating point register
			VCVT.F32.S32 S31,S31; converting input to signed floating point register
			B EXP_X_CALCULATION


;S28 will store the final X0*W0 + X1*W1 + X2*W2 + Bias
EXP_X_CALCULATION	VMUL.F32 S16, S0, S29
					VMOV.F32 S28, S16
					VMUL.F32 S17, S1, S30
					VADD.F32 S28, S28, S17
					VMUL.F32 S18, S2, S31
					VADD.F32 S28, S28, S18
					VADD.F32 S28, S28, S3
					B EXPROUTINE


;this program performs e^x,the result will be stored in S2

EXPROUTINE	VMOV.F32 S5, S28; x:Number to find e^x
	        VMOV.F32 S6, #30; Number of iterations for e^x expansion
			VMOV.F32 S7, #1;  count
			VMOV.F32 S8, #1;  temp variable
			VMOV.F32 S9, #1;  result initialized to 1
			VMOV.F32 S11, #1;  register to hold 1
			VMOV.F32 S14,#1;

Loop 		VCMP.F32 S6, S7; Comparison done for excuting taylor series expansion of e^x for s2 number of terms
			VMRS.F32 APSR_nzcv,FPSCR; to copy fpscr to apsr
			BLT SIGROUTINE;
			VDIV.F32 S10, S5, S7; temp1=x/count
			VMUL.F32 S8, S8, S10; temp=temp*temp1;
			VADD.F32 S9, S9, S8; result=result+temp;
			VADD.F32 S7, S7, S11; count++
			B Loop;
			
SIGROUTINE	 	VADD.F32 S12,S9,S14;  (1+e^X)
			VDIV.F32 S13,S9,S12;	  g(X) = 1/(1+e^-X) == (e^X)/(1+e^X)
			B OUT;
	 
OUT 	VLDR.F32 S15,=0.5
		VCMP.F32 S13,S15
		VMRS.F32 APSR_nzcv,FPSCR;Used to copy fpscr to apsr
		ITE HI		
		MOVHI R3,#1; if S13 > S15
		MOVLS R3,#0; if S13 < S15
		BL printMsg4p	 ; Refer to ARM Procedure calling standards.
		
		;Iterations for further three sets of inputs
	ADD R4, R4,#1
	CMP R4,#1
	BEQ INPUTS_2
	CMP R4,#2
	BEQ INPUTS_3
	CMP R4,#3
	BEQ INPUTS_4
	MOV R4,#0
	
	ADD R5, R5,#1
	
	;Iterations for further LOGIC GATES
	CMP R5,#1	;Go to logic OR 
	BEQ LOGIC_OR

	CMP R5,#2	;Go to logic NOT 
	BEQ LOGIC_NOT

	CMP R5,#3	;Go to logic NAND 
	BEQ LOGIC_NAND

	CMP R5,#4	;Go to logic NOR 
	BEQ LOGIC_NOR

		
	 
stop B stop ; stop program
	 ENDFUNC
	 END