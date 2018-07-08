.eqv VGA_MEMORY_START 0xFF000000 
.eqv VGA_MEMORY_END   0xFF012C00
.eqv KEYBOARD_MMIO    0xFF200000

.eqv A1 62233
.eqv C1 54911
.eqv E1 47589
.eqv G1 40267
.eqv B2 54873
.eqv D2 47551
.eqv F2 40229
.eqv H2 32907
.eqv A3 54835
.eqv C3 47513
.eqv E3 40191
.eqv G3 32869
.eqv B4 47475
.eqv D4 40153
.eqv F4 32831
.eqv H4 25509
.eqv A5 47437
.eqv C5 40115
.eqv E5 32793
.eqv G5 25471
.eqv B6 40077
.eqv D6 32755
.eqv F6 25433
.eqv H6 18111
.eqv A7 40039
.eqv C7 32717
.eqv E7 25395
.eqv G7 18073
.eqv B8 32679
.eqv D8 25357
.eqv F8 18035
.eqv H8 10713

.eqv TILE_A1 60621
.eqv TILE_C1 53299
.eqv TILE_E1 45977
.eqv TILE_G1 38655
.eqv TILE_B2 53261
.eqv TILE_D2 45939
.eqv TILE_F2 38617
.eqv TILE_H2 31295
.eqv TILE_A3 53223
.eqv TILE_C3 45901
.eqv TILE_E3 38579
.eqv TILE_G3 31257
.eqv TILE_B4 45863
.eqv TILE_D4 38541
.eqv TILE_F4 31219
.eqv TILE_H4 23897
.eqv TILE_A5 45825
.eqv TILE_C5 38503
.eqv TILE_E5 31181
.eqv TILE_G5 23859
.eqv TILE_B6 38465
.eqv TILE_D6 31143
.eqv TILE_F6 23821
.eqv TILE_H6 16499
.eqv TILE_A7 38427
.eqv TILE_C7 31105
.eqv TILE_E7 23783
.eqv TILE_G7 16461
.eqv TILE_B8 31067
.eqv TILE_D8 23745
.eqv TILE_F8 16423
.eqv TILE_H8 9101

