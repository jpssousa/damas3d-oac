# TESTING CAPTURE CHECK

.data
	board0: .byte 1, -1, 1, -1, 1, -1, 1, -1,
	              -1, 1, -1, 1, -1, 1, -1, 1,
	              1, -1, 1, -1, 1, -1, 1, -1,
	              -1, 0, -1, 0, -1, 0, -1, 0,
	              0, -1, 0, -1, 0, -1, 0, -1,
	              -1, 2, -1, 2, -1, 2, -1, 2,
	              2, -1, 2, -1, 2, -1, 2, -1,
	              -1, 2, -1, 2, -1, 2, -1, 2
	
	ws: .string " "
	nl: .string "\n"
.text

# PLACEHOLDER FUNCTION THAT CALLS INIT_BOARD

PLACEHOLDER:
	jal ra, INIT_BOARD
	li a3, 2
	jal ra, PREPROCESSING
	li a7, 1
	ecall
	li a7, 10
	ecall

# FUNCTION THAT INITIALIZES THE BOARD
# THE BOARD IS COMPOSED OF 64 BYTES
# -1 invalid
#  0 empty
#  1 player token
#  2 cpu token
#  3 player queen
#  4 cpu queen

INIT_BOARD:
	addi sp, sp, -64
	mv s0, sp	# initial address of board
	addi s1, s0, 64 # final address of board
	addi sp, sp, -16
	sw ra, 0(sp)
	sw t0, 4(sp)
	sw t1, 8(sp)
	sw t2, 12(sp)
BOARD_INPUT:
	add t0, s0, zero # temporary address of stack
	la t1, board0
BOARD_LOOP:
	bge t0, s1, EXIT_BOARD_LOOP # if address of stack == final address of board, end loop
	lb t2, 0(t1)
	sb t2, 0(t0)
	addi t0, t0, 1
	addi t1, t1, 1
	j BOARD_LOOP
EXIT_BOARD_LOOP:
	lw ra, 0(sp)
	lw t0, 4(sp)
	lw t1, 8(sp)
	lw t2, 12(sp)
	addi sp, sp, 16
	li s2, 12 # s3 = player tokens
	li s3, 12 # s4 = cpu tokens
	ret

# DEBUG FUNCTION TO PRINT THE BOARD
			
DEBUG_BOARD:
	addi sp, sp, -12
	sw t0, 0(sp)
	sw t1, 4(sp)
	sw t2, 8(sp)
	mv t0, s0	# address
	li t1, 0	# counter
	li t2, 8	# limit
LOOP_DEBUG_BOARD:
	bge t0, s1, EXIT_DEBUG_BOARD
	lb a0, 0(t0)
	li a7, 1
	ecall
	la a0, ws
	li a7, 4
	ecall
	addi t0, t0, 1
	addi t1, t1, 1
	beq t1, t2, PRINT_NL
	j LOOP_DEBUG_BOARD
PRINT_NL:
	la a0, nl
	li a7, 4
	ecall
	li t1, 0
	j LOOP_DEBUG_BOARD
EXIT_DEBUG_BOARD:
	sw t0, 0(sp)
	sw t1, 4(sp)
	sw t2, 8(sp)
	addi sp, sp, 12
	ret

CAPTURE_CHECK:
	addi sp, sp, -20
	sw ra, 0(sp)
	sw s8, 4(sp)
	sw s9, 8(sp)
	sw s10, 12(sp)
	sw s11, 16(sp)

	li s8, 1
	li s9, 2
	li s10, 3
	li s11, 4

	lb t0, 0(a0) # t0 = type of the piece (1,3 (p1) or 2,4 (p2))
	beq t0, s8, P1_CAPTURE_CHECK
	beq t0, s9, P2_CAPTURE_CHECK
	#beq t0, s10, P3_CAPTURE_CHECK
	#beq t0, s11, P4_CAPTURE_CHECK

	j EXIT_CAPTURE_CHECK

P1_CAPTURE_CHECK:
	li t0, 1
P1_CAPTURE_CHECK_TP:
	beq t0, s8, P1_CAPTURE_CHECK_1
	beq t0, s9, P1_CAPTURE_CHECK_2
	beq t0, s10, P1_CAPTURE_CHECK_3
	beq t0, s11, P1_CAPTURE_CHECK_4
	
	li a0, 0
	j EXIT_CAPTURE_CHECK
P1_CAPTURE_CHECK_1:
	addi t0, t0, 1
	addi t1, a0, 7
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1
P1_CAPTURE_CHECK_2:
	addi t0, t0, 1
	addi t1, a0, 9
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1
P1_CAPTURE_CHECK_3:
	addi t0, t0, 1
	addi t1, a0, -7
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1
P1_CAPTURE_CHECK_4:
	addi t0, t0, 1
	addi t1, a0, -9
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1

	li a0, 0
	j EXIT_CAPTURE_CHECK


P2_CAPTURE_CHECK:
	li t0, 1
P2_CAPTURE_CHECK_TP:
	beq t0, s8, P2_CAPTURE_CHECK_1
	beq t0, s9, P2_CAPTURE_CHECK_2
	beq t0, s10, P2_CAPTURE_CHECK_3
	beq t0, s11, P2_CAPTURE_CHECK_4
	
	li a0, 0
	j EXIT_CAPTURE_CHECK
P2_CAPTURE_CHECK_1:
	addi t0, t0, 1
	addi t1, a0, 7
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2
P2_CAPTURE_CHECK_2:
	addi t0, t0, 1
	addi t1, a0, 9
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2
P2_CAPTURE_CHECK_3:
	addi t0, t0, 1
	addi t1, a0, -7
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2
P2_CAPTURE_CHECK_4:
	addi t0, t0, 1
	addi t1, a0, -9
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2

	li a0, 0
	j EXIT_CAPTURE_CHECK

BEHIND_CHECK_P1:
	sub t2, t1, a0 # t2 = t1 (a0 + x) - a0 = x
	add t2, t1, t2 # t2 = a0 + x + x = a0 + 2x
	bgt t2, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P1_CAPTURE_CHECK_TP
BEHIND_CHECK_P2:
	sub t2, t1, a0 # t2 = t1 (a0 + x) - a0 = x
	add t2, t1, t2 # t2 = a0 + x + x = a0 + 2x
	bgt t2, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P2_CAPTURE_CHECK_TP

CAPTURE_TRUE:
	li a0, 1
EXIT_CAPTURE_CHECK:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20
	ret

PREPROCESSING:
	addi sp, sp, -20
	sw ra, 0(sp)
	sw s8, 4(sp)
	sw s9, 8(sp)
	sw s10, 12(sp)
	sw s11, 16(sp)

	mv s8, s0 # s8 = variable board address
	mv s9, a3 # s9 = normal token from the player
	addi s10, s9, 2 # s10 = queen token from the player
PREPROCESSING_LOOP:
	bge s8, s1, EXIT_PREPROCESSING_LOOP_FALSE # if s8 >= s1 (end of board)
	
	lb s11, 0(s8)
	mv a0, s8

	beq s11, s9, CAPTURE_JMP
	beq s11, s10, CAPTURE_JMP

	addi s8, s8, 1
	j PREPROCESSING_LOOP
CAPTURE_JMP:
	jal ra, CAPTURE_CHECK

	li t0, 1
	beq a0, t0, EXIT_PREPROCESSING_LOOP

	addi s8, s8, 1
	j PREPROCESSING_LOOP
EXIT_PREPROCESSING_LOOP_FALSE:
	li a0, 0
EXIT_PREPROCESSING_LOOP:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20
	ret
