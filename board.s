# File that deals with board creation and initialization of player's life

##########################################
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
.text

# PLACEHOLDER FUNCTION THAT CALLS INIT_BOARD

PLACEHOLDER:
	jal ra, INIT_BOARD
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