# TESTING CAPTURE CHECK

.data
	board0: .byte 1, -1, 1, -1, 1, -1, 1, -1,
	              -1, 1, -1, 1, -1, 1, -1, 1,
	              3, -1, 1, -1, 1, -1, 1, -1,
	              -1, 0, -1, 0, -1, 0, -1, 0,
	              0, -1, 0, -1, 0, -1, 0, -1,
	              -1, 2, -1, 2, -1, 2, -1, 2,
	              2, -1, 2, -1, 2, -1, 2, -1,
	              -1, 2, -1, 2, -1, 2, -1, 2
	
	ws: .string " "
	nl: .string "\n"
	msg: .string "A peca no tabuleiro vale: "
	error: .string "Houve um erro. Tente Novamente.\n"
.text

# PLACEHOLDER FUNCTION THAT CALLS INIT_BOARD

PLACEHOLDER:
	jal ra, INIT_BOARD
	li a3, 1
	jal ra, PREPROCESSING
	li a7, 1
	ecall
	jal ra, INPUT
	jal ra, DEBUG_BOARD
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
	addi sp, sp, -20,
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
	beq t0, s8, P13_CAPTURE_CHECK
	beq t0, s9, P24_CAPTURE_CHECK
	beq t0, s10, P13_CAPTURE_CHECK
	beq t0, s11, P24_CAPTURE_CHECK
	j EXIT_CAPTURE_CHECK

P13_CAPTURE_CHECK:
	mv t3, t0
	li t0, 1
P13_CAPTURE_CHECK_TP:
	beq t0, s8, P13_CAPTURE_CHECK_1
	beq t0, s9, P13_CAPTURE_CHECK_2
	beq t0, s10, P13_CAPTURE_CHECK_3
	beq t0, s11, P13_CAPTURE_CHECK_4
	li a0, 0
	j EXIT_CAPTURE_CHECK
P13_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P13_CAPTURE_CHECK_1_LOOP:
	add t1, t1, t6
	bgt t1, s1, P13_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P13_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P13_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P13
	beq t2, s10, P13_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P13
	beq t3, s8, P13_CAPTURE_CHECK_TP
	j P13_CAPTURE_CHECK_1_LOOP
P13_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
P13_CAPTURE_CHECK_2_LOOP:
	add t1, t1, t6
	bgt t1, s1, P13_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P13_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P13_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P13
	beq t2, s10, P13_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P13
	beq t3, s8, P13_CAPTURE_CHECK_TP
	j P13_CAPTURE_CHECK_2_LOOP
P13_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
P13_CAPTURE_CHECK_3_LOOP:
	add t1, t1, t6
	bgt t1, s1, P13_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P13_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P13_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P13
	beq t2, s10, P13_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P13
	beq t3, s8, P13_CAPTURE_CHECK_TP
	j P13_CAPTURE_CHECK_3_LOOP
P13_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P13_CAPTURE_CHECK_4_LOOP:
	add t1, t1, t6
	bgt t1, s1, P13_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P13_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P13_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P13
	beq t2, s10, P13_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P13
	beq t3, s8, P13_CAPTURE_CHECK_TP
	j P13_CAPTURE_CHECK_4_LOOP

P24_CAPTURE_CHECK:
	mv t3, t0
	li t0, 1
P24_CAPTURE_CHECK_TP:
	beq t0, s8, P24_CAPTURE_CHECK_1
	beq t0, s9, P24_CAPTURE_CHECK_2
	beq t0, s10, P24_CAPTURE_CHECK_3
	beq t0, s11, P24_CAPTURE_CHECK_4
	li a0, 0
	j EXIT_CAPTURE_CHECK
P24_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P24_CAPTURE_CHECK_1_LOOP:
	add t1, t1, t6
	bgt t1, s1, P24_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P24_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P24
	beq t2, s9, P24_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P24
	beq t2, s11, P24_CAPTURE_CHECK_TP
	beq t3, s9, P24_CAPTURE_CHECK_TP
	j P24_CAPTURE_CHECK_1_LOOP
P24_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
P24_CAPTURE_CHECK_2_LOOP:
	add t1, t1, t6
	bgt t1, s1, P24_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P24_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P24
	beq t2, s9, P24_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P24
	beq t2, s11, P24_CAPTURE_CHECK_TP
	beq t3, s9, P24_CAPTURE_CHECK_TP
	j P24_CAPTURE_CHECK_2_LOOP
P24_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
P24_CAPTURE_CHECK_3_LOOP:
	add t1, t1, t6
	bgt t1, s1, P24_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P24_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P24
	beq t2, s9, P24_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P24
	beq t2, s11, P24_CAPTURE_CHECK_TP
	beq t3, s9, P24_CAPTURE_CHECK_TP
	j P24_CAPTURE_CHECK_3_LOOP
P24_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P24_CAPTURE_CHECK_4_LOOP:
	add t1, t1, t6
	bgt t1, s1, P24_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P24_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P24
	beq t2, s9, P24_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P24
	beq t2, s11, P24_CAPTURE_CHECK_TP
	beq t3, s9, P24_CAPTURE_CHECK_TP
	j P24_CAPTURE_CHECK_4_LOOP

BEHIND_CHECK_P13:
	add t2, t1, t6
	bgt t2, s1, P13_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P13_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P13_CAPTURE_CHECK_TP
BEHIND_CHECK_P24:
	add t2, t1, t6
	bgt t2, s1, P13_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P13_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P24_CAPTURE_CHECK_TP

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

