# Check function

# Function that checks whether the selected piece can eat
# if it can eat, returns a0 = 1
# if it can't eat, returns a0 = 0

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# memory = [s1][64 bits board][s0]

# arguments
# a0 = address of the piece on the board (s0+offset)

# returns
# a0 = 0 (move), 1 (capture)

.data

.text

CAPTURE_CHECK:
	addi sp, sp, -20,
	sw ra, 0(sp)
	sw s8, 4(sp)
	sw s9, 8(sp)
	sw s10, 12(sp)
	sw s11, 16(sp)

	li s8, 1
	li s9, 2
	li s10, 3
	li s11, 4

	lb t0, 0(a0) # t0 = type of the piece (1,3 (p1) or 2,4 (p2))
	beq t0, s8, P1_CAPTURE_CHECK
	beq t0, s9, P2_CAPTURE_CHECK
	beq t0, s10, P3_CAPTURE_CHECK
	beq t0, s11, P4_CAPTURE_CHECK
	j EXIT_CAPTURE_CHECK

P1_CAPTURE_CHECK:
	li t0, 1
P1_CAPTURE_CHECK_TP:
	beq t0, s8, P1_CAPTURE_CHECK_1
	beq t0, s9, P1_CAPTURE_CHECK_2
	beq t0, s10, P1_CAPTURE_CHECK_3
	beq t0, s11, P1_CAPTURE_CHECK_4
	li a0, 0
	j EXIT_CAPTURE_CHECK
P1_CAPTURE_CHECK_1:
	addi t0, t0, 1
	addi t1, a0, 7
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1
P1_CAPTURE_CHECK_2:
	addi t0, t0, 1
	addi t1, a0, 9
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1
P1_CAPTURE_CHECK_3:
	addi t0, t0, 1
	addi t1, a0, -7
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1
P1_CAPTURE_CHECK_4:
	addi t0, t0, 1
	addi t1, a0, -9
	bgt t1, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s9, BEHIND_CHECK_P1
	beq t2, s11, BEHIND_CHECK_P1
	li a0, 0
	j EXIT_CAPTURE_CHECK


P2_CAPTURE_CHECK:
	li t0, 1
P2_CAPTURE_CHECK_TP:
	beq t0, s8, P2_CAPTURE_CHECK_1
	beq t0, s9, P2_CAPTURE_CHECK_2
	beq t0, s10, P2_CAPTURE_CHECK_3
	beq t0, s11, P2_CAPTURE_CHECK_4
	li a0, 0
	j EXIT_CAPTURE_CHECK
P2_CAPTURE_CHECK_1:
	addi t0, t0, 1
	addi t1, a0, 7
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2
P2_CAPTURE_CHECK_2:
	addi t0, t0, 1
	addi t1, a0, 9
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2
P2_CAPTURE_CHECK_3:
	addi t0, t0, 1
	addi t1, a0, -7
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2
P2_CAPTURE_CHECK_4:
	addi t0, t0, 1
	addi t1, a0, -9
	bgt t1, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P2
	beq t2, s10, BEHIND_CHECK_P2
	li a0, 0
	j EXIT_CAPTURE_CHECK

P3_CAPTURE_CHECK:
	li t0, 1
P3_CAPTURE_CHECK_TP:
	beq t0, s8, P3_CAPTURE_CHECK_1
	beq t0, s9, P3_CAPTURE_CHECK_2
	beq t0, s10, P3_CAPTURE_CHECK_3
	beq t0, s11, P3_CAPTURE_CHECK_4
	li a0, 0
	j EXIT_CAPTURE_CHECK
P3_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P3_CAPTURE_CHECK_1_LOOP:
	add t1, t1, t6
	bgt t1, s1, P3_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P3_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P3_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P3
	beq t2, s10, P3_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P3
	j P3_CAPTURE_CHECK_1_LOOP
P3_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
P3_CAPTURE_CHECK_2_LOOP:
	add t1, t1, t6
	bgt t1, s1, P3_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P3_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P3_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P3
	beq t2, s10, P3_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P3
	j P3_CAPTURE_CHECK_2_LOOP
