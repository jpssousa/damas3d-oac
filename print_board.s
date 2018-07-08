.eqv VGA_MEMORY_START 0xFF000000 
.eqv TILE_A1 64459
.eqv TILE_C1 57137
.eqv TILE_E1 49815
.eqv TILE_G1 42493
.eqv TILE_B2 57099
.eqv TILE_D2 49777
.eqv TILE_F2 42455
.eqv TILE_H2 35133
.eqv TILE_A3 57061
.eqv TILE_C3 49739
.eqv TILE_E3 42417
.eqv TILE_G3 35095
.eqv TILE_B4 49701
.eqv TILE_D4 42379
.eqv TILE_F4 35057
.eqv TILE_H4 27735
.eqv TILE_A5 49663
.eqv TILE_C5 42341
.eqv TILE_E5 35019
.eqv TILE_G5 27697
.eqv TILE_B6 42303
.eqv TILE_D6 34981
.eqv TILE_F6 27659
.eqv TILE_H6 20337
.eqv TILE_A7 42265
.eqv TILE_C7 34943
.eqv TILE_E7 27621
.eqv TILE_G7 20299
.eqv TILE_B8 34905
.eqv TILE_D8 27583
.eqv TILE_F8 20261
.eqv TILE_H8 12939

.data
	TILE_BOARD: .byte
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5B, 0xF6, 0x5B, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0xB6, 0xFF, 0xFF, 0xFF, 0xAD,
		0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0xA4, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xA4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5B, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF6, 0x52, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0xF6, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xAD, 0x09,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0xAD, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0x5B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA4, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xAD, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0xF6, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xA4, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0xAD, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xF6, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA4, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xAD, 0x09, 0x00, 0x00, 0x00, 0x5B, 0xF6, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x5B, 0x00, 0xA4, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xA4,
		0x00, 0x5B, 0xF6, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0x5B, 0x00, 0x00, 0x00, 0x00, 0xA4, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xAD, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0xAD, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xF6, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x52, 0xF6, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xA4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0xA4, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xAD, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0xAD, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0x5B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52,
		0xF6, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xAD, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x5B, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xF6, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0xAD, 0xFF, 0xFF, 0xFF, 0xFF,
		0xFF, 0xFF, 0xFF, 0xA4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0xB6,
		0xFF, 0xFF, 0xFF, 0xAD, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x5B, 0xF6, 0x5B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

		TILE: .byte
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD,
	0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD, 0xAD


.text
PRINT_BOARD_ACTION:
	addi sp, sp, -24
	sw ra, 0(sp)
	sw s6, 4(sp)
	sw s7, 8(sp)
	sw s8, 12(sp)
	sw s9, 16(sp)
	sw s10, 20(sp)

    li t0, VGA_MEMORY_START
	li t2, 0			# COMEÇA EM A1
	
SELECT_BOARD_TILE:
	mv t1, t0
	la s6, TILE_BOARD
	li t3, 0
	beq t3, t2, PRINT_TILE_A1
	
	li t3, 1
	beq t3, t2, PRINT_TILE_C1
	
	li t3, 2
	beq t3, t2, PRINT_TILE_E1
	
	li t3, 3
	beq t3, t2, PRINT_TILE_G1
	
	li t3, 4
	beq t3, t2, PRINT_TILE_B2
	
	li t3, 5
	beq t3, t2, PRINT_TILE_D2
	
	li t3, 6
	beq t3, t2, PRINT_TILE_F2
	
	li t3, 7
	beq t3, t2, PRINT_TILE_H2
	
	li t3, 8
	beq t3, t2, PRINT_TILE_A3
	
	li t3, 9
	beq t3, t2, PRINT_TILE_C3
	
	li t3, 10
	beq t3, t2, PRINT_TILE_E3
	
	li t3, 11
	beq t3, t2, PRINT_TILE_G3
	
	li t3, 12
	beq t3, t2, PRINT_TILE_B4
	
	li t3, 13
	beq t3, t2, PRINT_TILE_D4
	
	li t3, 14
	beq t3, t2, PRINT_TILE_F4
	
	li t3, 15
	beq t3, t2, PRINT_TILE_H4
	
	li t3, 16
	beq t3, t2, PRINT_TILE_A5
	
	li t3, 17
	beq t3, t2, PRINT_TILE_C5
	
	li t3, 18
	beq t3, t2, PRINT_TILE_E5
	
	li t3, 19
	beq t3, t2, PRINT_TILE_G5
	
	li t3, 20
	beq t3, t2, PRINT_TILE_B6
	
	li t3, 21
	beq t3, t2, PRINT_TILE_D6
	
	li t3, 22
	beq t3, t2, PRINT_TILE_F6
	
	li t3, 23
	beq t3, t2, PRINT_TILE_H6
	
	li t3, 24
	beq t3, t2, PRINT_TILE_A7
	
	li t3, 25
	beq t3, t2, PRINT_TILE_C7
	
	li t3, 26
	beq t3, t2, PRINT_TILE_E7
	
	li t3, 27
	beq t3, t2, PRINT_TILE_G7
	
	li t3, 28
	beq t3, t2, PRINT_TILE_B8
	
	li t3, 29
	beq t3, t2, PRINT_TILE_D8
	
	li t3, 30
	beq t3, t2, PRINT_TILE_F8
	
	li t3, 31
	beq t3, t2, PRINT_TILE_H8
	
	li t3, 32
	beq t3, t2, PRINT_BOARD_END
	
	
