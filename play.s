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
	
	# passes as argument a3 = 1 (player 1), 2 (player 2)
	jal ra, PREPROCESSING
	# passes as argument a2 = 0 (move), 1 (capture) and a3 = 1 (player 1), 2 (player 2)
	jal ra, INPUT
	#jal ra, POSTPROCESSING
	
	lw ra, 0(sp)
	addi sp, sp, 4
	
	ret