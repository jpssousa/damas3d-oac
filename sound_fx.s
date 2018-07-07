.text

SOUND_FXS:
	li a6, 2	# Set FX
	li a3, 127	# Set volume
	
	li t0, 0	# Movimenta a peça
	beq t0, a6, MOV_SOUND
	
	li t0, 1	# Peça come outra peça
	beq t0, a6, EAT_SOUND
	
	li t0, 2	# Peça vira rainha
	beq t0, a6, QUEEN_SOUND
	
	li t0, 3	# Player vence
	beq t0, a6, WIN_SOUND
	
	li t0, 4	# Player perde
	beq t0, a6, LOSE_SOUND
	
MOV_SOUND:
	# SOLTA O SOM DJ
	## [112 ~ 119] percussão
	## [120 ~ 127] sfx
	li a7, 33
	li a2, 113	# instrumento percussão
	li a0, 59	# nota
	li a1, 100	# duração 0,1s
	ecall
	li a0, 63	# nota
	li a1, 250	# duração 0,25s
	ecall
	j END_SOUND_FX

EAT_SOUND:
	# SOLTA O SOM DJ
	## [8-15] percussão cromática
	li a7, 33
	li a2, 9	# instrumento percussão
	li a0, 70	# nota
	li a1, 90	# duração 0,1s
	ecall
	li a0, 74	# nota
	li a1, 220	# duração 0,25s
	ecall
	j END_SOUND_FX

QUEEN_SOUND:
	# SOLTA O SOM DJ
	## [72-79] pipe
	li a7, 33
	li a2, 120	#instrumento pipe
	li a1, 20	# duração 0,01s

	li a0, 60 	# nota
	ecall
	li a0, 55 	# nota
	ecall
	li a0, 64 	# nota
	ecall
	li a0, 67 	# nota
	ecall
	li a0, 72 	# nota
	ecall
	li a0, 67 	# nota
	ecall


	li a0, 55 	# nota
	ecall
	li a0, 60 	# nota
	ecall
	li a0, 63 	# nota
	ecall
	li a0, 68 	# nota
	ecall
	li a0, 63 	# nota
	ecall
	li a0, 68 	# nota
	ecall
	li a0, 72 	# nota
	ecall
	li a0, 75 	# nota
	ecall
	li a0, 80 	# nota
	ecall
	li a0, 75 	# nota
	ecall


	li a0, 62 	# nota
	ecall
	li a0, 65 	# nota
	ecall
	li a0, 69 	# nota
	ecall
	li a0, 65 	# nota
	ecall
	li a0, 69 	# nota
	ecall
	li a0, 73 	# nota
	ecall
	li a0, 76 	# nota
	ecall
	li a0, 73 	# nota
	ecall
	li a0, 76 	# nota
	ecall
	li a0, 82 	# nota
	ecall
	li a0, 76 	# nota
	ecall
	j END_SOUND_FX

WIN_SOUND:
	# SOLTA O SOM DJ
	# SEGUNDA VOZ
	li a0, 52
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 53
	li a1, 75
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 53
	li a2, 2
	li a7, 31
	ecall
	li a0, 60
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 60
	li a2, 2
	li a7, 31
	ecall
	li a0, 64
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 64
	li a2, 2
	li a7, 31
	ecall
	li a0, 67
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 67
	li a2, 2
	li a7, 31
	ecall
	li a0, 72
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 72
	li a2, 2
	li a7, 31
	ecall
	li a0, 76
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 76
	li a1, 400
	li a2, 2
	li a7, 31
	ecall
	li a0, 79
	li a1, 400
	li a2, 2
	li a7, 33
	ecall

	li a0, 72
	li a2, 2
	li a7, 31
	ecall
	li a0, 76
	li a2, 2
	li a7, 33
	ecall
	
	# Session 2
	li a0, 50
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 56
	li a1, 75
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 56
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 60
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 56
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 63
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 63
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 68
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 68
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 72
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 72
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 75
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 75
	li a1, 400
	li a2, 2
	li a7, 31
	ecall
	li a0, 80
	li a1, 400
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 72
	li a1, 400
	li a2, 2
	li a7, 31
	ecall
	li a0, 75
	li a2, 2
	li a7, 33
	ecall

	# Session 3
	li a0, 53
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 58
	li a1, 75
	li a2, 2
	li a7, 33
	ecall

	li a0, 58
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 62
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 63
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 65
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 65
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 70
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 70
	li a1, 75
	li a2, 2
	li a7, 31
	ecall
	li a0, 74
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 74
	li a1, 400
	li a2, 2
	li a7, 31
	ecall
	li a0, 77
	li a1, 75
	li a2, 2
	li a7, 33
	ecall

	li a0, 74
	li a1, 400
	li a2, 2
	li a7, 31
	ecall
	li a0, 82
	li a1, 400
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 82
	li a1, 75
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 82
	li a2, 2
	li a7, 33
	ecall
	
	li a0, 84
	li a1, 400
	li a2, 2
	li a7, 31
	ecall
	li a0, 82
	li a2, 2
	li a7, 33
	ecall
		
	j END_SOUND_FX
	
	
LOSE_SOUND:
	# SOLTA O SOM DJ
	## [16-23] brass
	li a7, 33
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	li a2, 19	# instrumento brass
	ecall
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	ecall
	li a0, 60	# nota
	li a1, 100	# duração 0,1s
	ecall
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	ecall
	li a0, 63	# nota
	li a1, 500	# duração 0,5s
	ecall
	li a0, 62	# nota
	li a1, 100	# duração 0,1s
	ecall
	li a0, 62	# nota
	li a1, 500	# duração 0,5s
	ecall
	li a0, 60	# nota
	li a1, 100	# duração 0,1s
	ecall
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	ecall
	li a0, 59	# nota
	li a1, 100	# duração 0,1s
	ecall
	li a0, 60	# nota
	li a1, 1000	# duração 1s
	ecall
	j END_SOUND_FX
	
END_SOUND_FX:
	li a7, 10
	ecall
	# ret