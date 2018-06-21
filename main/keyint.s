####################################################
#  Programa de exemplo de interrup�ao do teclado   #
#  usando o Keyboard Display MMIO Tool		   #
#  ISC Nov 2017				           #
#  Marcus Vinicius			           #
####################################################
Sapo n�o funciona...

.text

	# seta o exception handler
 	la t0,KDInterrupt		# carrega em t0 o endereco base das rotinas do sistema ECALL
 	csrrw zero,5,t0 		# seta utvec (reg 5) para o endereco t0
 	csrrsi zero,0,7 		# seta o bit de habilita��o de interrup��o em ustatus (reg 0)
 	
 	
# programa do usu�rio
	li t1,0xFF200000	# Endere�o de controle do KDMMIO
	li t0,0x02		# bit 1 habilita/desabilita a interrup��o
	sw t0,0(t1)   		# Habilita interrup��o do teclado

	li a7,101
#	ecall
	li s0,0			# zera contador
CONTA:	#addi s0,s0,1		# incrementa contador
	j CONTA			# volta ao loop
	



# rotina de tratamento da interrup��o
KDInterrupt: 	li t1,0xFF200000		# carrega o endere�o base do KDMMIO
  		lw t2,4(t1)  			# le a tecla
		sw t2,12(t1) 			# escreve no display

		# Retorna da Interrupcao
	    	csrrw tp, 65, zero	# le o valor de EPC salvo no registrador uepc (reg 65)
		addi tp, tp, 4		# soma 4 para obter a instru�ao seguinte ao ecall
		csrrw zero, 65, tp	# coloca no registrador uepc
		uret			# retorna PC=uepc
		
		