PRINT_TILE_A1:
	addi t3, t3, 1
	li   t4, TILE_A1
	j PRINT_BOARD_START
	
PRINT_TILE_A3:
	addi t3, t3, 1
	li   t4, TILE_A3
	j PRINT_BOARD_START

PRINT_TILE_A5:
	addi t3, t3, 1
	li   t4, TILE_A5
	j PRINT_BOARD_START

PRINT_TILE_A7:
	addi t3, t3, 1
	li   t4, TILE_A7
	j PRINT_BOARD_START

PRINT_TILE_B2:
	addi t3, t3, 1
	li   t4, TILE_B2
	j PRINT_BOARD_START

PRINT_TILE_B4:
	addi t3, t3, 1
	li   t4, TILE_B4
	j PRINT_BOARD_START

PRINT_TILE_B6:
	addi t3, t3, 1
	li   t4, TILE_B6
	j PRINT_BOARD_START

PRINT_TILE_B8:
	addi t3, t3, 1
	li   t4, TILE_B8
	j PRINT_BOARD_START

PRINT_TILE_C1:
	addi t3, t3, 1
	li   t4, TILE_C1
	j PRINT_BOARD_START

PRINT_TILE_C3:
	addi t3, t3, 1
	li   t4, TILE_C3
	j PRINT_BOARD_START

PRINT_TILE_C5:
	addi t3, t3, 1
	li   t4, TILE_C5
	j PRINT_BOARD_START

PRINT_TILE_C7:
	addi t3, t3, 1
	li   t4, TILE_C7
	j PRINT_BOARD_START

PRINT_TILE_D2:
	addi t3, t3, 1
	li   t4, TILE_D2
	j PRINT_BOARD_START

PRINT_TILE_D4:
	addi t3, t3, 1
	li   t4, TILE_D4
	j PRINT_BOARD_START

PRINT_TILE_D6:
	addi t3, t3, 1
	li   t4, TILE_D6
	j PRINT_BOARD_START

PRINT_TILE_D8:
	addi t3, t3, 1
	li   t4, TILE_D8
	j PRINT_BOARD_START

PRINT_TILE_E1:
	addi t3, t3, 1
	li   t4, TILE_E1
	j PRINT_BOARD_START

PRINT_TILE_E3:
	addi t3, t3, 1
	li   t4, TILE_E3
	j PRINT_BOARD_START

PRINT_TILE_E5:
	addi t3, t3, 1
	li   t4, TILE_E5
	j PRINT_BOARD_START

PRINT_TILE_E7:
	addi t3, t3, 1
	li   t4, TILE_E7
	j PRINT_BOARD_START

PRINT_TILE_F2:
	addi t3, t3, 1
	li   t4, TILE_F2
	j PRINT_BOARD_START

PRINT_TILE_F4:
	addi t3, t3, 1
	li   t4, TILE_F4
	j PRINT_BOARD_START

PRINT_TILE_F6:
	addi t3, t3, 1
	li   t4, TILE_F6
	j PRINT_BOARD_START

PRINT_TILE_F8:
	addi t3, t3, 1
	li   t4, TILE_F8
	j PRINT_BOARD_START

PRINT_TILE_G1:
	addi t3, t3, 1
	li   t4, TILE_G1
	j PRINT_BOARD_START

PRINT_TILE_G3:
	addi t3, t3, 1
	li   t4, TILE_G3
	j PRINT_BOARD_START

PRINT_TILE_G5:
	addi t3, t3, 1
	li   t4, TILE_G5
	j PRINT_BOARD_START

PRINT_TILE_G7:
	addi t3, t3, 1
	li   t4, TILE_G7
	j PRINT_BOARD_START

PRINT_TILE_H2:
	addi t3, t3, 1
	li   t4, TILE_H2
	j PRINT_BOARD_START

PRINT_TILE_H4:
	addi t3, t3, 1
	li   t4, TILE_H4
	j PRINT_BOARD_START

PRINT_TILE_H6:
	addi t3, t3, 1
	li   t4, TILE_H6
	j PRINT_BOARD_START

PRINT_TILE_H8:
	addi t3, t3, 1
	li   t4, TILE_H8
	j PRINT_BOARD_START
	

PRINT_BOARD_START:  	# 23 linhas
    li s7, 22           # Limite 'FOR' externo!
    li s8, 0            # Valor inicial 'FOR' externo
    add t1, t1, t4      # Desloca para VGA_START + XxY
    addi t2, t2, 1

BOARD_OUTER_LOOP:
    li s9, 0			# Valorinicial 'FOR' interno
    li s10, 38			# Limite 'FOR' interno!
    j PRINT_BOARD_TILE_INNER_LOOP
BOARD_STEP:
    bge  s8, s7, SELECT_BOARD_TILE
    addi s8, s8, 1
    addi t1, t1, 282
    j BOARD_OUTER_LOOP

PRINT_BOARD_TILE_INNER_LOOP:	# 38 colunas
    bge s9, s10, BOARD_STEP
	lb t5, 0(s6)
	sb t5, 0(t1)
    addi s6, s6, 1
    addi t1, t1, 1
    addi s9, s9, 1
    j PRINT_BOARD_TILE_INNER_LOOP
    
PRINT_BOARD_END:
	lw ra, 0(sp)
	lw s6, 4(sp)
	lw s7, 8(sp)
	lw s8, 12(sp)
	lw s9, 16(sp)
	lw s10, 20(sp)
	addi sp, sp, 24
    ret