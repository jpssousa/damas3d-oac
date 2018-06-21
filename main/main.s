# Main function

# s0 = initial board address
# (s0)

# board conventions
# -1 - invalid
#  0 - empty space
#  1 - player
#  2 - cpu
#  3 - player queen
#  4 - cpu queen

# VGA INITIAL ADDRESS: 0xFF000000
# VGA FINAL ADDRESS: 0xFF012C00
# KEYBOARD MMIO ADDRESS: 0xFF200000

# 320 x 240 = 76800

.data
	file_menu1: .string "menu.bin"
	file_menu2: .string "menu2.bin"
.text

	# main starts the game calling the game function
	MAIN:
	jal ra, GAME

	# game calls the menu function
	GAME:
	jal ra, MENU1
	jal ra, QUIT

	# menu shows the game's menu
	MENU1:
	# opens the file
	la a0, file_menu1
	li a1, 0
	li a2, 0
	li a7, 1024
	ecall
	# saves the image descriptor in t0
	mv t0, a0
	# read the opened file to VGA memory
	li a1, 0xFF000000
	li a2, 76800
	li a7, 63
	ecall
	# closes the file
	mv a0, t0
	li a7, 57
	ecall
	# waits for user input
	li t1, 0xFF200000
	MENU1_LOOP:
	lw t0, 0(t1)
	andi t0, t0, 0x0001
	beq t0, zero, MENU1_LOOP
	lw t2, 4(t1)
	li t3, 74 # value of 'J' in ascii
	li t4, 83 # value of 'S' in ascii
	beq t2, t3, MENU2
	beq t2, t4, QUIT
	j MENU1_LOOP

	MENU2:
	# opens the file
	la a0, file_menu2
	li a1, 0
	li a2, 0
	li a7, 1024
	ecall
	# saves the image descriptor in t0
	mv t0, a0
	# read the opened file to VGA memory
	li a1, 0xFF000000
	li a2, 76800
	li a7, 63
	ecall
	# closes the file
	mv a0, t0
	li a7, 57
	ecall
	# waits for user input
	li t1, 0xFF200000
	MENU2_LOOP:
	lw t0, 0(t1)
	andi t0, t0, 0x0001
	beq t0, zero, MENU2_LOOP
	lw t2, 4(t1)
	li t3, 49 # value of '1' in ascii
	li t4, 50 # value of '2' in ascii
	li t5, 51 # value of '3' in ascii
	beq t2, t3, QUIT
	beq t2, t4, QUIT
	beq t2, t5, QUIT
	j MENU2_LOOP
	
	#quits the game and ends execution
	QUIT:
	li a7, 10
	ecall
