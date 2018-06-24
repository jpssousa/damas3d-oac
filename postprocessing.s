# Postprocessing function

# Validates the moviment/capture
# If a2 = 0, checks if the movement is doable by the origin piece
# If the movement is doable, realize it, call the graphics function and end the turn
# If the movement is not doable, print an error message and return to the input function
# If a2 = 1, checks if the capture is doable by the origin piece
# If the capture is doable, realize it, call the graphics function and end the turn
# If the capture is not doable, print an error message and return to the input function

# Receives as argument:
# a0 = origin
# a1 = destination
# a2 = 0 (move), 1 (capture)
# a3 = 1 (player 1), 2 (player 2)

# Returns:
# a2 = 0 (move), 1 (capture)

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# memory = [s1][64 bits board][s0]

POSTPROCESSING:
	addi sp, sp, -20
	sw ra, 0(sp)
	sw s8, 4(sp)
	sw s9, 8(sp)
	sw s10, 12(sp)
	sw s11, 16(sp)

	li t0, 1

	beq a2, zero, POSTPROCESSING_MOVE
	beq a2, t0, POSTPROCESSING_CAPTURE
POSTPROCESSING_MOVE:


POSPROCESSING_CAPTURE:
EXIT_POSTPROCESSING:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20