.data

	board0: .byte 1, -1, 1, -1, 1, -1, 1, -1,
	              -1, 1, -1, 1, -1, 1, -1, 1,
	              1, -1, 1, -1, 1, -1, 1, -1,
	              -1, 0, -1, 0, -1, 0, -1, 0,
	              0, -1, 0, -1, 0, -1, 0, -1,
	              -1 , 2,-1, 2, -1, 2, -1, 2,
	              2, -1, 2, -1, 2, -1, 2, -1,
	              -1, 2, -1, 2, -1, 2, -1, 2

	TILE: .byte
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	
	PC_BLUE: .byte
	0xFF, 0xFF, 0xFF, 0xFF, 0xED, 0xA4, 0x9B, 0x9B, 0xA4, 0xED, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0x9B, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x9B, 0xFF, 0xFF, 0xFF, 0x92, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x92, 0xFF, 0xFF, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0xFF, 0xFF, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0xFF, 0xFF, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0xFF,
	0xFF, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0xFF, 0xFF, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0xFF, 0xFF, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0xFF, 0xFF, 0x92, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x92, 0xFF, 0xFF, 0xFF, 0xDB, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0xDB, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xED, 0xE4, 0xDB, 0xDB, 0xE4, 0xED, 0xFF, 0xFF, 0xFF, 0xFF
	
	PC_RED:  .byte
	0xFF, 0xFF, 0xFF, 0xFF, 0xAE, 0xA6, 0x5D, 0x5D, 0xA6, 0xAE, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0x5D, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
	0x04, 0x5D, 0xFF, 0xFF, 0xFF, 0x55, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
	0x04, 0x04, 0x04, 0x04, 0x55, 0xFF, 0xFF, 0x04, 0x04, 0x04, 0x04, 0x04,
	0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0xFF, 0xFF, 0x05, 0x04, 0x04,
	0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0xFF, 0xFF, 0x05,
	0x05, 0x05, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0x05, 0x05, 0xFF,
	0xFF, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
	0x05, 0xFF, 0xFF, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
	0x05, 0x05, 0x05, 0xFF, 0xFF, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
	0x05, 0x05, 0x05, 0x05, 0x05, 0xFF, 0xFF, 0x56, 0x05, 0x05, 0x05, 0x05,
	0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x56, 0xFF, 0xFF, 0xFF, 0x5E, 0x05,
	0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x5E, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xAE, 0xA6, 0x5E, 0x5E, 0xA6, 0xAE, 0xFF, 0xFF, 0xFF, 0xFF
	
	DM_BLUE: .byte
	0xFF, 0xFF, 0xFF, 0xFE, 0xED, 0xA4, 0x9B, 0x9B, 0xA4, 0xED, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0x9B, 0x88, 0x88, 0x88, 0x9A, 0x92, 0x88, 0x88,
	0x88, 0x9B, 0xFF, 0xFF, 0xFF, 0x92, 0x88, 0x88, 0x9A, 0xED, 0xA4, 0xA4,
	0xED, 0x9A, 0x88, 0x88, 0x92, 0xFF, 0xFF, 0x88, 0x88, 0x89, 0xA4, 0xA4,
	0x9B, 0x9B, 0xA4, 0xA4, 0x89, 0x88, 0x88, 0xFF, 0xFF, 0x88, 0x88, 0x88,
	0x91, 0xED, 0xED, 0xED, 0xED, 0x91, 0x88, 0x88, 0x88, 0xFF, 0xFF, 0x88,
	0x88, 0x88, 0x88, 0x91, 0x92, 0x92, 0x91, 0x88, 0x88, 0x88, 0x88, 0xFF,
	0xFF, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0xFF, 0xFF, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0xFF, 0xFF, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0xFF, 0xFF, 0x92, 0x88, 0x88, 0x88, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x92, 0xFF, 0xFF, 0xFF, 0xDB, 0x88,
	0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0xDB, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFE, 0xED, 0xE4, 0xDB, 0xDB, 0xE4, 0xED, 0xFF, 0xFF, 0xFF, 0xFF
	
	DM_RED:  .byte
	0xFF, 0xFF, 0xFF, 0xF7, 0xAE, 0xA6, 0x5D, 0x5D, 0xA6, 0xAE, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xF7, 0x55, 0x04, 0x04, 0x04, 0x55, 0x55, 0x04, 0x04,
	0x04, 0x5D, 0xFF, 0xFF, 0xFF, 0x4D, 0x04, 0x04, 0x55, 0xA6, 0xA6, 0xA6,
	0xA6, 0x55, 0x04, 0x04, 0x55, 0xFF, 0xFF, 0x04, 0x04, 0x04, 0xA6, 0xA6,
	0x5D, 0x5D, 0xA6, 0xA6, 0x04, 0x04, 0x04, 0xFF, 0xFF, 0x05, 0x04, 0x04,
	0x04, 0xAE, 0xB7, 0xF7, 0xAE, 0x04, 0x04, 0x04, 0x05, 0xFF, 0xFF, 0x05,
	0x05, 0x05, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0x05, 0x0D, 0xFF,
	0xFF, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
	0x0D, 0xFF, 0xFF, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
	0x05, 0x05, 0x0D, 0xFF, 0xFF, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
	0x05, 0x05, 0x05, 0x05, 0x0D, 0xFF, 0xFF, 0x56, 0x05, 0x05, 0x05, 0x05,
	0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x56, 0xFF, 0xFF, 0xF7, 0x5E, 0x05,
	0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x5E, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xF7, 0xAE, 0xA6, 0x5E, 0x5E, 0xA6, 0xAE, 0xFF, 0xFF, 0xFF, 0xFF

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

.text

# FUNCTION THAT IMPLEMENTS THE MENU AND BOARD INITIALIZATION

MENU:
	jal ra, INIT_BOARD
	jal ra, PRINT_BOARD_ACTION
	jal ra, PRINT_INITIAL_TOKENS
	j GAME_LOOP_2

# FUNCTION THAT INITIALIZES THE BOARD AND PLAYER'S HEALTH

INIT_BOARD:
	addi sp, sp, -64
	mv s0, sp	# initial address of board
	addi s1, s0, 64 # final address of board
	addi sp, sp, -16
	sw ra, 0(sp)
	sw t0, 4(sp)
	sw t1, 8(sp)
	sw t2, 12(sp)
BOARD_INPUT:
	add t0, s0, zero # temporary address of stack
	la t1, board0
BOARD_LOOP:
	bge t0, s1, EXIT_BOARD_LOOP # if address of stack == final address of board, end loop
	lb t2, 0(t1)
	sb t2, 0(t0)
	addi t0, t0, 1
	addi t1, t1, 1
	j BOARD_LOOP
EXIT_BOARD_LOOP:
	lw ra, 0(sp)
	lw t0, 4(sp)
	lw t1, 8(sp)
	lw t2, 12(sp)
	addi sp, sp, 16
	li s2, 12 # s2 = player tokens
	li s3, 12 # s3 = cpu tokens
	ret

# FUNCTION THAT PRINTS THE INITIAL BOARD TOKENS

PRINT_INITIAL_TOKENS:
	addi sp, sp, -12
	sw ra, 0(sp)
	sw s10, 4(sp)
	sw s11, 8(sp)
	mv s10, s0
	li s11, -1
PRINT_INITIAL_TOKENS_LOOP:
	bge s10, s1, PRINT_INITIAL_TOKENS_EXIT
	lb a7, 0(s10)
	bne a7, s11, PRINT_INITIAL_TOKENS_SUCCESS
	addi s10, s10, 1
	j PRINT_INITIAL_TOKENS_LOOP
