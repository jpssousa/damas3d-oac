# Postprocessing function

# Calls the PRINT functions to refresh the game board on the screen
# Call CAPTURE_CHECK for the destination address and see if the piece can eat one more time
# If CAPTURE_CHECK returns (a4) != 0, jumps inconditionally to PLAY_AGAIN to let the player continue capturing
# If CAPTURE_CHECK returns (a4) == 0, checks whether the destionation address it at the last row
# If it is, promote the piece if it can be promoted and pass the turn

# Receives as argument:
# a0 = origin
# a1 = destination
# a3 = 1 (player 1), 2 (player 2)
# a4 = 0 (no capture), address of captured piece (if capture)

# Returns:
# a5 = 1 (play again), 0 (normal play)

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
# s11 is the counter for game_loop       #
##########################################

# memory = [s1][64 bits board][s0]

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