INPUT:
    addi sp, sp, -4
    sw ra, 0(sp)
    jal ra, PLAYER_INPUT
    jal ra, DEBUG_INPUT
    addi sp, sp, -4
    sw a0, 0(sp) # a7 = temporary origin
    jal ra, PLAYER_INPUT
    jal ra, DEBUG_INPUT
    mv a1, a0 # a1 = destination
    lw a0, 0(sp) # a0 = origin
    addi sp, sp, 4
    jal ra, BASIC_POSTPROCESSING_1 # verify if the origin is a player's token
    jal ra, BASIC_POSTPROCESSING_2 # verify if the destination is a blank space
    jal ra, BASIC_POSTPROCESSING_3 # verify and realize movement or capture
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# FUNCTION FOR BASIC ERROR CHECKING ON INPUT

BASIC_POSTPROCESSING_1:
    addi t0, a3, 2 # t0 = a3 + 2 = player's queen
    lb t1, 0(a0) # t1 = piece in origin
    li t2, -1
    beq t1, t2, BASIC_POSTPROCESSING_FAILURE
    beq t1, zero, BASIC_POSTPROCESSING_FAILURE
    li t2, 1
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_1
    li t2, 2
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_2
    li t2, 3
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_3
    li t2, 4
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_4
    ret
BASIC_POSTPROCESSING_1_VERIFY_1:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_1_VERIFY_2:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_1_VERIFY_3:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_1_VERIFY_4:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_2:
    lb t0, 0(a1) # t0 = piece on the destination
    bne t0, zero, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_3:
    li t0, 1
    beq a2, zero, MOVEMENT_PLAY
    #beq a2, t0, CAPTURE_PLAY
    ret
BASIC_POSTPROCESSING_FAILURE:
    mv t0, a0
    la a0, error
    li a7, 4
    ecall
    mv a0, t0
    lw ra, 0(sp)
    addi sp, sp, 4
    j INPUT

# FUNCTION THAT IMPLEMENTS MOVEMENT

MOVEMENT_PLAY:
    lb t0, 0(a0)
    sub t2, a1, a0
    
    li t1, 1
    beq t0, t1, MOVEMENT_PLAY_P1
    li t1, 2
    beq t0, t1, MOVEMENT_PLAY_P2
    li t1, 3
    beq t0, t1, MOVEMENT_PLAY_P34
    li t1, 4
    beq t0, t1, MOVEMENT_PLAY_P34
    ret
MOVEMENT_PLAY_P1:
    li t3, 7
    li t4, 9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j BASIC_POSTPROCESSING_FAILURE
MOVEMENT_PLAY_P2:
    li t3, -7
    li t4, -9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j BASIC_POSTPROCESSING_FAILURE
MOVEMENT_PLAY_P34:
    li t0, 1
MOVEMENT_PLAY_P34_TP:
    li t1, 1
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_1
    li t1, 2
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_2
    li t1, 3
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_3
    li t1, 4
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_4

    j BASIC_POSTPROCESSING_FAILURE
MOVEMENT_PLAY_P34_CHECK_1:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_1_LOOP:
    addi t2, t2, 7
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_1_LOOP
MOVEMENT_PLAY_P34_CHECK_2:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_2_LOOP:
    addi t2, t2, 9
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_2_LOOP
MOVEMENT_PLAY_P34_CHECK_3:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_3_LOOP:
    addi t2, t2, -7
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_3_LOOP
MOVEMENT_PLAY_P34_CHECK_4:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_4_LOOP:
    addi t2, t2, -9
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_4_LOOP
    
MOVEMENT_SUCCESS:
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t1, 0(a0)
    sb t0, 0(a1)
    mv a4, zero
    ret

# FUNCTION TO GET PLAYER INPUT

PLAYER_INPUT:
    # allocate memory on the stack
    addi sp, sp, -4
    sw ra, 0(sp)
    # loads KEYBOARD MMIO address on t0
    li t0, 0xFF200000
    # constants
    li t4, 8
    li t5, 10
INPUT_LETTER:
    # checks if there's something pressed at 0(t0)
    lw t1, 0(t0)
    andi t1, t1, 0x0001
    beq t1, zero, INPUT_LETTER
    # checks the value of that something pressed at 4(t0)
    lw t1, 4(t0)
    addi t1, t1, -65
    bge t1, t4, INPUT_LETTER
    blt t1, zero, INPUT_LETTER
INPUT_NUMBER:
    # checks if there's something pressed at 0(t0)
    lw t2, 0(t0)
    andi t2, t2, 0x0001
    beq t2, zero, INPUT_NUMBER
    # checks the value of that something pressed at 4(t0)
    lw t2, 4(t0)
    addi t2, t2, -49
    bge t2, t4, INPUT_NUMBER
    blt t2, zero, INPUT_NUMBER
INPUT_ENTER:
    # checks if there's something pressed at 0(t0)
    lw t3, 0(t0)
    andi t3, t3, 0x0001
    beq t3, zero, INPUT_ENTER
    # checks the value of that something pressed at 4(t0)
    lw t3, 4(t0)
    bne t3, t5, INPUT_ENTER
COORDINATES:
    # multiplies the row value by 8, sum it with the column value
    slli t2, t2, 3
    add t1, t1, t2
    # returns the offset in a0
    add a0, s0, t1
    # free memory from the stack
    lw ra, 0(sp)
    addi sp, sp, 4
    #returns to caller
    ret
 
# FUNCTION TO DEBUG THE INPUT FUNCTION
 
DEBUG_INPUT:
    addi sp, sp, -4
    sw a0, 0(sp)
    mv t0, a0
    lb t0, 0(t0)
    la a0, msg
    li a7, 4
    ecall
    mv a0, t0
    li a7, 1
    ecall
    la a0, nl
    li a7, 4
    ecall
    lw a0, 0(sp)
    addi sp, sp, 4
    ret
