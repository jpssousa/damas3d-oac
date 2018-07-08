.eqv NoteData           0xFF200178
.eqv NoteClock          0xFF20017C
.eqv NoteMelody         0xFF200180

######### Macro que verifica se eh a DE2 ###############
.macro DE2(%salto)
	li tp, 0x10008000			# carrega tp = 0x10008000
	bne gp,tp,%salto
.end_macro

.text
SOUND_FXS:
	#li a6, 5	# Set FX
	addi sp, sp -28 # aloca espaço
	sw ra, 0(sp) # salva ra
	sw a0, 4(sp) # salva a0
	sw a1, 8(sp) # salva a1
	sw a2, 12(sp) # salva a2
	sw a3, 16(sp) # salva a3
	sw a6, 20(sp) # salva a6
	sw a7, 24(sp) # salva a7
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

	li t0, 5	# Movimento errado
	beq t0, a6, ERROR_SOUND

###########################################
#        MidiOut 31 (2015/1)              #
#  a0 = pitch (0-127)                    #
#  a1 = duration in milliseconds         #
#  a2 = instrument (0-15)                #
#  a3 = volume (0-127)                   #
###########################################


#################################################################################################
#
# Note Data           = 32 bits     |   1'b - Melody   |   4'b - Instrument   |   7'b - Volume   |   7'b - Pitch   |   1'b - End   |   1'b - Repeat   |   11'b - Duration   |
#
# Note Data (ecall) = 32 bits     |   1'b - Melody   |   4'b - Instrument   |   7'b - Volume   |   7'b - Pitch   |   13'b - Duration   |
#
#################################################################################################
midiOut: DE2(midiOutDE2)
	li a7,31		# Chama o ecall normal
	ecall
	j fimmidiOut

midiOutDE2:	
	li t0, NoteData
    add t1, zero, zero
	# Melody = 0
    
    # Definicao do Instrumento
   	andi t2, a2, 0x0000000F
    slli t2, t2, 27
    or t1, t1, t2

    # Definicao do Volume
    andi t2, a3, 0x0000007F
    slli t2, t2, 20
    or t1, t1, t2

    # Definicao do Pitch
    andi t2, a0, 0x0000007F
    slli t2, t2, 13
    or t1, t1, t2

    # Definicao da Duracao
	li t4, 0x1FF
	slli t4, t4, 4
	addi t4, t4, 0xF			# t4 = 0x00001FFF
    and t2, a1, t4
    or t1, t1, t2

	# Guarda a definicao da duracao da nota na Word 1
	j SintMidOut

SintMidOut:	
	sw t1, 0(t0)

	# Verifica a subida do clock AUD_DACLRCK para o sintetizador receber as definicoes
	li t2, NoteClock

Check_AUD_DACLRCK:     	
	lw t3, 0(t2)
    beq t3, zero, Check_AUD_DACLRCK

fimmidiOut: jr ra

###########################################
#        MidiOut 33 (2015/1)              #
#  a0 = pitch (0-127)                    #
#  a1 = duration in milliseconds         #
#  a2 = instrument (0-127)               #
#  a3 = volume (0-127)                   #
###########################################

#################################################################################################
#
# Note Data             = 32 bits     |   1'b - Melody   |   4'b - Instrument   |   7'b - Volume   |   7'b - Pitch   |   1'b - End   |   1'b - Repeat   |   8'b - Duration   |
#
# Note Data (ecall)   	= 32 bits     |   1'b - Melody   |   4'b - Instrument   |   7'b - Volume   |   7'b - Pitch   |   13'b - Duration   |
#
#################################################################################################
midiOutSync: DE2(midiOutSyncDE2)
	li a7,33		# Chama o ecall normal
	ecall
	j fimmidiOutSync
	
midiOutSyncDE2:	
	li t0, NoteData
    add t1, zero, zero

    # Melody = 1
    lui t1, 0x08000
	slli t1, t1, 4			# t1 = 0x80000000

    # Definicao do Instrumento
    andi t2, a2, 0x0000000F
    slli t2, t2, 27
    or t1, t1, t2

    # Definicao do Volume
    andi t2, a3, 0x0000007F
    slli t2, t2, 20
    or t1, t1, t2

    # Definicao do Pitch
    andi t2, a0, 0x0000007F
    slli t2, t2, 13
    or t1, t1, t2

    # Definicao da Duracao
	li t4, 0x1FF
	slli t4, t4, 4
	addi t4, t4, 0xF			# t4 = 0x00001FFF
    and t2, a1, t4
    or t1, t1, t2

    # Guarda a definicao da duracao da nota na Word 1
    j SintMidOutSync

SintMidOutSync:	
	sw t1, 0(t0)

    # Verifica a subida do clock AUD_DACLRCK para o sintetizador receber as definicoes
    li t2, NoteClock
    li t4, NoteMelody

Check_AUD_DACLRCKSync:	
	lw      t3, 0(t2)
    beq     t3, zero, Check_AUD_DACLRCKSync

Melody:
   	lw      t5, 0(t4)
	bne     t5, zero, Melody

fimmidiOutSync:	jr ra


	
MOV_SOUND:
	# SOLTA O SOM DJ
	## [112 ~ 119] percussão
	## [120 ~ 127] sfx
	li a2, 113	# instrumento percussão
	li a0, 59	# nota
	li a1, 100	# duração 0,1s
	#li a7, 33
	jal ra, midiOutSync
	li a0, 63	# nota
	li a1, 250	# duração 0,25s
	jal ra, midiOutSync
	j END_SOUND_FX