PRINT_INITIAL_TOKENS_SUCCESS:
	sub a6, s10, s0
	jal ra, PRINT_TOKEN
	addi s10, s10, 1
	j PRINT_INITIAL_TOKENS_LOOP
PRINT_INITIAL_TOKENS_EXIT:
	lw ra, 0(sp)
	lw s10, 4(sp)
	lw s11, 8(sp)
	addi sp, sp, 12
	ret

# FUNCTION THAT PRINTS THE INITIAL BOARD

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

# FUNCTION THAT IMPLEMENTS THE GAME LOOP PVP

GAME_LOOP:
	li s11, 0
PLAY_LOOP:
	addi s11, s11, 1
	mv a3, s11
	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY
	jal ra, LIFE_CHECK
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
	addi s11, s11, 1
	mv a3, s11
	# receives a3 = 1 (player 1), 2 (player 2) as argument
	jal ra, PLAY_CPU
	jal ra, LIFE_CHECK
	j GAME_LOOP_2

# FUNCTION THAT CHECKS IF THE GAME IS OVER

LIFE_CHECK:
	beq s2, zero, GAME_OVER_LOSE
	beq s3, zero, GAME_OVER_WIN
	ret
GAME_OVER_LOSE:
	j GAME_OVER
GAME_OVER_WIN:
	j GAME_OVER

# FUNCTION GAME OVER

GAME_OVER:
	j GAME_OVER

# FUNCTION THAT IMPLEMENTS ONE TURN OF THE GAME

PLAY:
	addi sp, sp, -4
	sw ra, 0(sp)
	# arguments 
	# a3 = 1 (player 1), 2 (player 2)
	jal ra, PREPROCESSING
	# arguments
	# a0 = origin, 
	# a1 = destination
	# a2 = 0 (move), 1 (capture)
	# a3 = 1 (player 1), 2 (player 2)
	# a4 = 0 (no capture), address (of the captured piece)
PLAY_AGAIN:
	jal ra, INPUT
	# arguments
	# a0 = origin, 
	# a1 = destination
	# a2 = 0 (move), 1 (capture) 
	# a3 = 1 (player 1), 2 (player 2)
	# a4 = 0 (no capture), address (of the captured piece)
	jal ra, PLAY_PRINT
	jal ra, POSTPROCESSING
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# FUNCTION THAT IMPLEMENTS ONE TURN OF THE GAME FOR THE CPU

PLAY_CPU:
	addi sp, sp, -4
	sw ra, 0(sp)
	# arguments:
	# a3 = 1 (player 1), 2 (player 2)
	jal ra, PREPROCESSING
	# arguments:
	# if capture: a0 = origin
	# if capture: a1 = destination
	# a3 = 1 (player 1), 2 (player 2)
	# a4 = 0 (no capture), address (of the captured piece)
PLAY_AGAIN_CPU:
	jal ra, INPUT_CPU
	# arguments:
	# a0 = origin, 
	# a1 = destination, 
	# a3 = 1 (player 1), 2 (player 2)
	# a4 = 0 (no capture), address (of the captured piece)
	jal ra, PLAY_PRINT
	jal ra, POSTPROCESSING_CPU
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# FUNCTION THAT PRINTS ON THE BITMAP DISPLAY

PLAY_PRINT:
	addi sp, sp, -4
	sw ra, 0(sp)
	# print background
	mv a6, a0
	sub a6, a6, s0
	mv a7, zero
	jal ra, PRINT_TOKEN
	# print token
	mv a6, a1
	sub a6, a6, s0
	lb a7, 0(a1)
	jal ra, PRINT_TOKEN
	bne a4, zero, PLAY_PRINT_CAPTURE
	j PLAY_PRINT_EXIT
PLAY_PRINT_CAPTURE:
	# print captured
	mv a6, a4
	sub a6, a6, s0
	mv a7, zero
	jal ra, PRINT_TOKEN
PLAY_PRINT_EXIT:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# FUNCTION FOR PREPROCESSING THE BOARD AND SEEING IF THERE'S ANY CAPTURE

PREPROCESSING:
	addi sp, sp, -20
	sw ra, 0(sp)
	sw s8, 4(sp)
	sw s9, 8(sp)
	sw s10, 12(sp)
	sw s11, 16(sp)
	mv s8, s0 # s8 = variable board address
	mv s9, a3 # s9 = normal token from the player
	addi s10, s9, 2 # s10 = queen token from the player
PREPROCESSING_LOOP:
	bge s8, s1, EXIT_PREPROCESSING_LOOP # if s8 >= s1 (end of board)
	lb s11, 0(s8)
	mv a0, s8
	beq s11, s9, CAPTURE_JMP
	beq s11, s10, CAPTURE_JMP
	addi s8, s8, 1
	j PREPROCESSING_LOOP
CAPTURE_JMP:
	jal ra, CAPTURE_CHECK
	bne a4, zero, EXIT_PREPROCESSING_LOOP 
	addi s8, s8, 1
	j PREPROCESSING_LOOP
