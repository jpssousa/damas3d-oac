# Play function
# Implements one play of one player
# Composed of: PREPROCESSING, INPUT and POSTPROCESSING

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

PLAY:
	# a0 is already [1,2], signifying the player's turn
	jal ra, PREPROCESSING
	jal ra, INPUT
	jal ra, POSTPROCESSING