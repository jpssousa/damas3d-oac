# Game loop function
# Implements the game loop and passes whose turn it is as argument

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
# s11 is the counter for game_loop       #
##########################################

# memory = [s1][64 bits board][s0][99 bits destinations][1 bit number of destinations][s2]

# Passes as argument:
# a3 = 1 (player 1), 2 (player 2)

.data

.text

# FUNCTION THAT IMPLEMENTS THE GAME LOOP PVP

GAME_LOOP:
	li s11, 0
PLAY_LOOP:
	addi s11, s11, 1
	mv a3, s11
	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY
	jal ra, LIFE_CHECK
	jal ra, DEBUG_BOARD
	li t1, 2
	beq s11, t1, GAME_LOOP
	j PLAY_LOOP

# FUNCTION THAT IMPLEMENTS THE GAME LOOP PVE

GAME_LOOP_2:
	li s11, 1
	mv a3, s11
	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY
	jal ra, LIFE_CHECK
	jal ra, DEBUG_BOARD
	addi s11, s11, 1
	mv a3, s11
	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY_CPU
	jal ra, LIFE_CHECK
	jal ra, DEBUG_BOARD
	j GAME_LOOP_2

# FUNCTION THAT CHECKS IF THE GAME IS OVER

LIFE_CHECK:
	beq s2, zero, GAME_OVER
	beq s3, zero, GAME_OVER
	ret

# FUNCTION GAME OVER

GAME_OVER:
	li a7, 10
	ecall