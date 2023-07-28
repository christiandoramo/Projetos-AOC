	.text
main:		
	jal	getc
	ori	$a0, $v0, 0
	jal	putc
exit:
	li      $v0, 10		
	syscall			

getc:		
#	v0 = received byte		
	lui     $t0,0xffff		
gcloop:
	lw	$t1,0($t0)	        # read rcv ctrl
	andi	$t1,$t1,0x0001		# extract ready bit
	beq	$t1,$0,gcloop		# keep polling till ready
	lw	$v0,4($t0)		# read data and rtn
	jr	$ra		
	
putc:		
#	a0 = byte to trransmit
	lui     $t0,0xffff			
pcloop:
	lw	$t1,8($t0)		# read tx ctrl
	andi	$t1,$t1,0x0001  	# extract ready bit 
	beq	$t1,$0,pcloop		# wait till ready
	sw	$a0, 0xc($t0)		# write data
	jr	$ra		
	
	.data








