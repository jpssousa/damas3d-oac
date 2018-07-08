.data

	board0: .byte 1, -1, 1, -1, 1, -1, 1, -1,
	              -1, 0, -1, 0, -1, 0, -1, 1,
	              1, -1, 1, -1, 1, -1, 1, -1,
	              -1, 0, -1, 0, -1, 0, -1, 0,
	              0, -1, 1, -1, 0, -1, 0, -1,
	              -1 ,2 ,-1, 2, -1, 2, -1, 2,
	              2, -1, 2, -1, 2, -1, 2, -1,
	              -1, 2, -1, 2, -1, 2, -1, 2                                     
	
	ws: .string " "
	nl: .string "\n"
	msg: .string "A peca no tabuleiro vale: "
	error: .string "Houve um erro. Tente Novamente.\n"

.text

# MAIN FUNCTION

MAIN:
	jal ra, INIT_BOARD
	jal ra, DEBUG_BOARD
	jal ra, GAME_LOOP_2

# FUNCTION THAT INITIALIZES THE BOARD AND PLAYER'S HEALTH

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
	li s2, 12 # s2 = player tokens
	li s3, 12 # s3 = cpu tokens
	ret
			
# DEBUG FUNCTION TO PRINT THE BOARD

DEBUG_BOARD:
	addi sp, sp, -4
	sw a0, 0(sp)
	addi t1, s1, -8
	li t2, 0
	li t3, 8
LOOP_DEBUG_BOARD:
	blt t1, s0, EXIT_DEBUG_BOARD
	lb a0, 0(t1)
	blt a0, zero, DEBUG_CUTE
LOOP_DEBUG_BOARD_CONTINUE:
	li a7, 1
	ecall
	la a0, ws
	li a7, 4
	ecall
	addi t2, t2, 1
	addi t1, t1, 1
	beq t2, t3, PRINT_NL
	j LOOP_DEBUG_BOARD
PRINT_NL:
	la a0, nl
	li a7, 4
	ecall
	li t2, 0
	addi t1, t1, -16
	j LOOP_DEBUG_BOARD
EXIT_DEBUG_BOARD:
	lw a0, 0(sp)
	addi sp, sp, 4
	ret
DEBUG_CUTE:
	li a0, 6
	j LOOP_DEBUG_BOARD_CONTINUE

# FUNCTION THAT IMPLEMENTS THE GAME LOOP PVE

GAME_LOOP_2:
	li s11, 1
	mv a3, s11
	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY
	jal ra, LIFE_CHECK
	jal ra, DEBUG_BOARD
	addi s11, s11, 1
	mv a3, s11
	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY_CPU
	jal ra, LIFE_CHECK
	jal ra, DEBUG_BOARD
	j GAME_LOOP_2

# FUNCTION THAT CHECKS IF THE GAME IS OVER

LIFE_CHECK:
	beq s2, zero, GAME_OVER
	beq s3, zero, GAME_OVER
	ret

# FUNCTION GAME OVER

GAME_OVER:
	li a7, 10
	ecall

# FUNCTION THAT IMPLEMENTS ONE TURN OF THE GAME

PLAY:
	addi sp, sp, -4
	sw ra, 0(sp)
	# arguments 
	# a3 = 1 (player 1), 2 (player 2)
	jal ra, PREPROCESSING
	# arguments 
	# a2 = 0 (move), 1 (capture)
	# a3 = 1 (player 1), 2 (player 2)
PLAY_AGAIN:
	jal ra, INPUT
	# arguments
	# a0 = origin, 
	# a1 = destination, 
	# a2 = 0 (move), 1 (capture) 
	# a3 = 1 (player 1), 2 (player 2)
	# a4 = 0 (no capture), address (of the captured piece)
	jal ra, POSTPROCESSING
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# FUNCTION THAT IMPLEMENTS ONE TURN OF THE GAME FOR THE CPU

PLAY_CPU:
	addi sp, sp, -4
	sw ra, 0(sp)
	# arguments:
	# a3 = 1 (player 1), 2 (player 2)
	jal ra, PREPROCESSING
	# arguments:
	# if capture: a0 = origin
	# if capture: a1 = destination
	# a3 = 1 (player 1), 2 (player 2)
	# if capture: a4 = address of piece captured
