# File that deals with player's play and input

# s0 = initial address of the board
# s1 = final address of the board
# s2 = player tokens
# s3 = cpu tokens

# KEYBOARD MMIO ADDRESS: 0xFF200000

.data

	msg: .string "O offset no tabuleiro vale: "

.text

# t0 = KEYBOARD MMIO ADDRESS
# t1 = ALPHABET LETTER (COLUMN)
# t2 = NUMBER (ROW)

# PLACEHOLDER FUNCTION TO CALL THE INPUT FUNCTION

PLACEHOLDER2:
	li s0, 0
	jal ra, PLAYER_INPUT
	jal ra, DEBUG_INPUT

# PLAYER INPUT FUNCTION
# TAKES PLAYER INPUT, TRANSFORMS IT INTO OFFSET AND RETURNS OFFSET

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
	mv a0, t0
	li a7, 1
	ecall
