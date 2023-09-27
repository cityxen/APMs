
// NEW C128 Commands (C64 KERNAL)
IECIN       $FFA5	65445	Serial - byte input	                    
CHKIN       $FFC6	65478	Set input channel	                    
CHKOU       $FFC9	65481	Set output channel	                    
CHRIN       $FFCF	65487	Input from channel	                    
CHROU       $FFD2	65490	Output to channel	                    
IECOU       $FFA8	65448	Serial - byte output	                
CINT        $FF81	65409	Initialize screen editor and devices	
CLALL       $FFE7	65511	Close all channels and files	        
CLOSE       $FFC3	65475	Close logical file	                    
CLRCH       $FFCC	65484	Restore default channels	            
GETIN       $FFE4	65508	Read buffered data	                    
IOBAS       $FFF3	65523	Reads base address of I/O block	        
IOINI       $FF84	65412	Initialize system I/O	                
LISTE       $FFB1	65457	Serial - send listen command	        
LOAD        $FFD5	65493	Load from file	                        
MEMBO       $FF9C	65436	Set/read bottom of system RAM           
MEMTO       $FF99	65433	Read/set top of system RAM	            
OPEN        $FFC0	65472	Open logical file	                    
PLOT        $FFF0	65520	Read/set cursor position	            
RAMTA       $FF87	65415	Init RAM and buffers	
RDTIM       $FFDE	65502	Read internal clock
READS       $FFB7	65463	Read I/O status byte
RESTO       $FF8A	65418	Initialize Kernal indirects
SAVE        $FFD8	65496	Save to file
SCNKE       $FF9F	65439	Scan keyboard
SCROR       $FFED	65517	Get current screen window size
SECON       $FF93	65427	Serial - send SA after LISTEN
SETLF       $FFBA	65466	Set channel LA, FA, SA
SETMS       $FF90	65424	Kernal messages on/off
SETNA       $FFBD	65469	Set filename pointers
SETTI       $FFDB	65499	Set internal clock
SETTM       $FFA2	65442	(reserved)
STOP        $FFE1	65505	Scan stop key
TALK        $FFB4	65460	Serial - send talk
TKSA        $FF96	65430	Serial - send SA after TALK
UDTIM       $FFEA	65514	Increment internal clock
UNLSN       $FFAE	65454	Serial - send unlisten
UNTLK       $FFAB	65451	Serial - send untalk
VECTO       $FF8D	65421	Initialize or copy indirects
// NEW C128 Commands
BOOT_CALL   $FF53	65363	Boot load program from disk	        
C64MODE	    $FF4D	65357	Reconfigure system as a C64	            
CLOSE ALL   $FF4A	65354	Close all files on a device	        
DLCHR	    $FF62	65378	Init 80-col character RAM	            
DMA_CALL    $FF50	65360	Send command to DMA device	        
GETCFG	    $FF6B	65387	Lookup MMU data for given bank	        
INDCMP	    $FF7A	65402	CMP (cmpvec),Y to any bank	            
INDFET	    $FF74	65396	LDA (fetvec),Y from any bank	        
INDSTA	    $FF77	65399	STA (stavec),Y to any bank	            
JSRFAR	    $FF6E	65390	Gosub in another bank
LKUPLA	    $FF59	65369	Search table for given LA
LKUPSA	    $FF5C	65372	Search tables for given SA
PFKEY	    $FF65	65381	Program a function key
PHOENIX	    $FF56	65366	Init function cartridges
PRIMM	    $FF7D	65405	Print Immediate utility
SETBNK	    $FF68	65384	Set bank for I/O operations
SPIN_SPOUT	$FF47	65351	Setup fast serial ports for I/O
SWAPPER     $FF5F	65375	Switch between 40 and 80 columns