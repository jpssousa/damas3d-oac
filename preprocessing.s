# Preprocessing function

# Checks whether any piece on the field can capture
# if any piece can, returns a0 = 1
# if no piece can capture, returns a0 = 0

# Receives as argument:
# a3 = 1 (player 1), 2 (player 2)

# Returns:
# if capture: a0 = origin
# if capture: a1 = destination
# a3 = 1 (player 1), 2 (player 2)
# a4 = 0 (no capture), address (of captured piece)

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
# s11 is the counter for game_loop       #
##########################################

# memory = [s1][64 bits board][s0]

.data

.text

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