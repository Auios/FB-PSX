'ALU Operations
Declare Sub CPU_ADD
Declare Sub CPU_ADDI
Declare Sub CPU_ADDIU
Declare Sub CPU_ADDU
Declare Sub CPU_AND
Declare Sub CPU_ANDI
Declare Sub CPU_DIV
Declare Sub CPU_DIVU
Declare Sub CPU_MULT
Declare Sub CPU_MULTU
Declare Sub CPU_NOR
Declare Sub CPU_OR
Declare Sub CPU_ORI
Declare Sub CPU_SLL
Declare Sub CPU_SLLV
Declare Sub CPU_SRA
Declare Sub CPU_SRAV
Declare Sub CPU_SRL
Declare Sub CPU_SRLV
Declare Sub CPU_SUB
Declare Sub CPU_SUBU
Declare Sub CPU_XOR
Declare Sub CPU_XORI
'Read Modify Write Operations
Declare Sub CPU_LB
Declare Sub CPU_LBU
Declare Sub CPU_LH
Declare Sub CPU_LHU
Declare Sub CPU_LUI
Declare Sub CPU_LW
Declare Sub CPU_LWL
Declare Sub CPU_LWR
Declare Sub CPU_MFHI
Declare Sub CPU_MFLO
Declare Sub CPU_MTLO
Declare Sub CPU_MTHI
Declare Sub CPU_SB
Declare Sub CPU_SH
Declare Sub CPU_SW
Declare Sub CPU_SWL
Declare Sub CPU_SWR
'Misc. Operations
Declare Sub CPU_SLT
Declare Sub CPU_SLTI
Declare Sub CPU_SLTIU
Declare Sub CPU_SLTU
Declare Sub CPU_SYSCALL
'Logic Flow Operations
Declare Sub CPU_BEQ
Declare Sub CPU_BGEZ
Declare Sub CPU_BGEZAL
Declare Sub CPU_BGTZ
Declare Sub CPU_BLEZ
Declare Sub CPU_BLTZ
Declare Sub CPU_BLTZAL
Declare Sub CPU_BNE
Declare Sub CPU_BREAK
Declare Sub CPU_JMP
Declare Sub CPU_JAL
Declare Sub CPU_JALR
Declare Sub CPU_JR
'Coprocessor Operations
Declare Sub CPU_CFC1 'CFCz
Declare Sub CPU_CFC2 'CFCz
Declare Sub CPU_CFC3 'CFCz
Declare Sub CPU_COP0 'COPz
Declare Sub CPU_COP1 'COPz
Declare Sub CPU_COP2 'COPz
Declare Sub CPU_COP3 'COPz
Declare Sub CPU_CTC1 'CTCz
Declare Sub CPU_CTC2 'CTCz
Declare Sub CPU_CTC3 'CTCz
Declare Sub CPU_LWC2
Declare Sub CPU_MFC0 'MFCz
Declare Sub CPU_MFC2 'MFCz
Declare Sub CPU_MTC0 'MTCz
Declare Sub CPU_MTC2 'MTCz
Declare Sub CPU_SWCz
Declare Sub decode_instruction

Sub CPU_ADD
	cpu.GPR(RD) = cpu.GPR(RS) + cpu.GPR(RT)
	Check_Overflow
End Sub
Sub CPU_ADDI
	cpu.GPR(RT) = cpu.GPR(RS) + imm
	Check_Overflow
End Sub
Sub CPU_ADDIU
	Dim As UInteger temp = imm And &h8000
	If temp = 1 Then temp = imm Or &hFFFF0000 Else temp = imm
	cpu.GPR(RT) = temp + cpu.GPR(RS)
End Sub
Sub CPU_ADDU
	cpu.GPR(RD) = cpu.GPR(RS) + cpu.GPR(RT)
End Sub
Sub CPU_AND
	cpu.GPR(RD) = cpu.GPR(RS) And cpu.GPR(RT)
End Sub
Sub CPU_ANDI
	cpu.GPR(RT)= cpu.GPR(RS) And imm
End Sub
Sub CPU_BEQ
	If cpu.GPR(RS) = cpu.GPR(RT) Then cpu.current_PC += Offset
End Sub
Sub CPU_BGEZ
	Dim As uinteger test = ((cpu.GPR(RS) And &h80000000)Shr 31)
	If test = 0 Then cpu.current_PC += Offset
End Sub
Sub CPU_BGEZAL
	Dim As UInteger test = ((cpu.GPR(RS) And &h80000000)Shr 31)
	If test = 0 Then cpu.current_PC += Offset
	cpu.GPR(31) = cpu.current_PC + 8
End Sub
Sub CPU_BGTZ
	Dim As UByte test = ((cpu.GPR(RS) And &h80000000)Shr 31)
	If ((test = 0) And (RS <> 0)) Then cpu.current_PC += Offset
End Sub
Sub CPU_BLEZ
	Dim As UByte test = ((cpu.GPR(RS) And &h80000000)Shr 31)
	If test = 1 Then cpu.current_PC += Offset
