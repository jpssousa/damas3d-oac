# Play function
# Implements one play of one player
# Composed of: PREPROCESSING, INPUT and POSTPROCESSING

# Receives as argument:
# a3 = 1 (player 1), 2 (player 2)

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# memory = [s1][64 bits board][s0]

.data

.text

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
	#jal ra, POSTPROCESSING
	lw ra, 0(sp)
	addi sp, sp, 4
	
	ret