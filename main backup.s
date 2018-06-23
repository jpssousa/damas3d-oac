##########################################
# File that generates the board, where   #
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# memory = [s1][64 bits board][s0]

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
	msg: .string "A peca no tabuleiro vale: "
	msg2: .string "Jogada do jogador: "
.text

# -1 invalid
#  0 empty
#  1 player token
#  2 cpu token
#  3 player queen
#  4 cpu queen

# MAIN FUNCTION

MAIN:
	jal ra, INIT_BOARD
	jal ra, GAME_LOOP
	
	li a7, 10
	ecall

# INIT BOARD FUNCTION

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

# GAME LOOP FUNCTION

GAME_LOOP:
	li t0, 0
	li t1, 2

PLAY_LOOP:
	addi t0, t0, 1
	mv a0, t0
	addi sp, sp, -4
	sw t0, 0(sp)
	jal ra, PLAY
	#jal ra, LIFE_CHECK
	lw t0, 0(sp)
	addi sp, sp, 4
	
	la a0, msg2
	li a7, 4
	ecall
	mv a0, t0
	li a7, 1
	ecall
	la a0, nl
	li a7, 4
	ecall
	
	beq t0, t1, GAME_LOOP
	j PLAY_LOOP

# PLAY FUNCTION

PLAY:
	addi sp, sp, -4
	sw ra, 0(sp)
	
	#jal ra, PREPROCESSING
	jal ra, PLAYER_INPUT
	jal ra, DEBUG_INPUT
	
	addi sp, sp, -4
	sw a0, 0(sp)
	
	jal ra, PLAYER_INPUT
	jal ra, DEBUG_INPUT
	
	mv a1, a0
	lw a0, 0(sp)
	addi sp, sp, 4
	
	#jal ra, POSTPROCESSING
	
	lw ra, 0(sp)
	addi sp, sp, 4
	
	ret

# PREPROCESSING FUNCTION



# PLAYER INPUT FUNCTION

PLAYER_INPUT:
    # allocate memory on the stack
    addi sp, sp, -28
    sw ra, 0(sp)
    sw t0, 4(sp)
    sw t1, 8(sp)
    sw t2, 12(sp)
    sw t3, 16(sp)
    sw t4, 20(sp)
    sw t5, 24(sp)
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
    #mv a0, t1
    add a0, s0, t1
    # free memory from the stack
    lw ra, 0(sp)
    lw t0, 4(sp)
    lw t1, 8(sp)
    lw t2, 12(sp)
    lw t3, 16(sp)
    lw t4, 20(sp)
    lw t5, 24(sp)
    addi sp, sp, 28
    #returns to caller
    ret
 
# FUNCTION TO DEBUG THE INPUT FUNCTION
 
DEBUG_INPUT:
    mv t0, a0
    la a0, msg
    li a7, 4
    ecall
    #mv a0, t0
    lb a0, 0(t0)
    li a7, 1
    ecall
    la a0, nl
    li a7, 4
    ecall
    mv a0, t0
    ret

# POSTPROCESSING FUNCTION