PLAY_AGAIN_CPU:
	jal ra, INPUT_CPU
	# arguments:
	# a0 = origin, 
	# a1 = destination, 
	# a3 = 1 (player 1), 2 (player 2)
	# a4 = 0 (no capture), address (of the captured piece)
	jal ra, POSTPROCESSING_CPU
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# FUNCTION FOR PREPROCESSING THE BOARD AND SEEING IF THERE'S ANY CAPTURE

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
	bge s8, s1, EXIT_PREPROCESSING_LOOP # if s8 >= s1 (end of board)
	lb s11, 0(s8)
	mv a0, s8
	beq s11, s9, CAPTURE_JMP
	beq s11, s10, CAPTURE_JMP
	addi s8, s8, 1
	j PREPROCESSING_LOOP
CAPTURE_JMP:
	jal ra, CAPTURE_CHECK
	bne a4, zero, EXIT_PREPROCESSING_LOOP 
	addi s8, s8, 1
	j PREPROCESSING_LOOP
EXIT_PREPROCESSING_LOOP:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20
	ret

# FUNCTION THAT CHECKS IF A PIECE CAN CAPTURE

CAPTURE_CHECK:
	addi sp, sp, -20,
	sw ra, 0(sp)
	sw s8, 4(sp)
	sw s9, 8(sp)
	sw s10, 12(sp)
	sw s11, 16(sp)
	li s8, 1 # p1
	li s9, 2 # p2
	li s10, 3 # queen p1
	li s11, 4 # queen p2
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
	mv a4, zero
	j EXIT_CAPTURE_CHECK
P13_CAPTURE_CHECK_LOOP:
	add t1, t1, t6
	bgt t1, s1, P13_CAPTURE_CHECK_TP 
	blt t1, s0, P13_CAPTURE_CHECK_TP
	lb t2, 0(t1)
	beq t2, s8, P13_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P13
	beq t2, s10, P13_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P13
	beq t3, s8, P13_CAPTURE_CHECK_TP
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, -9
	j P13_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK:
	mv t3, t0
	li t0, 1
P24_CAPTURE_CHECK_TP:
	beq t0, s8, P24_CAPTURE_CHECK_1
	beq t0, s9, P24_CAPTURE_CHECK_2
	beq t0, s10, P24_CAPTURE_CHECK_3
	beq t0, s11, P24_CAPTURE_CHECK_4
	mv a4, zero
	j EXIT_CAPTURE_CHECK
P24_CAPTURE_CHECK_LOOP:
	add t1, t1, t6
	bgt t1, s1, P24_CAPTURE_CHECK_TP 
	blt t1, s0, P24_CAPTURE_CHECK_TP
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P24
	beq t2, s9, P24_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P24
	beq t2, s11, P24_CAPTURE_CHECK_TP
	beq t3, s9, P24_CAPTURE_CHECK_TP
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, -9
	j P24_CAPTURE_CHECK_LOOP
BEHIND_CHECK_P13:
	add t2, t1, t6
	bgt t2, s1, P13_CAPTURE_CHECK_TP 
	blt t2, s0, P13_CAPTURE_CHECK_TP
	lb t4, 0(t2) # t2 = space behind the captured piece
	beq t4, zero, CAPTURE_TRUE
	j P13_CAPTURE_CHECK_TP
BEHIND_CHECK_P24:
	add t2, t1, t6
	bgt t2, s1, P24_CAPTURE_CHECK_TP 
	blt t2, s0, P24_CAPTURE_CHECK_TP
	lb t4, 0(t2) # t2 = space behind the captured piece
	beq t4, zero, CAPTURE_TRUE
	j P24_CAPTURE_CHECK_TP
CAPTURE_TRUE:
	mv a1, t2
	mv a4, t1
EXIT_CAPTURE_CHECK:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20
	ret

# PLAYER INPUT FUNCTION
# TAKES PLAYER INPUT, VERIFIES IF ITS CORRECT
# IF THE INPUT IS CORRECT, MAKE THE PLAY
# REDUCE LIFE ACCORDING TO CAPTURE

INPUT:
    addi sp, sp, -4
    sw ra, 0(sp)
    bne a5, zero, INPUT_PLAY_AGAIN
    jal ra, PLAYER_INPUT
    jal ra, DEBUG_INPUT
INPUT_PLAY_AGAIN:
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
    jal ra, BASIC_POSTPROCESSING_4 # if a4 != 0, reduce life based on a3
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# FUNCTION FOR BASIC ERROR CHECKING ON INPUT

BASIC_POSTPROCESSING_1:
    addi t0, a3, 2 # t0 = a3 + 2 = player's queen
    lb t1, 0(a0) # t1 = piece in origin
    ble t1, zero, BASIC_POSTPROCESSING_FAILURE
    li t2, 1
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_1 # if piece's value = 1, but...
    li t2, 2
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_2 # if piece's value = 2, but...
    li t2, 3
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_3 # if piece's value = 3, but...
    li t2, 4
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_4 # if piece's value = 4, but...
    ret