EXIT_PREPROCESSING_LOOP:
	lw ra, 0(sp)
	lw s8, 4(sp)
	lw s9, 8(sp)
	lw s10, 12(sp)
	lw s11, 16(sp)
	addi sp, sp, 20
	ret

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
	bge t2, s1, P13_CAPTURE_CHECK_TP 
	blt t2, s0, P13_CAPTURE_CHECK_TP
	lb t4, 0(t2) # t2 = space behind the captured piece
	beq t4, zero, CAPTURE_TRUE
	j P13_CAPTURE_CHECK_TP
BEHIND_CHECK_P24:
	add t2, t1, t6
	bge t2, s1, P24_CAPTURE_CHECK_TP 
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

# PLAYER INPUT FUNCTION
# TAKES PLAYER INPUT, VERIFIES IF ITS CORRECT
# IF THE INPUT IS CORRECT, MAKE THE PLAY
# REDUCE LIFE ACCORDING TO CAPTURE

INPUT:
    addi sp, sp, -4
    sw ra, 0(sp)
    bne a5, zero, INPUT_PLAY_AGAIN
    jal ra, PLAYER_INPUT
INPUT_PLAY_AGAIN:
    addi sp, sp, -4
    sw a0, 0(sp) 
    jal ra, PLAYER_INPUT
    mv a1, a0 # a1 = destination
    lw a0, 0(sp) # a0 = origin
    addi sp, sp, 4
    jal ra, BASIC_POSTPROCESSING_1 # verify if the origin is a player's token
    jal ra, BASIC_POSTPROCESSING_2 # verify if the destination is a blank space
    jal ra, BASIC_POSTPROCESSING_3 # verify and realize movement or capture
    jal ra, BASIC_POSTPROCESSING_4 # if a4 != 0, reduce life based on a3
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# FUNCTION FOR BASIC ERROR CHECKING ON INPUT

BASIC_POSTPROCESSING_1:
    addi t0, a3, 2 # t0 = a3 + 2 = player's queen
    lb t1, 0(a0) # t1 = piece in origin
    ble t1, zero, BASIC_POSTPROCESSING_FAILURE
    li t2, 1
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_1 # if piece's value = 1, but...
    li t2, 2
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_2 # if piece's value = 2, but...
    li t2, 3
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_3 # if piece's value = 3, but...
    li t2, 4
    beq t1, t2, BASIC_POSTPROCESSING_1_VERIFY_4 # if piece's value = 4, but...
    ret
BASIC_POSTPROCESSING_1_VERIFY_1:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 1, fail
    ret
BASIC_POSTPROCESSING_1_VERIFY_2:
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 2, fail
    ret
BASIC_POSTPROCESSING_1_VERIFY_3:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 1, fail
    ret
BASIC_POSTPROCESSING_1_VERIFY_4:
    addi t2, t2, -2
    bne a3, t2, BASIC_POSTPROCESSING_FAILURE # type of player (a3) != 2, fail
    ret
BASIC_POSTPROCESSING_2:
    lb t0, 0(a1) # t0 = piece on the destination
    bne t0, zero, BASIC_POSTPROCESSING_FAILURE
    ret
BASIC_POSTPROCESSING_3:
    beq a4, zero, MOVEMENT_PLAY
    j CAPTURE_PLAY
BASIC_POSTPROCESSING_4:
    bne a4, zero, BASIC_POSTPROCESSING_4_VERIFY
    ret
BASIC_POSTPROCESSING_4_VERIFY:
    li t0, 1
    li t1, 2
    beq a3, t0, BASIC_POSTPROCESSING_4_VERIFY_1
    beq a3, t1, BASIC_POSTPROCESSING_4_VERIFY_2
    ret
BASIC_POSTPROCESSING_4_VERIFY_1:
    addi s3, s3, -1
    ret
BASIC_POSTPROCESSING_4_VERIFY_2:
    addi s2, s2, -1
    ret
BASIC_POSTPROCESSING_FAILURE:
    lw ra, 0(sp)
    addi sp, sp, 4 # getting ra and memory back from INPUT
    j INPUT

# FUNCTION THAT IMPLEMENTS CAPTURE

CAPTURE_PLAY:
    addi sp, sp, -16
    sw s8, 0(sp)
    sw s9, 4(sp)
    sw s10, 8(sp)
    sw s11, 12(sp)
    li s8, 1
    li s9, 2
    li s10, 3
    li s11, 4
    lb t0, 0(a0)
    beq t0, s8, P13_CAPTURE_PLAY
    beq t0, s9, P24_CAPTURE_PLAY
    beq t0, s10, P13_CAPTURE_PLAY
    beq t0, s11, P24_CAPTURE_PLAY
    ret
P13_CAPTURE_PLAY:
    mv t3, t0
    li t0, 1