EAT_SOUND:
	# SOLTA O SOM DJ
	## [8-15] percussão cromática
	li a2, 9	# instrumento percussão
	li a0, 70	# nota
	li a1, 90	# duração 0,1s
	#li a7, 33
	jal ra, midiOutSync
	li a0, 74	# nota
	li a1, 220	# duração 0,25s
	jal ra, midiOutSync
	j END_SOUND_FX

QUEEN_SOUND:
	# SOLTA O SOM DJ
	## [72-79] pipe
	##li a7, 33
	li a2, 120	#instrumento pipe
	li a1, 15	# duração 0,01s

	li a0, 60 	# nota
	jal ra, midiOutSync
	li a0, 55 	# nota
	jal ra, midiOutSync
	li a0, 64 	# nota
	jal ra, midiOutSync
	li a0, 67 	# nota
	jal ra, midiOutSync
	li a0, 72 	# nota
	jal ra, midiOutSync
	li a0, 67 	# nota
	jal ra, midiOutSync


	li a0, 55 	# nota
	jal ra, midiOutSync
	li a0, 60 	# nota
	jal ra, midiOutSync
	li a0, 63 	# nota
	jal ra, midiOutSync
	li a0, 68 	# nota
	jal ra, midiOutSync
	li a0, 63 	# nota
	jal ra, midiOutSync
	li a0, 68 	# nota
	jal ra, midiOutSync
	li a0, 72 	# nota
	jal ra, midiOutSync
	li a0, 75 	# nota
	jal ra, midiOutSync
	li a0, 80 	# nota
	jal ra, midiOutSync
	li a0, 75 	# nota
	jal ra, midiOutSync


	li a0, 62 	# nota
	jal ra, midiOutSync
	li a0, 65 	# nota
	jal ra, midiOutSync
	li a0, 69 	# nota
	jal ra, midiOutSync
	li a0, 65 	# nota
	jal ra, midiOutSync
	li a0, 69 	# nota
	jal ra, midiOutSync
	li a0, 73 	# nota
	jal ra, midiOutSync
	li a0, 76 	# nota
	jal ra, midiOutSync
	li a0, 73 	# nota
	jal ra, midiOutSync
	li a0, 76 	# nota
	jal ra, midiOutSync
	li a0, 82 	# nota
	jal ra, midiOutSync
	li a0, 76 	# nota
	jal ra, midiOutSync
	j END_SOUND_FX

WIN_SOUND:
	# SOLTA O SOM DJ
	# SEGUNDA VOZ
	li a0, 52
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 53
	li a1, 75
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 53
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 60
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 60
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 64
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 64
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 67
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 67
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 72
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 72
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 76
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 76
	li a1, 400
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 79
	li a1, 400
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync

	li a0, 72
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 76
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	# Session 2
	li a0, 50
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 56
	li a1, 75
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 56
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 60
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 56
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 63
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 63
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 68
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 68
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 72
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 72
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 75
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 75
	li a1, 400
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 80
	li a1, 400
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 72
	li a1, 400
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 75
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync

	# Session 3
	li a0, 53
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 58
	li a1, 75
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync

	li a0, 58
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 62
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 63
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 65
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 65
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 70
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 70
	li a1, 75
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 74
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 74
	li a1, 400
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 77
	li a1, 75
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync

	li a0, 74
	li a1, 400
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 82
	li a1, 400
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
	
	li a0, 82
	li a1, 75
	li a2, 2
	#li a7, 33
	jal ra, midiOut
	
	li a0, 82
	li a2, 2
	#li a7, 33
	jal ra, midiOut
	
	li a0, 84
	li a1, 400
	li a2, 2
	#li a7, 31
	jal ra, midiOut
	li a0, 82
	li a2, 2
	#li a7, 33
	jal ra, midiOutSync
		
	j END_SOUND_FX
	
	
LOSE_SOUND:
	# SOLTA O SOM DJ
	## [16-23] brass
	#li a7, 33
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	li a2, 19	# instrumento brass
	jal ra, midiOutSync
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	jal ra, midiOutSync
	li a0, 60	# nota
	li a1, 100	# duração 0,1s
	jal ra, midiOutSync
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	jal ra, midiOutSync
	li a0, 63	# nota
	li a1, 500	# duração 0,5s
	jal ra, midiOutSync
	li a0, 62	# nota
	li a1, 100	# duração 0,1s
	jal ra, midiOutSync
	li a0, 62	# nota
	li a1, 500	# duração 0,5s
	jal ra, midiOutSync
	li a0, 60	# nota
	li a1, 100	# duração 0,1s
	jal ra, midiOutSync
	li a0, 60	# nota
	li a1, 500	# duração 0,5s
	jal ra, midiOutSync
	li a0, 59	# nota
	li a1, 100	# duração 0,1s
	jal ra, midiOutSync
	li a0, 60	# nota
	li a1, 1000	# duração 1s
	jal ra, midiOutSync
	j END_SOUND_FX
	
ERROR_SOUND:
	# SOLTA O SOM DJ
	## [80 ~ 103] synth
	## [120 ~ 127] sfx
	li a2, 90	# instrumento synth
	li a0, 30	# nota
	li a1, 100	# duração 0,1s
	jal ra, midiOutSync
	li a0, 29	# nota
	li a1, 400	# duração 0,4s
	jal ra, midiOutSync
	j END_SOUND_FX

END_SOUND_FX:
	lw ra, 0(sp) # recupera ra
	lw a0, 4(sp) # salva a0
	lw a1, 8(sp) # salva a1
	lw a2, 12(sp) # salva a2
	lw a3, 16(sp) # salva a3
	lw a6, 20(sp) # salva a6
	lw a7, 24(sp) # salva a7
	addi sp, sp, 28 # volta sp ao lugar
	jr ra 	# volta ao programa principal
	#ret
