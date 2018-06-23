# Game loop function
# Implements the game loop and passes whose turn it is as argument

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# memory = [s1][64 bits board][s0][99 bits destinations][1 bit number of destinations][s2]

# Passes as argument to PLAY:
# a3 = 1 (player 1), 2 (player 2)

.data

.text

GAME_LOOP:
	li t0, 0
	li t1, 2

PLAY_LOOP:
	addi t0, t0, 1
	mv a3, t0

	addi sp, sp, -4
	sw t0, 0(sp)

	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY
	jal ra, LIFE_CHECK

	lw t0, 0(sp)
	addi sp, sp, 4

	beq t0, t1, GAME_LOOP
	j PLAY_LOOP