P13_CAPTURE_PLAY_TP:
    beq t0, s8, P13_CAPTURE_PLAY_1
    beq t0, s9, P13_CAPTURE_PLAY_2
    beq t0, s10, P13_CAPTURE_PLAY_3
    beq t0, s11, P13_CAPTURE_PLAY_4
    j CAPTURE_PLAY_FAILURE
P13_CAPTURE_PLAY_LOOP:
    add t1, t1, t6
    bgt t1, s1, P13_CAPTURE_PLAY_TP 
    blt t1, s0, P13_CAPTURE_PLAY_TP 
    mv t4, t1
    lb t2, 0(t1)
    beq t2, s8, P13_CAPTURE_PLAY_TP
    beq t2, s9, P13_BEHIND_PLAY
    beq t2, s10, P13_CAPTURE_PLAY_TP
    beq t2, s11, P13_BEHIND_PLAY
    beq t3, s8, P13_CAPTURE_PLAY_TP
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_1:
    addi t0, t0, 1
    mv t1, a0
    li t6, 7
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_2:
    addi t0, t0, 1
    mv t1, a0
    li t6, 9
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_3:
    addi t0, t0, 1
    mv t1, a0
    li t6, -7
    j P13_CAPTURE_PLAY_LOOP
P13_CAPTURE_PLAY_4:
    addi t0, t0, 1
    mv t1, a0
    li t6, -9
    j P13_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY:
    mv t3, t0
    li t0, 1
P24_CAPTURE_PLAY_TP:
    beq t0, s8, P24_CAPTURE_PLAY_1
    beq t0, s9, P24_CAPTURE_PLAY_2
    beq t0, s10, P24_CAPTURE_PLAY_3
    beq t0, s11, P24_CAPTURE_PLAY_4
    j CAPTURE_PLAY_FAILURE
P24_CAPTURE_PLAY_LOOP:
    add t1, t1, t6
    bgt t1, s1, P24_CAPTURE_PLAY_TP 
    blt t1, s0, P24_CAPTURE_PLAY_TP 
    mv t4, t1
    lb t2, 0(t1)
    beq t2, s8, P24_BEHIND_PLAY
    beq t2, s9, P24_CAPTURE_PLAY_TP
    beq t2, s10, P24_BEHIND_PLAY
    beq t2, s11, P24_CAPTURE_PLAY_TP
    beq t3, s9, P24_CAPTURE_PLAY_TP
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_1:
    addi t0, t0, 1
    mv t1, a0
    li t6, 7
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_2:
    addi t0, t0, 1
    mv t1, a0
    li t6, 9
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_3:
    addi t0, t0, 1
    mv t1, a0
    li t6, -7
    j P24_CAPTURE_PLAY_LOOP
P24_CAPTURE_PLAY_4:
    addi t0, t0, 1
    mv t1, a0
    li t6, -9
    j P24_CAPTURE_PLAY_LOOP
P13_BEHIND_PLAY:
    add t1, t1, t6
    bgt t1, s1, P13_CAPTURE_PLAY_TP
    blt t1, s0, P13_CAPTURE_PLAY_TP
    beq t1, a1, CAPTURE_PLAY_SUCCESS
    lb t2, 0(t1)
    bne t2, zero, P13_CAPTURE_PLAY_TP
    beq t3, s8, P13_CAPTURE_PLAY_TP
    j P13_BEHIND_PLAY
P24_BEHIND_PLAY:
    add t1, t1, t6
    bgt t1, s1, P24_CAPTURE_PLAY_TP
    blt t1, s0, P24_CAPTURE_PLAY_TP
    beq t1, a1, CAPTURE_PLAY_SUCCESS
    lb t2, 0(t1)
    bne t2, zero, P24_CAPTURE_PLAY_TP
    beq t3, s8, P24_CAPTURE_PLAY_TP
    j P24_BEHIND_PLAY
CAPTURE_PLAY_SUCCESS:
    sb zero, 0(t4)
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t0, 0(a1)
    sb t1, 0(a0)
    mv a4, t4
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    ret
CAPTURE_PLAY_FAILURE:
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    j BASIC_POSTPROCESSING_FAILURE

# FUNCTION THAT IMPLEMENTS MOVEMENT

MOVEMENT_PLAY:
    addi sp, sp, -16
    sw s8, 0(sp)
    sw s9, 4(sp)
    sw s10, 8(sp)
    sw s11, 12(sp)
    li s8, 1
    li s9, 2
    li s10, 3
    li s11, 4
    lb t0, 0(a0)
    sub t2, a1, a0
    beq t0, s8, MOVEMENT_PLAY_P1
    beq t0, s9, MOVEMENT_PLAY_P2
    beq t0, s10, MOVEMENT_PLAY_P34
    beq t0, s11, MOVEMENT_PLAY_P34
    ret
MOVEMENT_PLAY_P1:
    li t3, 7
    li t4, 9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j MOVEMENT_PLAY_FAILURE