P3_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
P3_CAPTURE_CHECK_3_LOOP:
	add t1, t1, t6
	bgt t1, s1, P3_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P3_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P3_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P3
	beq t2, s10, P3_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P3
	j P3_CAPTURE_CHECK_3_LOOP
P3_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P3_CAPTURE_CHECK_4_LOOP:
	add t1, t1, t6
	bgt t1, s1, P3_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P3_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, P3_CAPTURE_CHECK_TP
	beq t2, s9, BEHIND_CHECK_P3
	beq t2, s10, P3_CAPTURE_CHECK_TP
	beq t2, s11, BEHIND_CHECK_P3
	j P3_CAPTURE_CHECK_4_LOOP

P4_CAPTURE_CHECK:
	li t0, 1
P4_CAPTURE_CHECK_TP:
	beq t0, s8, P4_CAPTURE_CHECK_1
	beq t0, s9, P4_CAPTURE_CHECK_2
	beq t0, s10, P4_CAPTURE_CHECK_3
	beq t0, s11, P4_CAPTURE_CHECK_4
	li a0, 0
	j EXIT_CAPTURE_CHECK
P4_CAPTURE_CHECK_1:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P4_CAPTURE_CHECK_1_LOOP:
	add t1, t1, t6
	bgt t1, s1, P4_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P4_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P4
	beq t2, s9, P4_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P4
	beq t2, s11, P4_CAPTURE_CHECK_TP
	j P4_CAPTURE_CHECK_1_LOOP
P4_CAPTURE_CHECK_2:
	addi t0, t0, 1
	mv t1, a0
	li t6, 9
P4_CAPTURE_CHECK_2_LOOP:
	add t1, t1, t6
	bgt t1, s1, P4_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P4_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P4
	beq t2, s9, P4_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P4
	beq t2, s11, P4_CAPTURE_CHECK_TP
	j P4_CAPTURE_CHECK_2_LOOP
P4_CAPTURE_CHECK_3:
	addi t0, t0, 1
	mv t1, a0
	li t6, -7
P4_CAPTURE_CHECK_3_LOOP:
	add t1, t1, t6
	bgt t1, s1, P4_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P4_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P4
	beq t2, s9, P4_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P4
	beq t2, s11, P4_CAPTURE_CHECK_TP
	j P4_CAPTURE_CHECK_3_LOOP
P4_CAPTURE_CHECK_4:
	addi t0, t0, 1
	mv t1, a0
	li t6, 7
P4_CAPTURE_CHECK_4_LOOP:
	add t1, t1, t6
	bgt t1, s1, P4_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t1, s0, P4_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t1)
	beq t2, s8, BEHIND_CHECK_P4
	beq t2, s9, P4_CAPTURE_CHECK_TP
	beq t2, s10, BEHIND_CHECK_P4
	beq t2, s11, P4_CAPTURE_CHECK_TP
	j P4_CAPTURE_CHECK_4_LOOP

BEHIND_CHECK_P1:
	sub t2, t1, a0 # t2 = t1 (a0 + x) - a0 = x
	add t2, t1, t2 # t2 = a0 + x + x = a0 + 2x
	bgt t2, s1, P1_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P1_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P1_CAPTURE_CHECK_TP
BEHIND_CHECK_P2:
	sub t2, t1, a0 # t2 = t1 (a0 + x) - a0 = x
	add t2, t1, t2 # t2 = a0 + x + x = a0 + 2x
	bgt t2, s1, P2_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P2_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P2_CAPTURE_CHECK_TP
BEHIND_CHECK_P3:
	add t2, t1, t6
	bgt t2, s1, P3_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P3_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P3_CAPTURE_CHECK_TP
BEHIND_CHECK_P4:
	add t2, t1, t6
	bgt t2, s1, P3_CAPTURE_CHECK_TP # if the address is bigger than the board's limit
	blt t2, s0, P3_CAPTURE_CHECK_TP # if the address is lower than the board's limit
	lb t2, 0(t2) # t2 = space behind the captured piece
	beq t2, zero, CAPTURE_TRUE
	j P4_CAPTURE_CHECK_TP

CAPTURE_TRUE:
	li a0, 1
EXIT_CAPTURE_CHECK:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20
	ret