End Sub
Sub CPU_BLTZ
	Dim As UByte test = ((cpu.GPR(RS) And &h80000000)Shr 31)
	If ((test = 1) And (RS <> 0)) Then cpu.delay_slot_PC = cpu.current_PC + 4
	If ((test = 1) And (RS <> 0)) Then cpu.current_PC += Offset
	If ((test = 1) And (RS <> 0)) Then cpu.branch_queued = 1
End Sub
Sub CPU_BLTZAl
	Dim As UByte test = ((cpu.GPR(RS) And &h80000000)Shr 31)
	If ((test = 0) And (RS <> 0)) Then cpu.current_PC += Offset
	cpu.GPR(31) = cpu.current_PC + 8
End Sub
Sub CPU_BNE
	If cpu.GPR(RS) <> cpu.GPR(RT) Then cpu.current_PC += Offset
End Sub
Sub CPU_BREAK
	'Breakpoint Exception
End Sub
Sub CPU_CFC1

End Sub

Sub CPU_CFC2

End Sub

Sub CPU_CFC3

End Sub
Sub CPU_COP0

End Sub
Sub CPU_COP1

End Sub
Sub CPU_COP2

End Sub
Sub CPU_COP3

End Sub
Sub CPU_CTC1
	
End Sub
Sub CPU_CTC2
	
End Sub
Sub CPU_CTC3

End Sub
Sub CPU_DIV

End Sub
Sub CPU_DIVU

End Sub
Sub CPU_J
	cpu.current_PC += Target
End Sub
Sub CPU_JAL
	cpu.GPR(31) = cpu.current_PC + 8
	cpu.current_PC += Target
End Sub
Sub CPU_JALR
	cpu.GPR(RD) = cpu.current_PC + 8
	cpu.current_PC += cpu.GPR(RS)
End Sub
Sub CPU_JR
	cpu.current_PC += cpu.GPR(RS)
End Sub

Sub CPU_LB
	
End Sub

Sub CPU_LBU
	
End Sub

Sub CPU_LH
	
End Sub

Sub CPU_LHU
	
End Sub

Sub CPU_LW
	
End Sub

Sub CPU_LWC2
	
End Sub

Sub CPU_LWL
	
End Sub

Sub CPU_LWR
	
End Sub

Sub CPU_LUI
	
End Sub

Sub CPU_MFC0
	
End Sub

Sub CPU_MFC2
	
End Sub

Sub CPU_MFHI

End Sub

Sub CPU_MFLO

End Sub

Sub CPU_MTC0
	
End Sub
Sub CPU_MTC2
		
End Sub

Sub CPU_MTHI

End Sub

Sub CPU_MTLO

End Sub

Sub CPU_MULT
	
End Sub

Sub CPU_NOR 'Maybe correct????
	Dim As UInteger tRD = (RD xor &hFFFFFFFF)
	Dim As UInteger tRT = (RT Xor &hFFFFFFFF)
	Dim As UInteger tRS = (RS Xor &hFFFFFFFF)
	cpu.GPR(RD) = cpu.GPR(tRS) Or cpu.GPR(tRT)
End Sub
Sub CPU_OR
	cpu.GPR(RD) = cpu.GPR(RS) Or cpu.GPR(RT)
End Sub
Sub CPU_ORI
	cpu.GPR(RT)= cpu.GPR(RS) Or imm
End Sub
Sub CPU_SLL
	cpu.GPR(RD) = cpu.GPR(RT) Shl SA
End Sub
Sub CPU_SLLV
	cpu.GPR(RD) = cpu.GPR(RT) Shl  cpu.GPR(RS)
End Sub
Sub CPU_SLT
	Dim As Integer tRT = cpu.GPR(RT)
	Dim As Integer tRS = cpu.GPR(RS)
	If tRS < tRT Then cpu.GPR(RD) = 1 Else cpu.GPR(RD) = 0
End Sub
Sub CPU_SLTI
	Dim As Integer tImm = imm
	Dim As Integer tRS = cpu.GPR(RS)
	If tRS < tImm Then cpu.GPR(RT) = 1 Else cpu.GPR(RT) = 0
End Sub
Sub CPU_SLTIU 'Might be correct without sign extension?
	If cpu.GPR(RS) < imm Then cpu.GPR(RT) = 1 Else cpu.GPR(RT) = 0
End Sub
Sub CPU_SLTU
	If cpu.GPR(RS) < cpu.GPR(RT) Then cpu.GPR(RD) = 1 Else cpu.GPR(RD) = 0
End Sub
Sub CPU_SRA
	Dim As Integer temp = cpu.GPR(RT) Shr SA
	cpu.GPR(RD) = temp
End Sub
Sub CPU_SRAV
	Dim As Integer temp = cpu.GPR(RT) Shr  cpu.GPR(RS)
	cpu.GPR(RD) = temp
End Sub
Sub CPU_SRL
	cpu.GPR(RD) = cpu.GPR(RT) Shr SA
End Sub
Sub CPU_SRLV
	cpu.GPR(RD) = cpu.GPR(RT) Shr  cpu.GPR(RS)
End Sub
Sub CPU_SUB
	cpu.GPR(RD) = cpu.GPR(RS) - cpu.GPR(RT)
	Check_Overflow
