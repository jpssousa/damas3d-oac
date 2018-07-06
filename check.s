# Check function

# Function that checks whether the selected piece can eat

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
# s11 is the counter for game_loop       #
##########################################

# memory = [s1][64 bits board][s0]

# Arguments:
# a0 = address of the piece on the board (s0+offset)
# a3 = 1 (player 1), 2 (player 2)

# Returns:
# if capture: a0 = origin
# if capture: a1 = destination
# a4 = 0 (no capture), address (of piece captured)

.data

.text

# FUNCTION THAT CHECKS IF A PIECE CAN CAPTURE

CAPTURE_CHECK:
	addi sp, sp, -20,
	sw ra, 0(sp)
	sw s8, 4(sp)
	sw s9, 8(sp)
	sw s10, 12(sp)
	sw s11, 16(sp)
	li s8, 1 # p1
	li s9, 2 # p2
	li s10, 3 # queen p1
	li s11, 4 # queen p2
	lb t0, 0(a0) # t0 = type of the piece (1,3 (p1) or 2,4 (p2))
	beq t0, s8, P13_CAPTURE_CHECK
	beq t0, s9, P24_CAPTURE_CHECK
	beq t0, s10, P13_CAPTURE_CHECK
	beq t0, s11, P24_CAPTURE_CHECK
	j EXIT_CAPTURE_CHECK
P13_CAPTURE_CHECK:
	mv t3, t0
	li t0, 1
P13_CAPTURE_CHECK_TP:
	beq t0, s8, P13_CAPTURE_CHECK_1
	beq t0, s9, P13_CAPTURE_CHECK_2
	beq t0, s10, P13_CAPTURE_CHECK_3
	beq t0, s11, P13_CAPTURE_CHECK_4
	mv a4, zero
	j EXIT_CAPTURE_CHECK
P13_CAPTURE_CHECK_LOOP:
	add t1, t1, t6
	bgt t1, s1, P13_CAPTURE_CHECK_TP 
	blt t1, s0, P13_CAPTURE_CHECK_TP
	lb t2, 0(t1)
	beq t2, s8, P13_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P13
	beq t2, s10, P13_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P13
	beq t3, s8, P13_CAPTURE_CHECK_TP
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
	j P13_CAPTURE_CHECK_LOOP
P13_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, -9
	j P13_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK:
	mv t3, t0
	li t0, 1
P24_CAPTURE_CHECK_TP:
	beq t0, s8, P24_CAPTURE_CHECK_1
	beq t0, s9, P24_CAPTURE_CHECK_2
	beq t0, s10, P24_CAPTURE_CHECK_3
	beq t0, s11, P24_CAPTURE_CHECK_4
	mv a4, zero
	j EXIT_CAPTURE_CHECK
P24_CAPTURE_CHECK_LOOP:
	add t1, t1, t6
	bgt t1, s1, P24_CAPTURE_CHECK_TP 
	blt t1, s0, P24_CAPTURE_CHECK_TP
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P24
	beq t2, s9, P24_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P24
	beq t2, s11, P24_CAPTURE_CHECK_TP
	beq t3, s9, P24_CAPTURE_CHECK_TP
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
	j P24_CAPTURE_CHECK_LOOP
P24_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, -9
	j P24_CAPTURE_CHECK_LOOP
BEHIND_CHECK_P13:
	add t2, t1, t6
	bgt t2, s1, P13_CAPTURE_CHECK_TP 
	blt t2, s0, P13_CAPTURE_CHECK_TP
	lb t4, 0(t2) # t2 = space behind the captured piece
	beq t4, zero, CAPTURE_TRUE
	j P13_CAPTURE_CHECK_TP
BEHIND_CHECK_P24:
	add t2, t1, t6
	bgt t2, s1, P24_CAPTURE_CHECK_TP 
	blt t2, s0, P24_CAPTURE_CHECK_TP
	lb t4, 0(t2) # t2 = space behind the captured piece
	beq t4, zero, CAPTURE_TRUE
	j P24_CAPTURE_CHECK_TP
CAPTURE_TRUE:
	mv a1, t2
	mv a4, t1
EXIT_CAPTURE_CHECK:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20
	ret