	.text
eco:		
	jal	getc			# get c
	ori	$a0, $v0, 0	 #a0 = v0 (param a0 =retorno de get c) 
	jal	putc                    #put c
	li $t0, 10
	beq $v0, $10, exit  # Repete se valor lido for diferente de 10 ( "Enter")
	j eco
exit:
	li      $v0, 10		
	syscall			

getc:		
#	v0 = received byte		
	lui     $t0,0xffff		
getcloop:
	lw	$t1,0($t0)	        # read rcv ctrl
	andi	$t1,$t1,0x0001		# extract ready bit
	beq	$t1,$0,getcloop		# keep polling till ready
	lw	$v0,4($t0)		# read data and rtn
	jr	$ra		
	
putc:		
#	a0 = byte to trransmit
	lui     $t0,0xffff			
putcloop:
	lw	$t1,8($t0)		# read tx ctrl
	andi	$t1,$t1,0x0001  	# extract ready bit 
	beq	$t1,$0,putcloop		# wait till ready
	sw	$a0, 0xc($t0)		# write data
	jr	$ra		
	
	.data