BASIC_POSTPROCESSING_1_VERIFY_1:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 1, fail
    ret
BASIC_POSTPROCESSING_1_VERIFY_2:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 2, fail
    ret
BASIC_POSTPROCESSING_1_VERIFY_3:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 1, fail
    ret
BASIC_POSTPROCESSING_1_VERIFY_4:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 2, fail
    ret
BASIC_POSTPROCESSING_2:
    lb t0, 0(a1) # t0 = piece on the destination
    bne t0, zero, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_3:
    beq a4, zero, MOVEMENT_PLAY
    j CAPTURE_PLAY
BASIC_POSTPROCESSING_4:
    bne a4, zero, BASIC_POSTPROCESSING_4_VERIFY
    ret
BASIC_POSTPROCESSING_4_VERIFY:
    li t0, 1
    li t1, 2
    beq a3, t0, BASIC_POSTPROCESSING_4_VERIFY_1
    beq a3, t1, BASIC_POSTPROCESSING_4_VERIFY_2
    ret
BASIC_POSTPROCESSING_4_VERIFY_1:
    addi s3, s3, -1
    ret
BASIC_POSTPROCESSING_4_VERIFY_2:
    addi s2, s2, -1
    ret
BASIC_POSTPROCESSING_FAILURE:
    mv t0, a0 # to help print
    la a0, error
    li a7, 4
    ecall
    mv a0, t0 # to help print
    lw ra, 0(sp)
    addi sp, sp, 4 # getting ra and memory back from INPUT
    j INPUT

# FUNCTION THAT IMPLEMENTS CAPTURE

CAPTURE_PLAY:
    addi sp, sp, -16
    sw s8, 0(sp)
    sw s9, 4(sp)
    sw s10, 8(sp)
    sw s11, 12(sp)
    li s8, 1
    li s9, 2
    li s10, 3
    li s11, 4
    lb t0, 0(a0)
    beq t0, s8, P13_CAPTURE_PLAY
    beq t0, s9, P24_CAPTURE_PLAY
    beq t0, s10, P13_CAPTURE_PLAY
    beq t0, s11, P24_CAPTURE_PLAY
    ret
P13_CAPTURE_PLAY:
    mv t3, t0
    li t0, 1
P13_CAPTURE_PLAY_TP:
    beq t0, s8, P13_CAPTURE_PLAY_1
    beq t0, s9, P13_CAPTURE_PLAY_2
    beq t0, s10, P13_CAPTURE_PLAY_3
    beq t0, s11, P13_CAPTURE_PLAY_4
    j CAPTURE_PLAY_FAILURE
P13_CAPTURE_PLAY_LOOP:
    add t1, t1, t6
    bgt t1, s1, P13_CAPTURE_PLAY_TP 
    blt t1, s0, P13_CAPTURE_PLAY_TP 
    mv t4, t1
    lb t2, 0(t1)
    beq t2, s8, P13_CAPTURE_PLAY_TP
    beq t2, s9, P13_BEHIND_PLAY
    beq t2, s10, P13_CAPTURE_PLAY_TP
    beq t2, s11, P13_BEHIND_PLAY
    beq t3, s8, P13_CAPTURE_PLAY_TP
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_1:
    addi t0, t0, 1
    mv t1, a0
    li t6, 7
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_2:
    addi t0, t0, 1
    mv t1, a0
    li t6, 9
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_3:
    addi t0, t0, 1
    mv t1, a0
    li t6, -7
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_4:
    addi t0, t0, 1
    mv t1, a0
    li t6, -9
    j P13_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY:
    mv t3, t0
    li t0, 1
P24_CAPTURE_PLAY_TP:
    beq t0, s8, P24_CAPTURE_PLAY_1
    beq t0, s9, P24_CAPTURE_PLAY_2
    beq t0, s10, P24_CAPTURE_PLAY_3
    beq t0, s11, P24_CAPTURE_PLAY_4
    j CAPTURE_PLAY_FAILURE
P24_CAPTURE_PLAY_LOOP:
    add t1, t1, t6
    bgt t1, s1, P24_CAPTURE_PLAY_TP 
    blt t1, s0, P24_CAPTURE_PLAY_TP 
    mv t4, t1
    lb t2, 0(t1)
    beq t2, s8, P24_BEHIND_PLAY
    beq t2, s9, P24_CAPTURE_PLAY_TP
    beq t2, s10, P24_BEHIND_PLAY
    beq t2, s11, P24_CAPTURE_PLAY_TP
    beq t3, s9, P24_CAPTURE_PLAY_TP
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_1:
    addi t0, t0, 1
    mv t1, a0
    li t6, 7
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_2:
    addi t0, t0, 1
    mv t1, a0
    li t6, 9
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_3:
    addi t0, t0, 1
    mv t1, a0
    li t6, -7
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_4:
    addi t0, t0, 1
    mv t1, a0
    li t6, -9
    j P24_CAPTURE_PLAY_LOOP