MOVEMENT_PLAY_P2:
    li t3, -7
    li t4, -9
    beq t2, t3, MOVEMENT_SUCCESS
    beq t2, t4, MOVEMENT_SUCCESS
    j MOVEMENT_PLAY_FAILURE
MOVEMENT_PLAY_P34:
    li t0, 1
MOVEMENT_PLAY_P34_TP:
    beq t0, s8, MOVEMENT_PLAY_P34_CHECK_1
    beq t0, s9, MOVEMENT_PLAY_P34_CHECK_2
    beq t0, s10, MOVEMENT_PLAY_P34_CHECK_3
    beq t0, s11, MOVEMENT_PLAY_P34_CHECK_4
    j MOVEMENT_PLAY_FAILURE
MOVEMENT_PLAY_P34_CHECK_LOOP:
    add t2, t2, t3
    beq t2, a1, MOVEMENT_SUCCESS
    bgt t2, s1, MOVEMENT_PLAY_P34_TP 
    blt t2, s0, MOVEMENT_PLAY_P34_TP 
    lb t4, 0(t2)
    bne t4, zero, MOVEMENT_PLAY_P34_TP
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_1:
    addi t0, t0, 1
    mv t2, a0
    li t3, 7
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_2:
    addi t0, t0, 1
    mv t2, a0
    li t3, 9
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_3:
    addi t0, t0, 1
    mv t2, a0
    li t3, -7
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_PLAY_P34_CHECK_4:
    addi t0, t0, 1
    mv t2, a0
    li t3, -9
    j MOVEMENT_PLAY_P34_CHECK_LOOP
MOVEMENT_SUCCESS:
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t1, 0(a0)
    sb t0, 0(a1)
    mv a4, zero
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    ret
MOVEMENT_PLAY_FAILURE:
    lw s8, 0(sp)
    lw s9, 4(sp)
    lw s10, 8(sp)
    lw s11, 12(sp)
    addi sp, sp, 16
    j BASIC_POSTPROCESSING_FAILURE

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

# FUNCTION THAT IMPLEMENTS THE INPUT OF THE CPU

INPUT_CPU:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw s8, 4(sp)
    sw s9, 8(sp)
    sw s10, 12(sp)
    beq a4, zero, CPU_MOVEMENT
    j CPU_CAPTURE    
CPU_MOVEMENT:
    mv t0, s0
    addi s8, a3, 2 # value of the queen of player cpu
CPU_MOVEMENT_LOOP:
    lb t1, 0(t0)
    beq t1, a3, CPU_MOVEMENT_PLAY_TP
    beq t1, s8, CPU_MOVEMENT_PLAY_TP
CPU_MOVEMENT_LOOP_CONTINUE:
    addi t0, t0, 1
    j CPU_MOVEMENT_LOOP
CPU_MOVEMENT_PLAY_TP:
    li t3, 1
    beq t1, t3, CPU_MOVEMENT_PLAY_1
    li t3, 2
    beq t1, t3, CPU_MOVEMENT_PLAY_2
    li t3, 3
    beq t1, t3, CPU_MOVEMENT_PLAY_PROMOTED
    li t3, 4
    beq t1, t3, CPU_MOVEMENT_PLAY_PROMOTED
    j EXIT_INPUT_CPU
CPU_MOVEMENT_PLAY_1:
    addi t2, t0, 7
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    addi t2, t0, 9
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    li t3, 3
    j CPU_MOVEMENT_LOOP_CONTINUE
CPU_MOVEMENT_PLAY_2:
    addi t2, t0, -7
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    addi t2, t0, -9
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    li t3, 4
    beq t1, t3, CPU_MOVEMENT_PLAY_PROMOTED
    j CPU_MOVEMENT_LOOP_CONTINUE
CPU_MOVEMENT_PLAY_PROMOTED:
	addi t2, t0, 7
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    addi t2, t0, 9
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
	addi t2, t0, -7
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    addi t2, t0, -9
    lb t4, 0(t2)
    beq t4, zero, CPU_MOVEMENT_SUCCESS
    j CPU_MOVEMENT_LOOP_CONTINUE
CPU_MOVEMENT_SUCCESS:
    mv a0, t0
    mv a1, t2
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t0, 0(a1)
    sb t1, 0(a0)
    j EXIT_INPUT_CPU
CPU_CAPTURE:
    lb t0, 0(a0)
    lb t1, 0(a1)
    sb t0, 0(a1)
    sb t1, 0(a0)
    sb zero, 0(a4)
    addi s2, s2, -1
    j EXIT_INPUT_CPU
EXIT_INPUT_CPU:
    lw ra, 0(sp)
    lw s8, 4(sp)
    lw s9, 8(sp)
    lw s10, 12(sp)
    addi sp, sp, 16
    ret

# FUNCTION THAT MAKES FINAL VERIFICATIONS AND PRINTS

POSTPROCESSING:
	addi sp, sp, -4
	sw ra, 0(sp)
	bne a4, zero, POSTPROCESSING_CAPTURE_CHECK
