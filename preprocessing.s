# Preprocessing function
# Composed of: CAPTURE_CHECK and MOVE_CHECK

# Receives as argument:
# a0 = [1,2] # Player 1 or 2

# s0 = BOARD INITIAL ADDRESS
# s1 = BOARD FINAL ADDRESS
# s2 = PLAYER 1 TOKENS
# s3 = PLAYER 2 TOKENS
# s4 = DESTINATION INITIAL ADDRESS
# s5 = DESTINATION FINAL ADDRESS

.data

.text

PREPROCESSING:
	mv t0, s0 # t0 = variable board address
	mv t1, a0 # t1 = type of player [1,2]
	addi t2, t1, 2 # t2 = queen [1,2]+2

	mv s4, sp # initial value of dest array
	mv s5, sp # final value of dest array

	addi sp, sp, -4
	sw ra, 0(sp)
CAPTURE_LOOP:
	beq t0, s1, EXIT_CAPTURE_LOOP
	
	lb t3, 0(t0) # t3 = piece

	beq t3, t1, CAPTURE_CHECK_PREP # if the piece is a normal piece from the player
	beq t3, t2, CAPTURE_CHECK_PREP # if the piece is a queen piece from the player

	addi t0, t0, 1
	j CAPTURE_LOOP

CAPTURE_CHECK_PREP:
	addi sp, sp, -16
	sw ra, 0(sp)
	sw t0, 4(sp)
	sw t1, 8(sp)
	sw t2, 12(sp)

	jal ra, CAPTURE_CHECK

	lw ra, 0(sp)
	lw t0, 4(sp)
	lw t1, 8(sp)
	lw t2, 12(sp)
	addi sp, sp, 16
	ret

EXIT_CAPTURE_LOOP:
	mv t0, s0

	beq s4, s5, MOVE_LOOP

	lw ra, 0(sp)
	addi sp, sp, 4

	ret

MOVE_LOOP:
	ret