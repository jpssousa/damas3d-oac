# Game loop function
# Implements the game loop and passes whose turn it is as argument

# a0 = [1,2] # Player 1 or 2

.data

.text

GAME_LOOP:
	li t0, 0
	li t1, 2

PLAY_LOOP:
	addi t0, t0, 1
	mv a0, t0

	addi sp, sp, -4
	sw t0, 0(sp)

	jal ra, PLAY
	jal ra, LIFE_CHECK

	lw t0, 0(sp)
	addi sp, sp, 4

	beq t0, t1, GAME_LOOP
	j PLAY_LOOP