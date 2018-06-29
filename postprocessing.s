# Postprocessing function

# Calls the PRINT functions to refresh the game board on the screen
# Call CAPTURE_CHECK for the destination address and see if the piece can eat one more time
# If CAPTURE_CHECK returns (a2) 1, jumps inconditionally to PLAY_AGAIN to let the player continue capturing
# If CAPTURE_CHECK returns (a2) 0, checks whether the destionation address it at the last row
# If it is, promote the piece if it can be promoted and pass the turn

# Receives as argument:
# a0 = origin
# a1 = destination
# a2 = 0 (move), 1 (capture)
# a3 = 1 (player 1), 2 (player 2)
# a4 = 0 (no capture), address of captured piece (if capture)

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# memory = [s1][64 bits board][s0]

# FUNCTION THAT MAKES FINAL VERIFICATIONS AND PRINTS

POSTPROCESSING:
	addi sp, sp, -8
	sw a0, 0(sp)
	sw ra, 4(sp)
	mv a0, a1 # calls CAPTURE_CHECK with the destination as origin
	jal ra, CAPTURE_CHECK
	lw a0, 0(sp)
	addi sp, sp, 4
	bne a2, zero, EXIT_TO_PLAY_AGAIN
	jal ra, PROMOTE_CHECK
EXIT_POSTPROCESSING:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
EXIT_TO_PLAY_AGAIN:
	lw ra, 0(sp)
	addi sp, sp, 4
	j PLAY_AGAIN

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