POSTPROCESSING_CONTINUE:
	bne a4, zero, EXIT_TO_PLAY_AGAIN
	jal ra, PROMOTE_CHECK
EXIT_POSTPROCESSING:
	lw ra, 0(sp)
	addi sp, sp, 4
	li a5, 0 # if the player is not playing again
	ret
EXIT_TO_PLAY_AGAIN:
	lw ra, 0(sp)
	addi sp, sp, 4
	li a5, 1 # if the player is playing again
	j PLAY_AGAIN
POSTPROCESSING_CAPTURE_CHECK:
	mv a0, a1 # calls CAPTURE_CHECK with the destination as origin
	jal ra, CAPTURE_CHECK
	j POSTPROCESSING_CONTINUE

# FUNCTION THAT MAKES FINAL VERIFICATIONS AND PRINTS

POSTPROCESSING_CPU:
	addi sp, sp, -4
	sw ra, 0(sp)
	bne a4, zero, POSTPROCESSING_CPU_CAPTURE_CHECK
POSTPROCESSING_CPU_CONTINUE:
	bne a4, zero, EXIT_TO_PLAY_AGAIN_CPU
	jal ra, PROMOTE_CHECK
EXIT_POSTPROCESSING_CPU:
	lw ra, 0(sp)
	addi sp, sp, 4
	li a5, 0 # if the CPU is not playing again
	ret
EXIT_TO_PLAY_AGAIN_CPU:
	lw ra, 0(sp)
	addi sp, sp, 4
	li a5, 1 # if the CPU is playing again
	j PLAY_AGAIN_CPU
POSTPROCESSING_CPU_CAPTURE_CHECK:
	mv a0, a1 # calls CAPTURE_CHECK with the destination as origin
	jal ra, CAPTURE_CHECK
	j POSTPROCESSING_CPU_CONTINUE

# FUNCTION TO CHECK FOR PROMOTION OF PAWNS

PROMOTE_CHECK:
	addi sp, sp, -4
	sw ra, 0(sp)
	sub t0, a1, s0
	li t1, 56
	li t2, 7
	bge t0, t1, PROMOTE_PAWN_P1
	ble t0, t2, PROMOTE_PAWN_P2
	ret
PROMOTE_PAWN_P1:
	lb t0, 0(a1)
	li t1, 1
	beq t0, t1, PROMOTE_PAWN_SUCCESS
	ret
PROMOTE_PAWN_P2:
	lb t0, 0(a1)
	li t1, 2
	beq t0, t1, PROMOTE_PAWN_SUCCESS
	ret
PROMOTE_PAWN_SUCCESS:
	addi t0, t0, 2
	sb t0, 0(a1)
	mv a6, a1
	sub a6, a6, s0
	mv a7, t0
	jal ra, PRINT_TOKEN
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# FUNCTION TO PRINT THE TOKEN ON THE SCREEN

PRINT_TOKEN:
	addi sp, sp, -28
	sw ra, 0(sp)
	sw s5, 4(sp)
	sw s6, 8(sp)
	sw s7, 12(sp)
	sw s8, 16(sp)
	sw s9, 20(sp)
	sw s10, 24(sp)

    li t0, 0
    beq t0, a6, PRINT_A1
    
    li t0, 2
    beq t0, a6, PRINT_C1
    
    li t0, 4
    beq t0, a6, PRINT_E1
    
    li t0, 6
    beq t0, a6, PRINT_G1
    
    li t0, 9
    beq t0, a6, PRINT_B2
    
    li t0, 11
    beq t0, a6, PRINT_D2
    
    li t0, 13
    beq t0, a6, PRINT_F2
    
    li t0, 15
    beq t0, a6, PRINT_H2
    
    li t0, 16
    beq t0, a6, PRINT_A3
    
    li t0, 18
    beq t0, a6, PRINT_C3
    
    li t0, 20
    beq t0, a6, PRINT_E3
    
    li t0, 22
    beq t0, a6, PRINT_G3
    
    li t0, 25
    beq t0, a6, PRINT_B4
    
    li t0, 27
    beq t0, a6, PRINT_D4
    
    li t0, 29
    beq t0, a6, PRINT_F4
    
    li t0, 31
    beq t0, a6, PRINT_H4
    
    li t0, 32
    beq t0, a6, PRINT_A5
    
    li t0, 34
    beq t0, a6, PRINT_C5
    
    li t0, 36
    beq t0, a6, PRINT_E5
    
    li t0, 38
    beq t0, a6, PRINT_G5
    
    li t0, 41
    beq t0, a6, PRINT_B6
    
    li t0, 43
    beq t0, a6, PRINT_D6
    
    li t0, 45
    beq t0, a6, PRINT_F6
    
    li t0, 47
    beq t0, a6, PRINT_H6
    
    li t0, 48
    beq t0, a6, PRINT_A7
    
    li t0, 50
    beq t0, a6, PRINT_C7
    
    li t0, 52
    beq t0, a6, PRINT_E7
    
    li t0, 54
    beq t0, a6, PRINT_G7
    
    li t0, 57
    beq t0, a6, PRINT_B8
    
    li t0, 59
    beq t0, a6, PRINT_D8
    
    li t0, 61
    beq t0, a6, PRINT_F8
    
    li t0, 63
    beq t0, a6, PRINT_H8
    
