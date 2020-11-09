//ASM      PROC NAME=,                                                          
//             SYSLMOD=<HLQ>.<QUAL2>.LOAD                                        
//ASM      EXEC PGM=ASMA90,PARM='NOXREF,NOESD,NORLD,OBJECT,NODECK'              
//SYSLIB   DD  DISP=SHR,DSN=SYS1.MACLIB                                         
//SYSUT1   DD  UNIT=<UNIT>,SPACE=(CYL,(5,5))                                    
//SYSUT2   DD  UNIT=<UNIT>,SPACE=(CYL,(2,1))                                    
//SYSUT3   DD  UNIT=<UNIT>,SPACE=(CYL,(2,1))                                    
//SYSPRINT DD  SYSOUT=<SYSOUT>,DCB=(BLKSIZE=3146)                                      
//SYSLIN   DD  UNIT=<UNIT>,SPACE=(CYL,(1,1)),                                   
//       DISP=(,PASS),DCB=(BLKSIZE=3120)                                        
//LKED     EXEC PGM=HEWL,COND=(8,LE,ASM),                                       
//        PARM='MAP,LIST,NCAL,LET,SIZE=(490K,40K),AMODE=24,RMODE=24'            
//SYSLIN   DD  DSN=*.ASM.SYSLIN,DISP=(OLD,DELETE)                               
//         DD  DDNAME=SYSIN                                                     
//SYSUT1   DD  UNIT=<UNIT>,SPACE=(3156,(24,20))                                 
//SYSPRINT DD  SYSOUT=<SYSOUT>,DCB=(BLKSIZE=2420,LRECL=121,RECFM=FBSA)          
//SYSLMOD  DD  DISP=SHR,DSN=&SYSLMOD(&NAME)
//         PEND                                     
//*                                                                             
//*                                                                             