P13_BEHIND_PLAY:
    add t1, t1, t6
    bgt t1, s1, P13_CAPTURE_PLAY_TP
    blt t1, s0, P13_CAPTURE_PLAY_TP
    beq t1, a1, CAPTURE_PLAY_SUCCESS
    lb t2, 0(t1)
    bne t2, zero, P13_CAPTURE_PLAY_TP
    beq t3, s8, P13_CAPTURE_PLAY_TP
    j P13_BEHIND_PLAY
P24_BEHIND_PLAY:
    add t1, t1, t6
    bgt t1, s1, P24_CAPTURE_PLAY_TP
    blt t1, s0, P24_CAPTURE_PLAY_TP
    beq t1, a1, CAPTURE_PLAY_SUCCESS
    lb t2, 0(t1)
    bne t2, zero, P24_CAPTURE_PLAY_TP
    beq t3, s8, P24_CAPTURE_PLAY_TP
    j P24_BEHIND_PLAY
CAPTURE_PLAY_SUCCESS:
    sb zero, 0(t4)
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t0, 0(a1)
    sb t1, 0(a0)
    mv a4, t4
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    ret
CAPTURE_PLAY_FAILURE:
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    j BASIC_POSTPROCESSING_FAILURE

# FUNCTION THAT IMPLEMENTS MOVEMENT

MOVEMENT_PLAY:
    addi sp, sp, -16
    sw s8, 0(sp)
    sw s9, 4(sp)
    sw s10, 8(sp)
    sw s11, 12(sp)
    li s8, 1
    li s9, 2
    li s10, 3
    li s11, 4
    lb t0, 0(a0)
    sub t2, a1, a0
    beq t0, s8, MOVEMENT_PLAY_P1
    beq t0, s9, MOVEMENT_PLAY_P2
    beq t0, s10, MOVEMENT_PLAY_P34
    beq t0, s11, MOVEMENT_PLAY_P34
    ret
MOVEMENT_PLAY_P1:
    li t3, 7
    li t4, 9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j MOVEMENT_PLAY_FAILURE
MOVEMENT_PLAY_P2:
    li t3, -7
    li t4, -9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j MOVEMENT_PLAY_FAILURE
MOVEMENT_PLAY_P34:
    li t0, 1
MOVEMENT_PLAY_P34_TP:
    beq t0, s8, MOVEMENT_PLAY_P34_CHECK_1
    beq t0, s9, MOVEMENT_PLAY_P34_CHECK_2
    beq t0, s10, MOVEMENT_PLAY_P34_CHECK_3
    beq t0, s11, MOVEMENT_PLAY_P34_CHECK_4
    j MOVEMENT_PLAY_FAILURE
MOVEMENT_PLAY_P34_CHECK_LOOP:
    add t2, t2, t3
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP 
    blt t2, s0, MOVEMENT_PLAY_P34_TP 
    lb t4, 0(t2)
    bne t4, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_1:
    addi t0, t0, 1
    mv t2, a0
    li t3, 7
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_2:
    addi t0, t0, 1
    mv t2, a0
    li t3, 9
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_3:
    addi t0, t0, 1
    mv t2, a0
    li t3, -7
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_4:
    addi t0, t0, 1
    mv t2, a0
    li t3, -9
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_SUCCESS:
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t1, 0(a0)
    sb t0, 0(a1)
    mv a4, zero
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    ret
MOVEMENT_PLAY_FAILURE:
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    j BASIC_POSTPROCESSING_FAILURE

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

# FUNCTION THAT IMPLEMENTS THE INPUT OF THE CPU

INPUT_CPU:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw s8, 4(sp)
    sw s9, 8(sp)
    sw s10, 12(sp)
    beq a4, zero, CPU_MOVEMENT
    j CPU_CAPTURE    
CPU_MOVEMENT:
    mv t0, s0
    addi s8, a3, 2 # value of the queen of player cpu
CPU_MOVEMENT_LOOP:
    lb t1, 0(t0)
    beq t1, a3, CPU_MOVEMENT_PLAY # if the piece is a pawn of the player
    beq t1, s8, CPU_MOVEMENT_PLAY # if the piece is a queen of the player