End Sub
Sub CPU_SUBU
	cpu.GPR(RD) = cpu.GPR(RS) - cpu.GPR(RT)
End Sub
Sub CPU_SYSCALL
	Dim As UInteger code = ((cpu.opcode Shr 6) And &hFFFFF)
	Exception(code,0)
End Sub
Sub CPU_XOR
	cpu.GPR(RD) = cpu.GPR(RS) Xor cpu.GPR(RT)
End Sub
Sub CPU_XORI
	cpu.GPR(RT)= cpu.GPR(RS) xor imm
End Sub

Sub decodeInstruction
	'Must stop working on this or Blyss won't have any work to do...

	Select Case (cpu.opcode Shr 26)
		Case &h0 'Special
			Select Case(cpu.opcode And &h3F)
				Case &h20
					cpu.Operation = "ADD"
					CPU_ADD
				Case &h21
					cpu.Operation = "ADDU"
					CPU_ADDU
				Case &h24
					cpu.Operation = "AND"
					CPU_AND
				Case &h0D
					cpu.Operation = "BREAK"
					CPU_BREAK
				Case &h1A
					cpu.Operation = "DIV"
					CPU_DIV
				Case &h1B
					cpu.Operation = "DIVU"
					CPU_DIVU
				Case &h09
					cpu.Operation = "JALR"
					CPU_JALR
				Case &h08
					cpu.Operation = "JR"
					CPU_JR
				Case &h10
					cpu.Operation = "MFHI"
					CPU_MFHI
				Case &h12
					cpu.Operation = "MFLO"
					CPU_MFLO
				Case &h11
					cpu.Operation = "MTHI"
					CPU_MTHI
				Case &h13
					cpu.Operation = "MTLO"
					CPU_MTLO
				Case &h18
					cpu.operation = "MULT"
					CPU_MULT
			End Select
		Case &h1 'REGIMM = 000001
			Select Case ((cpu.opcode Shr 16) And &H1F)
				Case &h0
					cpu.operation = "BLTZ"
					CPU_BLTZ
				Case &h1
					cpu.operation = "BGEZ"
					CPU_BGEZ
				Case &h10
					cpu.operation = "BLTZAL"
					CPU_BLTZAL
				Case &h11
					cpu.operation = "BGEZAL"
					CPU_BGEZAL
			End Select
		Case &h2
			cpu.operation = "J"
			CPU_J
		Case &h3
			cpu.operation = "JAL"
			CPU_JAL
		Case &h4
			cpu.operation = "BEQ"
			CPU_BEQ
		Case &h5
			cpu.operation = "BNE"
			CPU_BNE
		Case &h6
			cpu.operation = "BLEZ"
			CPU_BLEZ
		Case &h7
			cpu.operation = "BGTZ"
			CPU_BGTZ
		Case &hc
			cpu.operation = "ANDI"
			CPU_ANDI
		Case &hD
			cpu.Operation = "ORI"
		Case &hF
			cpu.operation  = "LUI"
			CPU_LUI
		Case &h10 To &h12
			If (cpu.opcode Shr 25) And &h1 = 0 Then
			Select Case (cpu.opcode Shr 21) And &h1f
				Case &h0 'MFCz
				If (cpu.opcode And &h3F) = &h10 Then
					cpu.operation = "MFC0"
					CPU_MFC0
				ElseIf (cpu.opcode And &h3F) = &h12 Then
					cpu.operation = "MFC2"
					CPU_MFC2
				EndIf
					
				Case &h2 'CFCz
					If (cpu.opcode And &h3F) = &h12 Then
						cpu.operation = "CFC2"
						CPU_CFC2
					EndIf
					
				Case &he 'CTCz
					If (cpu.opcode And &h3F) = &h12 Then
						cpu.operation = "CTC2"
						CPU_CTC2
					EndIf
					
				Case &h64 'MTCz
					
				If (cpu.opcode And &h3F) = &h10 Then
					cpu.operation = "MTC0"
					CPU_MTC0
				ElseIf (cpu.opcode And &h3F) = &h12 Then
					cpu.operation = "MTC2"
					CPU_MTC2
				EndIf
					
			End Select
			Else 'COPz
				If (cpu.opcode And &h3F) = &h10 Then
					cpu.operation = "COP0"
					CPU_COP0
				ElseIf (cpu.opcode And &h3F) = &h12 Then
					cpu.operation = "COP2"
					CPU_COP2
				EndIf
			End If
		Case &h20
			cpu.operation = "LB"
			CPU_LB
		Case &H21
			cpu.operation = "LH"
			CPU_LH
		Case &h22
			cpu.operation = "LWL"
			CPU_LWL
		Case &h23
			cpu.operation = "LW"
			CPU_LW
		Case &h24
			cpu.operation = "LBU"
			CPU_LBU
		Case &h25
			cpu.operation = "LHU"
			CPU_LHU
		Case &h26
			cpu.operation = "LWR"
			CPU_LWR
		Case &h32
			cpu.operation = "LWC2"
			CPU_LWC2
	End Select
End Sub