PRINT_A1:
    li s5, A1	# Pos A1
    j SELECT_TOKEN

PRINT_C1:
    li s5, C1	# Pos C1
    j SELECT_TOKEN

PRINT_E1:
    li s5, E1
    j SELECT_TOKEN

PRINT_G1:
    li s5, G1
    j SELECT_TOKEN
    
PRINT_B2:
    li s5, B2
    j SELECT_TOKEN

PRINT_D2:
    li s5, D2
    j SELECT_TOKEN
    
PRINT_F2:
    li s5, F2
    j SELECT_TOKEN
    
PRINT_H2:
    li s5, H2
    j SELECT_TOKEN
     
PRINT_A3:
    li s5, A3
    j SELECT_TOKEN
    
PRINT_C3:
    li s5, C3
    j SELECT_TOKEN
    
PRINT_E3:
    li s5, E3
    j SELECT_TOKEN
    
PRINT_G3:
    li s5, G3
    j SELECT_TOKEN
    
PRINT_B4:
    li s5, B4
    j SELECT_TOKEN
    
PRINT_D4:
    li s5, D4
    j SELECT_TOKEN
    
PRINT_F4:
    li s5, F4
    j SELECT_TOKEN
    
PRINT_H4:
    li s5, H4
    j SELECT_TOKEN
    
PRINT_A5:
    li s5, A5
    j SELECT_TOKEN
    
PRINT_C5:
    li s5, C5
    j SELECT_TOKEN
    
PRINT_E5:
    li s5, E5
    j SELECT_TOKEN
    
PRINT_G5:
    li s5, G5
    j SELECT_TOKEN
    
PRINT_B6:
    li s5, B6
    j SELECT_TOKEN
    
PRINT_D6:
    li s5, D6
    j SELECT_TOKEN
    
PRINT_F6:
    li s5, F6
    j SELECT_TOKEN
    
PRINT_H6:
    li s5, H6
    j SELECT_TOKEN
     
PRINT_A7:
    li s5, A7
    j SELECT_TOKEN
    
PRINT_C7:
    li s5, C7
    j SELECT_TOKEN
    
PRINT_E7:
    li s5, E7
    j SELECT_TOKEN
     
PRINT_G7:
    li s5, G7
    j SELECT_TOKEN
    
PRINT_B8:
    li s5, B8
    j SELECT_TOKEN
    
PRINT_D8:
    li s5, D8
    j SELECT_TOKEN
    
PRINT_F8:
    li s5, F8
    j SELECT_TOKEN
    
PRINT_H8:
    li s5, H8
    j SELECT_TOKEN
    
SELECT_TOKEN:
    li t0, 0
    beq t0, a7, BACKGROUND
    
    li t0, 1
    beq t0, a7, BLUE
    
    li t0, 2
    beq t0, a7, RED
    
    li t0, 3
    beq t0, a7, DBLUE
    
    li t0, 4
    beq t0, a7, DRED
    
BACKGROUND:
    la s6, TILE
    j PRINT_ACTION
    
BLUE:
    la s6, PC_BLUE
    j PRINT_ACTION
    
RED:
    la s6, PC_RED
    j PRINT_ACTION
    
DBLUE:
    la s6, DM_BLUE
    j PRINT_ACTION
    
DRED:
    la s6, DM_RED
    j PRINT_ACTION
    
PRINT_ACTION:
    li t0, VGA_MEMORY_START
    mv t1, t0

PRINT_START:  		# 14 linhas
    li s7, 11           # Limite!
    li s8, 0            # Valor inicial
    add t1, t1, s5      # Desloca para VGA_START + XxY

OUTER_LOOP:
    li s9, 0
    li s10, 14
    j PRINT_TILE_INNER_LOOP
STEP:
    bge  s8, s7, PRINT_TOKEN_END
    addi s8, s8, 1
    addi t1, t1, 306
    j OUTER_LOOP

PRINT_TILE_INNER_LOOP:	# 13 colunas
    bge s9, s10, STEP
    lb t2, 0(s6)
    sb t2, 0(t1)
    addi s6, s6, 1
    addi t1, t1, 1
    addi s9, s9, 1
    j PRINT_TILE_INNER_LOOP
    
PRINT_TOKEN_END:
	lw ra, 0(sp)
	lw s5, 4(sp)
	lw s6, 8(sp)
	lw s7, 12(sp)
	lw s8, 16(sp)
	lw s9, 20(sp)
	lw s10, 24(sp)
	addi sp, sp, 28
    ret