CPU_MOVEMENT_LOOP_CONTINUE:
    addi t0, t0, 1
    j CPU_MOVEMENT_LOOP
CPU_MOVEMENT_PLAY:
    li t3, 1
    beq t1, t3, CPU_MOVEMENT_PLAY_13
    li t3, 2
    beq t1, t3, CPU_MOVEMENT_PLAY_24
    li t3, 3
    beq t1, t3, CPU_MOVEMENT_PLAY_13
    li t3, 4
    beq t1, t3, CPU_MOVEMENT_PLAY_24
    j EXIT_INPUT_CPU
CPU_MOVEMENT_PLAY_13:
    addi t2, t0, 7
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    addi t2, t0, 9
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    j CPU_MOVEMENT_LOOP_CONTINUE
CPU_MOVEMENT_PLAY_24:
    addi t2, t0, -7
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    addi t2, t0, -9
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    j CPU_MOVEMENT_LOOP_CONTINUE
CPU_MOVEMENT_SUCCESS:
    mv a0, t0
    mv a1, t2
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t0, 0(a1)
    sb t1, 0(a0)
    j EXIT_INPUT_CPU
CPU_CAPTURE:
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t0, 0(a1)
    sb t1, 0(a0)
    sb zero, 0(a4)
    addi s2, s2, -1
    j EXIT_INPUT_CPU
EXIT_INPUT_CPU:
    lw ra, 0(sp)
    lw s8, 4(sp)
    lw s9, 8(sp)
    lw s10, 12(sp)
    addi sp, sp, 16
    mv t6, ra # just to print debug
    jal ra, DEBUG_INPUT
    mv ra, t6 # just to print debug
    ret

# FUNCTION THAT MAKES FINAL VERIFICATIONS AND PRINTS

POSTPROCESSING:
	addi sp, sp, -4
	sw ra, 0(sp)
	bne a4, zero, POSTPROCESSING_CAPTURE_CHECK
POSTPROCESSING_CONTINUE:
	bne a4, zero, EXIT_TO_PLAY_AGAIN
	jal ra, PROMOTE_CHECK
EXIT_POSTPROCESSING:
	lw ra, 0(sp)
	addi sp, sp, 4
	li a5, 0 # if the player is not playing again
	ret
EXIT_TO_PLAY_AGAIN:
	lw ra, 0(sp)
	addi sp, sp, 4
	jal, ra, DEBUG_BOARD
	li a5, 1 # if the player is playing again
	j PLAY_AGAIN
POSTPROCESSING_CAPTURE_CHECK:
	mv a0, a1 # calls CAPTURE_CHECK with the destination as origin
	jal ra, CAPTURE_CHECK
	j POSTPROCESSING_CONTINUE

# FUNCTION THAT MAKES FINAL VERIFICATIONS AND PRINTS

POSTPROCESSING_CPU:
	addi sp, sp, -4
	sw ra, 0(sp)
	bne a4, zero, POSTPROCESSING_CPU_CAPTURE_CHECK
POSTPROCESSING_CPU_CONTINUE:
	bne a4, zero, EXIT_TO_PLAY_AGAIN_CPU
	jal ra, PROMOTE_CHECK
EXIT_POSTPROCESSING_CPU:
	lw ra, 0(sp)
	addi sp, sp, 4
	li a5, 0 # if the CPU is not playing again
	ret
EXIT_TO_PLAY_AGAIN_CPU:
	lw ra, 0(sp)
	addi sp, sp, 4
	jal, ra, DEBUG_BOARD
	li a5, 1 # if the CPU is playing again
	j PLAY_AGAIN_CPU
POSTPROCESSING_CPU_CAPTURE_CHECK:
	mv a0, a1 # calls CAPTURE_CHECK with the destination as origin
	jal ra, CAPTURE_CHECK
	j POSTPROCESSING_CPU_CONTINUE

# FUNCTION TO CHECK FOR PROMOTION OF PAWNS

PROMOTE_CHECK:
	sub t0, a1, s0
	li t1, 56
	li t2, 7
	bge t0, t1, PROMOTE_PAWN_P1
	ble t0, t2, PROMOTE_PAWN_P2
	ret
PROMOTE_PAWN_P1:
	lb t0, 0(a1)
	li t1, 1
	beq t0, t1, PROMOTE_PAWN_SUCCESS
	ret
PROMOTE_PAWN_P2:
	lb t0, 0(a1)
	li t1, 2
	beq t0, t1, PROMOTE_PAWN_SUCCESS
	ret
PROMOTE_PAWN_SUCCESS:
	addi t0, t0, 2
	sb t0, 0(a1)
	ret
