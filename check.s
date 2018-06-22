# Check function

# Function that checks whether the selected piece can eat
# if it can eat, then it creater an array on the stack with possible moves
# if it can't eat, it must be able to move
# if it can move, then it creates an array on the stack with possible moves
# if it can't move, the game ends because that shouldn't be possible

# s0 = initial address of the board
# s1 = final address of the board

# arguments
# a0 = address of the piece on the board (s0+offset)
# a1 = type of the piece [1,3] or [2,4]

.data

.text

CAPTURE_CHECK:
	addi sp, sp, 4
	sw ra, 0(sp)

	li t0, 1
	li t1, 2
	li t2, 3
	li t3, 4
	beq a1, t0, CAPTURE_P1
	beq a1, t2, CAPTURE_Q1	

	ret

CAPTURE_P1:
	addi








