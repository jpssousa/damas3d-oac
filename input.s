# File that deals with player's play and input
 
##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# PLAYER_INPUT
# Returns: a0 = address on the board (origin or destination)

# Receives as arguments:
# a2 = 0 (move), 1 (capture)
# a3 = 1 (player 1), 2 (player 2)

# Returns:
# a0 = origin
# a1 = destination
# a2 = 0 (move), 1 (capture)
# a3 = 1 (player 1), 2 (player 2)
# a4 = 0 (if didn't capture), address of the captured piece (if you capture)

# memory = [s1][64 bits board][s0]
 
# KEYBOARD MMIO ADDRESS: 0xFF200000
 
.data
 
    msg: .string "A peca no tabuleiro vale: "
    error: .string "Houve um erro. Tente Novamente.\n"
 
.text
 
# PLACEHOLDER FUNCTION TO CALL THE INPUT FUNCTION
 
PLACEHOLDER2:
    li s0, 0
    jal ra, PLAYER_INPUT
    jal ra, DEBUG_INPUT
 
# PLAYER INPUT FUNCTION
# TAKES PLAYER INPUT, TRANSFORMS IT INTO OFFSET AND RETURNS OFFSET

INPUT:
    addi sp, sp, -4
    sw ra, 0(sp)
    jal ra, PLAYER_INPUT
    jal ra, DEBUG_INPUT
    addi sp, sp, -4
    sw a0, 0(sp) # a7 = temporary origin
    jal ra, PLAYER_INPUT
    jal ra, DEBUG_INPUT
    mv a1, a0 # a1 = destination
    lw a0, 0(sp) # a0 = origin
    addi sp, sp, 4
    jal ra, BASIC_POSTPROCESSING_1 # verify if the origin is a player's token
    jal ra, BASIC_POSTPROCESSING_2 # verify if the destination is a blank space
    jal ra, BASIC_POSTPROCESSING_3 # verify and realize movement or capture
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# FUNCTION FOR BASIC ERROR CHECKING ON INPUT

BASIC_POSTPROCESSING_1:
    addi t0, a3, 2 # t0 = a3 + 2 = player's queen
    lb t1, 0(a0) # t1 = piece in origin
    li t2, -1
    beq t1, t2, BASIC_POSTPROCESSING_FAILURE
    beq t1, zero, BASIC_POSTPROCESSING_FAILURE
    li t2, 1
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_1
    li t2, 2
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_2
    li t2, 3
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_3
    li t2, 4
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_4
    ret
BASIC_POSTPROCESSING_1_VERIFY_1:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_1_VERIFY_2:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_1_VERIFY_3:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_1_VERIFY_4:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_2:
    lb t0, 0(a1) # t0 = piece on the destination
    bne t0, zero, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_3:
    li t0, 1
    beq a2, zero, MOVEMENT_PLAY
    #beq a2, t0, CAPTURE_PLAY
    ret
BASIC_POSTPROCESSING_FAILURE:
    mv t0, a0
    la a0, error
    li a7, 4
    ecall
    mv a0, t0
    lw ra, 0(sp)
    addi sp, sp, 4
    j INPUT

# FUNCTION THAT IMPLEMENTS MOVEMENT

MOVEMENT_PLAY:
    lb t0, 0(a0)
    sub t2, a1, a0
    li t1, 1
    beq t0, t1, MOVEMENT_PLAY_P1
    li t1, 2
    beq t0, t1, MOVEMENT_PLAY_P2
    li t1, 3
    beq t0, t1, MOVEMENT_PLAY_P34
    li t1, 4
    beq t0, t1, MOVEMENT_PLAY_P34
    ret
MOVEMENT_PLAY_P1:
    li t3, 7
    li t4, 9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j BASIC_POSTPROCESSING_FAILURE
MOVEMENT_PLAY_P2:
    li t3, -7
    li t4, -9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j BASIC_POSTPROCESSING_FAILURE
MOVEMENT_PLAY_P34:
    li t0, 1
MOVEMENT_PLAY_P34_TP:
    li t1, 1
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_1
    li t1, 2
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_2
    li t1, 3
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_3
    li t1, 4
    beq t0, t1, MOVEMENT_PLAY_P34_CHECK_4
    j BASIC_POSTPROCESSING_FAILURE
MOVEMENT_PLAY_P34_CHECK_1:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_1_LOOP:
    addi t2, t2, 7
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_1_LOOP
MOVEMENT_PLAY_P34_CHECK_2:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_2_LOOP:
    addi t2, t2, 9
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_2_LOOP
MOVEMENT_PLAY_P34_CHECK_3:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_3_LOOP:
    addi t2, t2, -7
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_3_LOOP
MOVEMENT_PLAY_P34_CHECK_4:
    addi t0, t0, 1
    mv t2, a0
MOVEMENT_PLAY_P34_CHECK_4_LOOP:
    addi t2, t2, -9
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP # if the address is bigger than the board's limit
    blt t2, s0, MOVEMENT_PLAY_P34_TP # if the address is lower than the board's limit
    lb t3, 0(t2)
    bne t3, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_4_LOOP
MOVEMENT_SUCCESS:
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t1, 0(a0)
    sb t0, 0(a1)
    mv a4, zero
    ret

# FUNCTION TO GET PLAYER INPUT

PLAYER_INPUT:
    # allocate memory on the stack
    addi sp, sp, -4
    sw ra, 0(sp)
    # loads KEYBOARD MMIO address on t0
    li t0, 0xFF200000
    # constants
    li t4, 8
    li t5, 10
INPUT_LETTER:
    # checks if there's something pressed at 0(t0)
    lw t1, 0(t0)
    andi t1, t1, 0x0001
    beq t1, zero, INPUT_LETTER
    # checks the value of that something pressed at 4(t0)
    lw t1, 4(t0)
    addi t1, t1, -65
    bge t1, t4, INPUT_LETTER
    blt t1, zero, INPUT_LETTER
INPUT_NUMBER:
    # checks if there's something pressed at 0(t0)
    lw t2, 0(t0)
    andi t2, t2, 0x0001
    beq t2, zero, INPUT_NUMBER
    # checks the value of that something pressed at 4(t0)
    lw t2, 4(t0)
    addi t2, t2, -49
    bge t2, t4, INPUT_NUMBER
    blt t2, zero, INPUT_NUMBER
INPUT_ENTER:
    # checks if there's something pressed at 0(t0)
    lw t3, 0(t0)
    andi t3, t3, 0x0001
    beq t3, zero, INPUT_ENTER
    # checks the value of that something pressed at 4(t0)
    lw t3, 4(t0)
    bne t3, t5, INPUT_ENTER
COORDINATES:
    # multiplies the row value by 8, sum it with the column value
    slli t2, t2, 3
    add t1, t1, t2
    # returns the offset in a0
    add a0, s0, t1
    # free memory from the stack
    lw ra, 0(sp)
    addi sp, sp, 4
    #returns to caller
    ret
 
# FUNCTION TO DEBUG THE INPUT FUNCTION
 
DEBUG_INPUT:
    addi sp, sp, -4
    sw a0, 0(sp)
    mv t0, a0
    lb t0, 0(t0)
    la a0, msg
    li a7, 4
    ecall
    mv a0, t0
    li a7, 1
    ecall
    la a0, nl
    li a7, 4
    ecall
    lw a0, 0(sp)
    addi sp, sp, 4
    ret