//JCL1     JCLLIB  ORDER=<HLQ>.<QUAL2>.JCL                                     
//***** F3DDFWLM *************************************************              
//*  (C) COPYRIGHT IBM CORP. 2016                                               
//*  ALL RIGHTS RESERVED                                                        
//*  LICENSED MATERIALS - PROPERTY OF IBM                                       
//*  REFER TO COPYRIGHT INSTRUCTIONS, FORM NUMBER G120-2083                     
//*******************************************************************           
//*                                                                             
//* THIS JOB CREATES WLM-HELPFUL INFORMATION ON A SINGLE CORRELATION ID         
//* FOR A SINGLE SUBSYSTEM - ACROSS ALL THE DATA WE HAVE IN THE FLAT            
//* FILES.                                                                      
//*                                                                             
//* TO RUN IT FIRST:                                                            
//*                                                                             
//* 1) GLOBAL CHANGE <SMFID> TO THE SYSTEM.                                        
//*                                                                             
//* 2) GLOBAL CHANGE <SSID> TO THE SUBSYSTEM.                                     
//*                                                                             
//* 3) GLOBAL CHANGE <CORRID> TO THE CORRELATION ID YOU WANT                    
//*                                                                             
//* THEN SUBMIT.                                                                
//*                                                                             
//* YOU CAN ADJUST THE INCLUDE STATEMENTS AND IF YOU DO TAKE CARE TO            
//* CHANGE THE MEMBER NAMES IN THE REPORT DD STATEMENTS.                        
//*                                                                             
//*                                                                             
//* EDIT SET STATEMENT BELOW FOR SMFID AND SSID                                 
//SMFID SET SMFID=<SMFID>                                                          
//SSID  SET SSID=<SSID>                                                           
//*                                                                             
//*                                                                             
//RUNSYMS  EXEC PGM=IEBGENER                                                    
//SYSUT1   DD *                                                                 
* Edited by analyst                                                             
THIS_SMFID,C'<SMFID>'                                                              
THIS_SSID,C'<SSID>'                                                               
THIS_CORRID,C'<CORRID>'                                                             
*                                                                               
* Response time bucket upper limits                                             
* 1 Second is +4096000000                                                       
* 1ms is +4096000                                                               
* 1us is +4096                                                                  
RT_BUCKET0,+1024000       250us                                                 
RT_BUCKET1,+2048000       500us                                                 
RT_BUCKET2,+4096000       1ms                                                   
RT_BUCKET3,+8192000       2ms                                                   
RT_BUCKET4,+12288000      3ms                                                   
RT_BUCKET5,+16384000      4ms                                                   
RT_BUCKET6,+20480000      5ms                                                   
RT_BUCKET7,+40960000      10ms                                                  
RT_BUCKET8,+102400000     25ms                                                  
RT_BUCKET9,+204800000     50ms                                                  
RT_BUCKET10,+409600000     100ms                                                
RT_BUCKET11,+1024000000    250ms                                                
RT_BUCKET12,+2048000000    500ms                                                
RT_BUCKET13,+4096000000    1s                                                   
RT_BUCKET14,+8192000000    2s                                                   
RT_BUCKET15,+20480000000   5s                                                   
RT_BUCKET16,+40960000000   10s                                                  
RT_BUCKET17,+81920000000   20s                                                  
*                                                                               
* C1 TCB bucket upper limits                                                    
* 1 Second is +4096000000                                                       
* 1ms is +4096000                                                               
* 1us is +4096                                                                  
C1TCB_BUCKET0,+102400        25us                                               
C1TCB_BUCKET1,+204800        50us                                               
C1TCB_BUCKET2,+409600        100us                                              
C1TCB_BUCKET3,+819200        200us                                              
C1TCB_BUCKET4,+1228800       300us                                              
C1TCB_BUCKET5,+1638400       400us                                              
C1TCB_BUCKET6,+2048000       500us                                              
C1TCB_BUCKET7,+4096000       1ms                                                
C1TCB_BUCKET8,+8192000       2ms                                                
C1TCB_BUCKET9,+20480000      5ms                                                
C1TCB_BUCKET10,+40960000      10ms                                              
C1TCB_BUCKET11,+102400000     25ms                                              
C1TCB_BUCKET12,+204800000     50ms                                              
C1TCB_BUCKET13,+409600000     100ms                                             
C1TCB_BUCKET14,+1024000000    250ms                                             
C1TCB_BUCKET15,+2048000000    500ms                                             
C1TCB_BUCKET16,+4096000000    1s                                                
C1TCB_BUCKET17,+8192000000    2s                                                
C1TCB_BUCKET18,+16384000000   4s                                                
*                                                                               
/*                                                                              
//SYSUT2   DD DSN=&&RUNSYMS,DISP=(NEW,PASS),UNIT=SYSDA,SPACE=(TRK,1)            
//SYSPRINT DD SYSOUT=K,HOLD=YES                                                 
//SYSIN    DD DUMMY                                                             
//*                                                                             
//RTMIN    EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=K,HOLD=YES                                                 
//SYSUDUMP DD SYSOUT=K,HOLD=YES                                                 
//SYSPRINT DD SYSOUT=K,HOLD=YES                                                 
//SYMNOUT  DD SYSOUT=K,HOLD=YES                                                 
//*                                                                             
//***** ZF2DDFC2 *************************************************              
//*  (C) COPYRIGHT IBM CORP. 2017                                               
//*  ALL RIGHTS RESERVED                                                        
//*  LICENSED MATERIALS - PROPERTY OF IBM                                       
//*  REFER TO COPYRIGHT INSTRUCTIONS, FORM NUMBER G120-2083                     
//*******************************************************************           
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                  
//REPORT   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.&SMFID&SSID..REPORTS(RTMIN)                   
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                              
//         DD DSN=&&RUNSYMS,DISP=SHR                                            
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
_MIN,*,2,PD                                                                     
*                                                                               
_COMMABORTS,*,4,BI                                                              
_COMMABORTS0,*,4,BI                                                             
_COMMABORTS1,*,4,BI                                                             
_COMMABORTS2,*,4,BI                                                             
_COMMABORTS3,*,4,BI                                                             
_COMMABORTS4,*,4,BI                                                             
_COMMABORTS5,*,4,BI                                                             
_COMMABORTS6,*,4,BI                                                             
_COMMABORTS7,*,4,BI                                                             
_COMMABORTS8,*,4,BI                                                             
_COMMABORTS9,*,4,BI                                                             
_COMMABORTS10,*,4,BI                                                            
_COMMABORTS11,*,4,BI                                                            
_COMMABORTS12,*,4,BI                                                            
_COMMABORTS13,*,4,BI                                                            
_COMMABORTS14,*,4,BI                                                            
_COMMABORTS15,*,4,BI                                                            
_COMMABORTS16,*,4,BI                                                            
_COMMABORTS17,*,4,BI                                                            
_COMMABORTS18,*,4,BI                                                            
*                                                                               
_C1TIME,*,8,BI                                                                  
*                                                                               
_C1TIME_COMM,*,8,BI                                                             
*                                                                               
_RT_BUCKET0,*,10,CH                                                             
_RT_BUCKET1,*,10,CH                                                             
_RT_BUCKET2,*,10,CH                                                             
_RT_BUCKET3,*,10,CH                                                             
_RT_BUCKET4,*,10,CH                                                             
_RT_BUCKET5,*,10,CH                                                             
_RT_BUCKET6,*,10,CH                                                             
_RT_BUCKET7,*,10,CH                                                             
_RT_BUCKET8,*,10,CH                                                             
_RT_BUCKET9,*,10,CH                                                             
_RT_BUCKET10,*,10,CH                                                            
_RT_BUCKET11,*,10,CH                                                            
_RT_BUCKET12,*,10,CH                                                            
_RT_BUCKET13,*,10,CH                                                            
_RT_BUCKET14,*,10,CH                                                            
_RT_BUCKET15,*,10,CH                                                            
_RT_BUCKET16,*,10,CH                                                            
_RT_BUCKET17,*,10,CH                                                            
_RT_BUCKET18,*,10,CH                                                            
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INCLUDE COND=(SMFID,EQ,THIS_SMFID,AND,                                         
  SSID,EQ,THIS_SSID,AND,                                                        
  CORRID,EQ,THIS_CORRID)                                                            
*                                                                               
 INREC IFTHEN=(WHEN=INIT,                                                       
   BUILD=(RDW,                                                                  
     TSDATE,                                                                    
     TSHOUR,                                                                    
     TSMIN,                                                                     
*                                                                               
* Prime Commits counters for each bucket                                        
     COMMABORT,                                                                 
*                                                                               
     19X'00000000',                                                             
*                                                                               
     C1TIME,                                                                    
*                                                                               
     C1TIME,DIV,COMMABORT,TO=BI,LENGTH=8,                                       
*                                                                               
* Formatted bucket upper limits                                                 
     C'    <250us',                                                             
     C'    <500us',                                                             
     C'      <1ms',                                                             
     C'      <2ms',                                                             
     C'      <3ms',                                                             
     C'      <4ms',                                                             
     C'      <5ms',                                                             
     C'     <10ms',                                                             
     C'     <25ms',                                                             
     C'     <50ms',                                                             
     C'    <100ms',                                                             
     C'    <250ms',                                                             
     C'    <500ms',                                                             
     C'       <1s',                                                             
     C'       <2s',                                                             
     C'       <5s',                                                             
     C'      <10s',                                                             
     C'      <20s',                                                             
     C'      >20s',                                                             
     X)),                                                                       
* Toss commits into individual buckets.                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET0),                                     
   OVERLAY=(_COMMABORTS0:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET1),                                     
   OVERLAY=(_COMMABORTS1:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET2),                                     
   OVERLAY=(_COMMABORTS2:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET3),                                     
   OVERLAY=(_COMMABORTS3:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET4),                                     
   OVERLAY=(_COMMABORTS4:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET5),                                     
   OVERLAY=(_COMMABORTS5:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET6),                                     
   OVERLAY=(_COMMABORTS6:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET7),                                     
   OVERLAY=(_COMMABORTS7:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET8),                                     
   OVERLAY=(_COMMABORTS8:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET9),                                     
   OVERLAY=(_COMMABORTS9:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET10),                                    
   OVERLAY=(_COMMABORTS10:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET11),                                    
   OVERLAY=(_COMMABORTS11:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET12),                                    
   OVERLAY=(_COMMABORTS12:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET13),                                    
   OVERLAY=(_COMMABORTS13:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET14),                                    
   OVERLAY=(_COMMABORTS14:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET15),                                    
   OVERLAY=(_COMMABORTS15:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET16),                                    
   OVERLAY=(_COMMABORTS16:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET17),                                    
   OVERLAY=(_COMMABORTS17:_COMMABORTS)),                                        
 IFTHEN=(WHEN=NONE,                                                             
   OVERLAY=(_COMMABORTS18:_COMMABORTS))                                         
*                                                                               
 SORT FIELDS=(_DATE,A,_HOUR,A,_MIN,A)                                           
*                                                                               
 SUM FIELDS=(_COMMABORTS,                                                       
*                                                                               
   _COMMABORTS0,                                                                
   _COMMABORTS1,                                                                
   _COMMABORTS2,                                                                
   _COMMABORTS3,                                                                
   _COMMABORTS4,                                                                
   _COMMABORTS5,                                                                
   _COMMABORTS6,                                                                
   _COMMABORTS7,                                                                
   _COMMABORTS8,                                                                
   _COMMABORTS9,                                                                
   _COMMABORTS10,                                                               
   _COMMABORTS11,                                                               
   _COMMABORTS12,                                                               
   _COMMABORTS13,                                                               
   _COMMABORTS14,                                                               
   _COMMABORTS15,                                                               
   _COMMABORTS16,                                                               
   _COMMABORTS17,                                                               
   _COMMABORTS18)                                                               
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"Response Time Distribution By Minute - ',THIS_SMFID,C'/',          
   THIS_SSID,C'","',THIS_CORRID,'",',                                               
   /,                                                                           
* 2nd line of titles                                                            
   /,                                                                           
* Time key field                                                                
   C'"Time",',                                                                  
* RT_BUCKET descriptions                                                        
   C'"',_RT_BUCKET0,'",',                                                       
   C'"',_RT_BUCKET1,'",',                                                       
   C'"',_RT_BUCKET2,'",',                                                       
   C'"',_RT_BUCKET3,'",',                                                       
   C'"',_RT_BUCKET4,'",',                                                       
   C'"',_RT_BUCKET5,'",',                                                       
   C'"',_RT_BUCKET6,'",',                                                       
   C'"',_RT_BUCKET7,'",',                                                       
   C'"',_RT_BUCKET8,'",',                                                       
   C'"',_RT_BUCKET9,'",',                                                       
   C'"',_RT_BUCKET10,'",',                                                      
   C'"',_RT_BUCKET11,'",',                                                      
   C'"',_RT_BUCKET12,'",',                                                      
   C'"',_RT_BUCKET13,'",',                                                      
   C'"',_RT_BUCKET14,'",',                                                      
   C'"',_RT_BUCKET15,'",',                                                      
   C'"',_RT_BUCKET16,'",',                                                      
   C'"',_RT_BUCKET17,'",',                                                      
   C'"',_RT_BUCKET18,'",',                                                      
   C'"Total",',                                                                 
   X),                                                                          
*                                                                               
 OUTREC=(RDW,                                                                   
*                                                                               
   _DATE,DT1,EDIT=(TTTT.TT.TT),X,                                               
   _HOUR,EDIT=(TT),C':',                                                        
   _MIN,EDIT=(TT),C',',                                                         
*                                                                               
   _COMMABORTS0,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS1,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS2,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS3,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS4,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS5,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS6,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS7,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS8,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS9,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS10,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS11,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS12,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS13,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS14,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS15,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS16,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS17,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS18,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS,EDIT=(IIIIIIIT),C',',                                            
*                                                                               
   20X)                                                                         
*                                                                               
 END                                                                            
/*                                                                              
//*                                                                             
/*                                                                              
//*                                                                             
//RTHOUR   EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=K,HOLD=YES                                                 
//SYSUDUMP DD SYSOUT=K,HOLD=YES                                                 
//SYSPRINT DD SYSOUT=K,HOLD=YES                                                 
//SYMNOUT  DD SYSOUT=K,HOLD=YES                                                 
//*                                                                             
//***** ZF2DDFC2 *************************************************              
//*  (C) COPYRIGHT IBM CORP. 2017                                               
//*  ALL RIGHTS RESERVED                                                        
//*  LICENSED MATERIALS - PROPERTY OF IBM                                       
//*  REFER TO COPYRIGHT INSTRUCTIONS, FORM NUMBER G120-2083                     
//*******************************************************************           
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                  
//REPORT   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.&SMFID&SSID..REPORTS(RTHOUR)                  
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                              
//         DD DSN=&&RUNSYMS,DISP=SHR                                            
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
_MIN,*,2,PD                                                                     
*                                                                               
_COMMABORTS,*,4,BI                                                              
_COMMABORTS0,*,4,BI                                                             
_COMMABORTS1,*,4,BI                                                             
_COMMABORTS2,*,4,BI                                                             
_COMMABORTS3,*,4,BI                                                             
_COMMABORTS4,*,4,BI                                                             
_COMMABORTS5,*,4,BI                                                             
_COMMABORTS6,*,4,BI                                                             
_COMMABORTS7,*,4,BI                                                             
_COMMABORTS8,*,4,BI                                                             
_COMMABORTS9,*,4,BI                                                             
_COMMABORTS10,*,4,BI                                                            
_COMMABORTS11,*,4,BI                                                            
_COMMABORTS12,*,4,BI                                                            
_COMMABORTS13,*,4,BI                                                            
_COMMABORTS14,*,4,BI                                                            
_COMMABORTS15,*,4,BI                                                            
_COMMABORTS16,*,4,BI                                                            
_COMMABORTS17,*,4,BI                                                            
_COMMABORTS18,*,4,BI                                                            
*                                                                               
_C1TIME,*,8,BI                                                                  
*                                                                               
_C1TIME_COMM,*,8,BI                                                             
*                                                                               
_RT_BUCKET0,*,10,CH                                                             
_RT_BUCKET1,*,10,CH                                                             
_RT_BUCKET2,*,10,CH                                                             
_RT_BUCKET3,*,10,CH                                                             
_RT_BUCKET4,*,10,CH                                                             
_RT_BUCKET5,*,10,CH                                                             
_RT_BUCKET6,*,10,CH                                                             
_RT_BUCKET7,*,10,CH                                                             
_RT_BUCKET8,*,10,CH                                                             
_RT_BUCKET9,*,10,CH                                                             
_RT_BUCKET10,*,10,CH                                                            
_RT_BUCKET11,*,10,CH                                                            
_RT_BUCKET12,*,10,CH                                                            
_RT_BUCKET13,*,10,CH                                                            
_RT_BUCKET14,*,10,CH                                                            
_RT_BUCKET15,*,10,CH                                                            
_RT_BUCKET16,*,10,CH                                                            
_RT_BUCKET17,*,10,CH                                                            
_RT_BUCKET18,*,10,CH                                                            
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 OPTION STOPAFT=9999999999                                                      
 INCLUDE COND=(SMFID,EQ,THIS_SMFID,AND,                                         
  SSID,EQ,THIS_SSID,AND,                                                        
  CORRID,EQ,THIS_CORRID)                                                            
*                                                                               
 INREC IFTHEN=(WHEN=INIT,                                                       
   BUILD=(RDW,                                                                  
     TSDATE,                                                                    
     TSHOUR,                                                                    
     TSMIN,                                                                     
*                                                                               
* Prime Commits counters for each bucket                                        
     COMMABORT,                                                                 
*                                                                               
     19X'00000000',                                                             
*                                                                               
     C1TIME,                                                                    
*                                                                               
     C1TIME,DIV,COMMABORT,TO=BI,LENGTH=8,                                       
*                                                                               
* Formatted bucket upper limits                                                 
     C'    <250us',                                                             
     C'    <500us',                                                             
     C'      <1ms',                                                             
     C'      <2ms',                                                             
     C'      <3ms',                                                             
     C'      <4ms',                                                             
     C'      <5ms',                                                             
     C'     <10ms',                                                             
     C'     <25ms',                                                             
     C'     <50ms',                                                             
     C'    <100ms',                                                             
     C'    <250ms',                                                             
     C'    <500ms',                                                             
     C'       <1s',                                                             
     C'       <2s',                                                             
     C'       <5s',                                                             
     C'      <10s',                                                             
     C'      <20s',                                                             
     C'      >20s',                                                             
     X)),                                                                       
*                                                                               
* Toss commits into individual buckets.                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET0),                                     
   OVERLAY=(_COMMABORTS0:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET1),                                     
   OVERLAY=(_COMMABORTS1:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET2),                                     
   OVERLAY=(_COMMABORTS2:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET3),                                     
   OVERLAY=(_COMMABORTS3:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET4),                                     
   OVERLAY=(_COMMABORTS4:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET5),                                     
   OVERLAY=(_COMMABORTS5:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET6),                                     
   OVERLAY=(_COMMABORTS6:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET7),                                     
   OVERLAY=(_COMMABORTS7:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET8),                                     
   OVERLAY=(_COMMABORTS8:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET9),                                     
   OVERLAY=(_COMMABORTS9:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET10),                                    
   OVERLAY=(_COMMABORTS10:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET11),                                    
   OVERLAY=(_COMMABORTS11:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET12),                                    
   OVERLAY=(_COMMABORTS12:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET13),                                    
   OVERLAY=(_COMMABORTS13:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET14),                                    
   OVERLAY=(_COMMABORTS14:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET15),                                    
   OVERLAY=(_COMMABORTS15:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET16),                                    
   OVERLAY=(_COMMABORTS16:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TIME_COMM,LT,RT_BUCKET17),                                    
   OVERLAY=(_COMMABORTS17:_COMMABORTS)),                                        
 IFTHEN=(WHEN=NONE,                                                             
   OVERLAY=(_COMMABORTS18:_COMMABORTS))                                         
*                                                                               
 SORT FIELDS=(_DATE,A,_HOUR,A)                                                  
*                                                                               
 SUM FIELDS=(_COMMABORTS,                                                       
*                                                                               
   _COMMABORTS0,                                                                
   _COMMABORTS1,                                                                
   _COMMABORTS2,                                                                
   _COMMABORTS3,                                                                
   _COMMABORTS4,                                                                
   _COMMABORTS5,                                                                
   _COMMABORTS6,                                                                
   _COMMABORTS7,                                                                
   _COMMABORTS8,                                                                
   _COMMABORTS9,                                                                
   _COMMABORTS10,                                                               
   _COMMABORTS11,                                                               
   _COMMABORTS12,                                                               
   _COMMABORTS13,                                                               
   _COMMABORTS14,                                                               
   _COMMABORTS15,                                                               
   _COMMABORTS16,                                                               
   _COMMABORTS17,                                                               
   _COMMABORTS18)                                                               
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"Response Time Distribution By Hour - ',THIS_SMFID,C'/',            
   THIS_SSID,C'","',THIS_CORRID,'",',                                               
* 2nd line of titles                                                            
   /,                                                                           
* Time key field                                                                
   C'"Time",',                                                                  
* RT_BUCKET descriptions                                                        
   C'"',_RT_BUCKET0,'",',                                                       
   C'"',_RT_BUCKET1,'",',                                                       
   C'"',_RT_BUCKET2,'",',                                                       
   C'"',_RT_BUCKET3,'",',                                                       
   C'"',_RT_BUCKET4,'",',                                                       
   C'"',_RT_BUCKET5,'",',                                                       
   C'"',_RT_BUCKET6,'",',                                                       
   C'"',_RT_BUCKET7,'",',                                                       
   C'"',_RT_BUCKET8,'",',                                                       
   C'"',_RT_BUCKET9,'",',                                                       
   C'"',_RT_BUCKET10,'",',                                                      
   C'"',_RT_BUCKET11,'",',                                                      
   C'"',_RT_BUCKET12,'",',                                                      
   C'"',_RT_BUCKET13,'",',                                                      
   C'"',_RT_BUCKET14,'",',                                                      
   C'"',_RT_BUCKET15,'",',                                                      
   C'"',_RT_BUCKET16,'",',                                                      
   C'"',_RT_BUCKET17,'",',                                                      
   C'"',_RT_BUCKET18,'",',                                                      
   C'"Total",',                                                                 
   X),                                                                          
*                                                                               
 OUTREC=(RDW,                                                                   
*                                                                               
   _DATE,DT1,EDIT=(TTTT.TT.TT),X,                                               
   _HOUR,EDIT=(TT),C',',                                                        
*                                                                               
   _COMMABORTS0,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS1,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS2,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS3,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS4,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS5,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS6,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS7,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS8,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS9,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS10,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS11,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS12,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS13,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS14,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS15,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS16,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS17,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS18,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS,EDIT=(IIIIIIIT),C',',                                            
*                                                                               
   20X)                                                                         
*                                                                               
/*                                                                              
//*                                                                             
//CPUMIN   EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=K,HOLD=YES                                                 
//SYSUDUMP DD SYSOUT=K,HOLD=YES                                                 
//SYSPRINT DD SYSOUT=K,HOLD=YES                                                 
//SYMNOUT  DD SYSOUT=K,HOLD=YES                                                 
//*                                                                             
//***** ZF2DDFC2 *************************************************              
//*  (C) COPYRIGHT IBM CORP. 2017                                               
//*  ALL RIGHTS RESERVED                                                        
//*  LICENSED MATERIALS - PROPERTY OF IBM                                       
//*  REFER TO COPYRIGHT INSTRUCTIONS, FORM NUMBER G120-2083                     
//*******************************************************************           
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                  
//REPORT   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.&SMFID&SSID..REPORTS(CPUMIN)                  
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                              
//         DD DSN=&&RUNSYMS,DISP=SHR                                            
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
_MIN,*,2,PD                                                                     
*                                                                               
_COMMABORTS,*,4,BI                                                              
_COMMABORTS0,*,4,BI                                                             
_COMMABORTS1,*,4,BI                                                             
_COMMABORTS2,*,4,BI                                                             
_COMMABORTS3,*,4,BI                                                             
_COMMABORTS4,*,4,BI                                                             
_COMMABORTS5,*,4,BI                                                             
_COMMABORTS6,*,4,BI                                                             
_COMMABORTS7,*,4,BI                                                             
_COMMABORTS8,*,4,BI                                                             
_COMMABORTS9,*,4,BI                                                             
_COMMABORTS10,*,4,BI                                                            
_COMMABORTS11,*,4,BI                                                            
_COMMABORTS12,*,4,BI                                                            
_COMMABORTS13,*,4,BI                                                            
_COMMABORTS14,*,4,BI                                                            
_COMMABORTS15,*,4,BI                                                            
_COMMABORTS16,*,4,BI                                                            
_COMMABORTS17,*,4,BI                                                            
_COMMABORTS18,*,4,BI                                                            
_COMMABORTS19,*,4,BI                                                            
*                                                                               
_C1TCB,*,8,BI                                                                   
*                                                                               
_C1TCB_COMM,*,8,BI                                                              
*                                                                               
_C1TCB_BUCKET0,*,10,CH                                                          
_C1TCB_BUCKET1,*,10,CH                                                          
_C1TCB_BUCKET2,*,10,CH                                                          
_C1TCB_BUCKET3,*,10,CH                                                          
_C1TCB_BUCKET4,*,10,CH                                                          
_C1TCB_BUCKET5,*,10,CH                                                          
_C1TCB_BUCKET6,*,10,CH                                                          
_C1TCB_BUCKET7,*,10,CH                                                          
_C1TCB_BUCKET8,*,10,CH                                                          
_C1TCB_BUCKET9,*,10,CH                                                          
_C1TCB_BUCKET10,*,10,CH                                                         
_C1TCB_BUCKET11,*,10,CH                                                         
_C1TCB_BUCKET12,*,10,CH                                                         
_C1TCB_BUCKET13,*,10,CH                                                         
_C1TCB_BUCKET14,*,10,CH                                                         
_C1TCB_BUCKET15,*,10,CH                                                         
_C1TCB_BUCKET16,*,10,CH                                                         
_C1TCB_BUCKET17,*,10,CH                                                         
_C1TCB_BUCKET18,*,10,CH                                                         
_C1TCB_BUCKET19,*,10,CH                                                         
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 OPTION STOPAFT=9999999999                                                      
 INCLUDE COND=(SMFID,EQ,THIS_SMFID,AND,                                         
  SSID,EQ,THIS_SSID,AND,                                                        
  CORRID,EQ,THIS_CORRID)                                                            
*                                                                               
 INREC IFTHEN=(WHEN=INIT,                                                       
   BUILD=(RDW,                                                                  
     TSDATE,                                                                    
     TSHOUR,                                                                    
     TSMIN,                                                                     
*                                                                               
* Prime Commits counters for each bucket                                        
     COMMABORT,                                                                 
*                                                                               
     20X'00000000',                                                             
*                                                                               
     C1TIME,                                                                    
*                                                                               
     C1TCB,DIV,COMMABORT,TO=BI,LENGTH=8,                                        
*                                                                               
* Formatted bucket upper limits                                                 
     C'     <25us',                                                             
     C'     <50us',                                                             
     C'    <100us',                                                             
     C'    <200us',                                                             
     C'    <300us',                                                             
     C'    <400us',                                                             
     C'    <500us',                                                             
     C'      <1ms',                                                             
     C'      <2ms',                                                             
     C'      <5ms',                                                             
     C'     <10ms',                                                             
     C'     <25ms',                                                             
     C'     <50ms',                                                             
     C'    <100ms',                                                             
     C'    <250ms',                                                             
     C'    <500ms',                                                             
     C'       <1s',                                                             
     C'       <2s',                                                             
     C'       <4s',                                                             
     C'       >4s',                                                             
     X)),                                                                       
* Toss commits into individual buckets.                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET0),                                   
   OVERLAY=(_COMMABORTS0:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET1),                                   
   OVERLAY=(_COMMABORTS1:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET2),                                   
   OVERLAY=(_COMMABORTS2:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET3),                                   
   OVERLAY=(_COMMABORTS3:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET4),                                   
   OVERLAY=(_COMMABORTS4:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET5),                                   
   OVERLAY=(_COMMABORTS5:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET6),                                   
   OVERLAY=(_COMMABORTS6:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET7),                                   
   OVERLAY=(_COMMABORTS7:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET8),                                   
   OVERLAY=(_COMMABORTS8:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET9),                                   
   OVERLAY=(_COMMABORTS9:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET10),                                  
   OVERLAY=(_COMMABORTS10:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET11),                                  
   OVERLAY=(_COMMABORTS11:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET12),                                  
   OVERLAY=(_COMMABORTS12:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET13),                                  
   OVERLAY=(_COMMABORTS13:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET14),                                  
   OVERLAY=(_COMMABORTS14:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET15),                                  
   OVERLAY=(_COMMABORTS15:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET16),                                  
   OVERLAY=(_COMMABORTS16:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET17),                                  
   OVERLAY=(_COMMABORTS17:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET18),                                  
   OVERLAY=(_COMMABORTS18:_COMMABORTS)),                                        
 IFTHEN=(WHEN=NONE,                                                             
   OVERLAY=(_COMMABORTS19:_COMMABORTS))                                         
*                                                                               
 SORT FIELDS=(_DATE,A,_HOUR,A,_MIN,A)                                           
*                                                                               
 SUM FIELDS=(_COMMABORTS,                                                       
*                                                                               
   _COMMABORTS0,                                                                
   _COMMABORTS1,                                                                
   _COMMABORTS2,                                                                
   _COMMABORTS3,                                                                
   _COMMABORTS4,                                                                
   _COMMABORTS5,                                                                
   _COMMABORTS6,                                                                
   _COMMABORTS7,                                                                
   _COMMABORTS8,                                                                
   _COMMABORTS9,                                                                
   _COMMABORTS10,                                                               
   _COMMABORTS11,                                                               
   _COMMABORTS12,                                                               
   _COMMABORTS13,                                                               
   _COMMABORTS14,                                                               
   _COMMABORTS15,                                                               
   _COMMABORTS16,                                                               
   _COMMABORTS17,                                                               
   _COMMABORTS18,                                                               
   _COMMABORTS19)                                                               
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"CPU Time Distribution By Minute - ',THIS_SMFID,C'/',               
   THIS_SSID,C'","',THIS_CORRID,'",',                                               
* 2nd line of titles                                                            
   /,                                                                           
* Time key field                                                                
   C'"Time",',                                                                  
* C1TCB_BUCKET descriptions                                                     
   C'"',_C1TCB_BUCKET0,'",',                                                    
   C'"',_C1TCB_BUCKET1,'",',                                                    
   C'"',_C1TCB_BUCKET2,'",',                                                    
   C'"',_C1TCB_BUCKET3,'",',                                                    
   C'"',_C1TCB_BUCKET4,'",',                                                    
   C'"',_C1TCB_BUCKET5,'",',                                                    
   C'"',_C1TCB_BUCKET6,'",',                                                    
   C'"',_C1TCB_BUCKET7,'",',                                                    
   C'"',_C1TCB_BUCKET8,'",',                                                    
   C'"',_C1TCB_BUCKET9,'",',                                                    
   C'"',_C1TCB_BUCKET10,'",',                                                   
   C'"',_C1TCB_BUCKET11,'",',                                                   
   C'"',_C1TCB_BUCKET12,'",',                                                   
   C'"',_C1TCB_BUCKET13,'",',                                                   
   C'"',_C1TCB_BUCKET14,'",',                                                   
   C'"',_C1TCB_BUCKET15,'",',                                                   
   C'"',_C1TCB_BUCKET16,'",',                                                   
   C'"',_C1TCB_BUCKET17,'",',                                                   
   C'"',_C1TCB_BUCKET18,'",',                                                   
   C'"',_C1TCB_BUCKET19,'",',                                                   
   C'"Total",',                                                                 
   X),                                                                          
*                                                                               
 OUTREC=(RDW,                                                                   
*                                                                               
   _DATE,DT1,EDIT=(TTTT.TT.TT),X,                                               
   _HOUR,EDIT=(TT),C':',                                                        
   _MIN,EDIT=(TT),C',',                                                         
*                                                                               
   _COMMABORTS0,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS1,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS2,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS3,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS4,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS5,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS6,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS7,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS8,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS9,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS10,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS11,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS12,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS13,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS14,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS15,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS16,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS17,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS18,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS19,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS,EDIT=(IIIIIIIT),C',',                                            
*                                                                               
   20X)                                                                         
 END                                                                            
*                                                                               
/*                                                                              
//*                                                                             
//CPUHOUR  EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=K,HOLD=YES                                                 
//SYSUDUMP DD SYSOUT=K,HOLD=YES                                                 
//SYSPRINT DD SYSOUT=K,HOLD=YES                                                 
//SYMNOUT  DD SYSOUT=K,HOLD=YES                                                 
//*                                                                             
//***** ZF2DDFC2 *************************************************              
//*  (C) COPYRIGHT IBM CORP. 2017                                               
//*  ALL RIGHTS RESERVED                                                        
//*  LICENSED MATERIALS - PROPERTY OF IBM                                       
//*  REFER TO COPYRIGHT INSTRUCTIONS, FORM NUMBER G120-2083                     
//*******************************************************************           
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                  
//REPORT   DD DISP=SHR,                                                         
//       DSN=<HLQ>.<QUAL2>.DDF.&SMFID&SSID..REPORTS(CPUHOUR)                   
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                              
//         DD DSN=&&RUNSYMS,DISP=SHR                                            
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
_MIN,*,2,PD                                                                     
*                                                                               
_COMMABORTS,*,4,BI                                                              
_COMMABORTS0,*,4,BI                                                             
_COMMABORTS1,*,4,BI                                                             
_COMMABORTS2,*,4,BI                                                             
_COMMABORTS3,*,4,BI                                                             
_COMMABORTS4,*,4,BI                                                             
_COMMABORTS5,*,4,BI                                                             
_COMMABORTS6,*,4,BI                                                             
_COMMABORTS7,*,4,BI                                                             
_COMMABORTS8,*,4,BI                                                             
_COMMABORTS9,*,4,BI                                                             
_COMMABORTS10,*,4,BI                                                            
_COMMABORTS11,*,4,BI                                                            
_COMMABORTS12,*,4,BI                                                            
_COMMABORTS13,*,4,BI                                                            
_COMMABORTS14,*,4,BI                                                            
_COMMABORTS15,*,4,BI                                                            
_COMMABORTS16,*,4,BI                                                            
_COMMABORTS17,*,4,BI                                                            
_COMMABORTS18,*,4,BI                                                            
_COMMABORTS19,*,4,BI                                                            
*                                                                               
_C1TCB,*,8,BI                                                                   
*                                                                               
_C1TCB_COMM,*,8,BI                                                              
*                                                                               
_C1TCB_BUCKET0,*,10,CH                                                          
_C1TCB_BUCKET1,*,10,CH                                                          
_C1TCB_BUCKET2,*,10,CH                                                          
_C1TCB_BUCKET3,*,10,CH                                                          
_C1TCB_BUCKET4,*,10,CH                                                          
_C1TCB_BUCKET5,*,10,CH                                                          
_C1TCB_BUCKET6,*,10,CH                                                          
_C1TCB_BUCKET7,*,10,CH                                                          
_C1TCB_BUCKET8,*,10,CH                                                          
_C1TCB_BUCKET9,*,10,CH                                                          
_C1TCB_BUCKET10,*,10,CH                                                         
_C1TCB_BUCKET11,*,10,CH                                                         
_C1TCB_BUCKET12,*,10,CH                                                         
_C1TCB_BUCKET13,*,10,CH                                                         
_C1TCB_BUCKET14,*,10,CH                                                         
_C1TCB_BUCKET15,*,10,CH                                                         
_C1TCB_BUCKET16,*,10,CH                                                         
_C1TCB_BUCKET17,*,10,CH                                                         
_C1TCB_BUCKET18,*,10,CH                                                         
_C1TCB_BUCKET19,*,10,CH                                                         
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 OPTION STOPAFT=9999999999                                                      
 INCLUDE COND=(SMFID,EQ,THIS_SMFID,AND,                                         
  SSID,EQ,THIS_SSID,AND,                                                        
  CORRID,EQ,THIS_CORRID)                                                            
*                                                                               
 INREC IFTHEN=(WHEN=INIT,                                                       
   BUILD=(RDW,                                                                  
     TSDATE,                                                                    
     TSHOUR,                                                                    
     TSMIN,                                                                     
*                                                                               
* Prime Commits counters for each bucket                                        
     COMMABORT,                                                                 
*                                                                               
     20X'00000000',                                                             
*                                                                               
     C1TIME,                                                                    
*                                                                               
     C1TCB,DIV,COMMABORT,TO=BI,LENGTH=8,                                        
*                                                                               
* Formatted bucket upper limits                                                 
     C'     <25us',                                                             
     C'     <50us',                                                             
     C'    <100us',                                                             
     C'    <200us',                                                             
     C'    <300us',                                                             
     C'    <400us',                                                             
     C'    <500us',                                                             
     C'      <1ms',                                                             
     C'      <2ms',                                                             
     C'      <5ms',                                                             
     C'     <10ms',                                                             
     C'     <25ms',                                                             
     C'     <50ms',                                                             
     C'    <100ms',                                                             
     C'    <250ms',                                                             
     C'    <500ms',                                                             
     C'       <1s',                                                             
     C'       <2s',                                                             
     C'       <4s',                                                             
     C'       >4s',                                                             
     X)),                                                                       
* Toss commits into individual buckets.                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET0),                                   
   OVERLAY=(_COMMABORTS0:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET1),                                   
   OVERLAY=(_COMMABORTS1:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET2),                                   
   OVERLAY=(_COMMABORTS2:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET3),                                   
   OVERLAY=(_COMMABORTS3:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET4),                                   
   OVERLAY=(_COMMABORTS4:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET5),                                   
   OVERLAY=(_COMMABORTS5:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET6),                                   
   OVERLAY=(_COMMABORTS6:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET7),                                   
   OVERLAY=(_COMMABORTS7:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET8),                                   
   OVERLAY=(_COMMABORTS8:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET9),                                   
   OVERLAY=(_COMMABORTS9:_COMMABORTS)),                                         
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET10),                                  
   OVERLAY=(_COMMABORTS10:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET11),                                  
   OVERLAY=(_COMMABORTS11:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET12),                                  
   OVERLAY=(_COMMABORTS12:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET13),                                  
   OVERLAY=(_COMMABORTS13:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET14),                                  
   OVERLAY=(_COMMABORTS14:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET15),                                  
   OVERLAY=(_COMMABORTS15:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET16),                                  
   OVERLAY=(_COMMABORTS16:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET17),                                  
   OVERLAY=(_COMMABORTS17:_COMMABORTS)),                                        
 IFTHEN=(WHEN=(_C1TCB_COMM,LT,C1TCB_BUCKET18),                                  
   OVERLAY=(_COMMABORTS18:_COMMABORTS)),                                        
 IFTHEN=(WHEN=NONE,                                                             
   OVERLAY=(_COMMABORTS19:_COMMABORTS))                                         
*                                                                               
 SORT FIELDS=(_DATE,A,_HOUR,A)                                                  
*                                                                               
 SUM FIELDS=(_COMMABORTS,                                                       
*                                                                               
   _COMMABORTS0,                                                                
   _COMMABORTS1,                                                                
   _COMMABORTS2,                                                                
   _COMMABORTS3,                                                                
   _COMMABORTS4,                                                                
   _COMMABORTS5,                                                                
   _COMMABORTS6,                                                                
   _COMMABORTS7,                                                                
   _COMMABORTS8,                                                                
   _COMMABORTS9,                                                                
   _COMMABORTS10,                                                               
   _COMMABORTS11,                                                               
   _COMMABORTS12,                                                               
   _COMMABORTS13,                                                               
   _COMMABORTS14,                                                               
   _COMMABORTS15,                                                               
   _COMMABORTS16,                                                               
   _COMMABORTS17,                                                               
   _COMMABORTS18,                                                               
   _COMMABORTS19)                                                               
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"CPU Time Distribution By Hour - ',THIS_SMFID,C'/',                 
   THIS_SSID,C'","',THIS_CORRID,'",',                                               
* 2nd line of titles                                                            
   /,                                                                           
* Time key field                                                                
   C'"Time",',                                                                  
* C1TCB_BUCKET descriptions                                                     
   C'"',_C1TCB_BUCKET0,'",',                                                    
   C'"',_C1TCB_BUCKET1,'",',                                                    
   C'"',_C1TCB_BUCKET2,'",',                                                    
   C'"',_C1TCB_BUCKET3,'",',                                                    
   C'"',_C1TCB_BUCKET4,'",',                                                    
   C'"',_C1TCB_BUCKET5,'",',                                                    
   C'"',_C1TCB_BUCKET6,'",',                                                    
   C'"',_C1TCB_BUCKET7,'",',                                                    
   C'"',_C1TCB_BUCKET8,'",',                                                    
   C'"',_C1TCB_BUCKET9,'",',                                                    
   C'"',_C1TCB_BUCKET10,'",',                                                   
   C'"',_C1TCB_BUCKET11,'",',                                                   
   C'"',_C1TCB_BUCKET12,'",',                                                   
   C'"',_C1TCB_BUCKET13,'",',                                                   
   C'"',_C1TCB_BUCKET14,'",',                                                   
   C'"',_C1TCB_BUCKET15,'",',                                                   
   C'"',_C1TCB_BUCKET16,'",',                                                   
   C'"',_C1TCB_BUCKET17,'",',                                                   
   C'"',_C1TCB_BUCKET18,'",',                                                   
   C'"',_C1TCB_BUCKET19,'",',                                                   
   C'"Total",',                                                                 
   X),                                                                          
*                                                                               
 OUTREC=(RDW,                                                                   
*                                                                               
   _DATE,DT1,EDIT=(TTTT.TT.TT),X,                                               
   _HOUR,EDIT=(TT),C',',                                                        
*                                                                               
   _COMMABORTS0,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS1,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS2,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS3,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS4,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS5,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS6,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS7,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS8,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS9,EDIT=(IIIIIIIT),C',',                                           
   _COMMABORTS10,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS11,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS12,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS13,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS14,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS15,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS16,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS17,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS18,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS19,EDIT=(IIIIIIIT),C',',                                          
   _COMMABORTS,EDIT=(IIIIIIIT),C',',                                            
*                                                                               
   20X)                                                                         
*                                                                               
/*                                                                              
//*                                                                             
//C1C2MIN  EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=K,HOLD=YES                                                 
//SYSUDUMP DD SYSOUT=K,HOLD=YES                                                 
//SYSPRINT DD SYSOUT=K,HOLD=YES                                                 
//SYMNOUT  DD SYSOUT=K,HOLD=YES                                                 
//*                                                                             
//***** ZF2DDFC2 *************************************************              
//*  (C) COPYRIGHT IBM CORP. 2017                                               
//*  ALL RIGHTS RESERVED                                                        
//*  LICENSED MATERIALS - PROPERTY OF IBM                                       
//*  REFER TO COPYRIGHT INSTRUCTIONS, FORM NUMBER G120-2083                     
//*******************************************************************           
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                  
//REPORT   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.&SMFID&SSID..REPORTS(C1C2MIN)                 
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                              
//         DD DSN=&&RUNSYMS,DISP=SHR                                            
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
_MIN,*,2,PD                                                                     
*                                                                               
_C1TCB,*,8,BI                                                                   
_C2TCB,*,8,BI                                                                   
_C1ZIIP,*,8,BI                                                                  
_C2ZIIP,*,8,BI                                                                  
_C1TIME,*,8,BI                                                                  
_C2TIME,*,8,BI                                                                  
_C2NNTCB,*,8,BI                                                                 
_C2SPTCB,*,8,BI                                                                 
_C2UDFTCB,*,8,BI                                                                
_C2SPSCHTIME,*,8,BI                                                             
_C2UDFSCHTIME,*,8,BI                                                            
*                                                                               
_COMMABO,*,4,BI                                                                 
*                                                                               
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INCLUDE COND=(SMFID,EQ,THIS_SMFID,AND,SSID,EQ,THIS_SSID,AND,                   
   CORRID,EQ,THIS_CORRID)                                                           
 INREC BUILD=(RDW,                                                              
     TSDATE,                                                                    
     TSHOUR,                                                                    
     TSMIN,                                                                     
     C1TCB,                                                                     
     C2TCB,                                                                     
     C1ZIIP,                                                                    
     C2ZIIP,                                                                    
     C1TIME,                                                                    
     C2TIME,                                                                    
     C2NNTCB,                                                                   
     C2SPTCB,                                                                   
     C2UDFTCB,                                                                  
     C2SPSCHTIME,                                                               
     C2UDFSCHTIME,                                                              
     COMMABORT,                                                                 
     X)                                                                         
*                                                                               
 SORT FIELDS=(_DATE,A,                                                          
  _HOUR,A,                                                                      
  _MIN,A)                                                                       
*                                                                               
* Commits for each named correlation id                                         
 SUM FIELDS=(_C1TCB,                                                            
   _C2TCB,                                                                      
   _C1ZIIP,                                                                     
   _C2ZIIP,                                                                     
   _C1TIME,                                                                     
   _C2TIME,                                                                     
   _C2NNTCB,                                                                    
   _C2SPTCB,                                                                    
   _C2UDFTCB,                                                                   
   _C2SPSCHTIME,                                                                
   _C2UDFSCHTIME,                                                               
   _COMMABO)                                                                    
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"Class 1 / 2 Times - ',THIS_SMFID,C'/',                             
   THIS_SSID,C'"',                                                              
   /,                                                                           
   C'"Time",',                                                                  
   C'"C1 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C1 / C2 TCB",',                                                           
   C'"C1 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C1 / C2 zIIP",',                                                          
   C'"C1 Time",',                                                               
   C'"C2 Time",',                                                               
   C'"C1 / C2 Time",',                                                          
   C'"C2 NN TCB",',                                                             
   C'"C2 SP TCB",',                                                             
   C'"C2 UDF TCB",',                                                            
   C'"SP SCH Time",',                                                           
   C'"UDF SCH Time",',                                                          
   C'"Commits",',                                                               
   X),                                                                          
*                                                                               
 OUTREC=(_RDW,                                                                  
* Time key field                                                                
   C'"',                                                                        
   _DATE,DT1,EDIT=(TTTT.TT.TT),X,                                               
   _HOUR,EDIT=(TT),C':',_MIN,EDIT=(TT),                                         
   C'",',                                                                       
   _C1TCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                               
   _C2TCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                               
   _C1TCB,MUL,+1000,DIV,_C2TCB,EDIT=(IIIIIIIT.TTT),C',',                        
   _C1ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C2ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C1ZIIP,MUL,+1000,DIV,_C2ZIIP,EDIT=(IIIIIIIT.TTT),C',',                      
   _C1TIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C2TIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C1TIME,MUL,+1000,DIV,_C2TIME,EDIT=(IIIIIIIT.TTT),C',',                      
   _C2NNTCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                             
   _C2SPTCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                             
   _C2UDFTCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                            
   _C2SPSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                         
   _C2UDFSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                        
   _COMMABO,EDIT=(IIIIIIIIT),C',',                                              
*                                                                               
   50X)                                                                         
 END                                                                            
/*                                                                              
//*                                                                             
//C1C2HOUR EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=K,HOLD=YES                                                 
//SYSUDUMP DD SYSOUT=K,HOLD=YES                                                 
//SYSPRINT DD SYSOUT=K,HOLD=YES                                                 
//SYMNOUT  DD SYSOUT=K,HOLD=YES                                                 
//*                                                                             
//***** ZF2DDFC2 *************************************************              
//*  (C) COPYRIGHT IBM CORP. 2017                                               
//*  ALL RIGHTS RESERVED                                                        
//*  LICENSED MATERIALS - PROPERTY OF IBM                                       
//*  REFER TO COPYRIGHT INSTRUCTIONS, FORM NUMBER G120-2083                     
//*******************************************************************           
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                 
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                  
//REPORT   DD DISP=SHR,                                                         
//       DSN=<HLQ>.<QUAL2>.DDF.&SMFID&SSID..REPORTS(C1C2HOUR)                  
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                              
//         DD DSN=&&RUNSYMS,DISP=SHR                                            
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
*                                                                               
_C1TCB,*,8,BI                                                                   
_C2TCB,*,8,BI                                                                   
_C1ZIIP,*,8,BI                                                                  
_C2ZIIP,*,8,BI                                                                  
_C1TIME,*,8,BI                                                                  
_C2TIME,*,8,BI                                                                  
_C2NNTCB,*,8,BI                                                                 
_C2SPTCB,*,8,BI                                                                 
_C2UDFTCB,*,8,BI                                                                
_C2SPSCHTIME,*,8,BI                                                             
_C2UDFSCHTIME,*,8,BI                                                            
*                                                                               
_COMMABO,*,4,BI                                                                 
*                                                                               
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INCLUDE COND=(SMFID,EQ,THIS_SMFID,AND,SSID,EQ,THIS_SSID,AND,                   
   CORRID,EQ,THIS_CORRID)                                                           
 INREC BUILD=(RDW,                                                              
     TSDATE,                                                                    
     TSHOUR,                                                                    
     C1TCB,                                                                     
     C2TCB,                                                                     
     C1ZIIP,                                                                    
     C2ZIIP,                                                                    
     C1TIME,                                                                    
     C2TIME,                                                                    
     C2NNTCB,                                                                   
     C2SPTCB,                                                                   
     C2UDFTCB,                                                                  
     C2SPSCHTIME,                                                               
     C2UDFSCHTIME,                                                              
     COMMABORT,                                                                 
     X)                                                                         
*                                                                               
 SORT FIELDS=(_DATE,A,                                                          
  _HOUR,A)                                                                      
*                                                                               
* Commits for each named correlation id                                         
 SUM FIELDS=(_C1TCB,                                                            
   _C2TCB,                                                                      
   _C1ZIIP,                                                                     
   _C2ZIIP,                                                                     
   _C1TIME,                                                                     
   _C2TIME,                                                                     
   _C2NNTCB,                                                                    
   _C2SPTCB,                                                                    
   _C2UDFTCB,                                                                   
   _C2SPSCHTIME,                                                                
   _C2UDFSCHTIME,                                                               
   _COMMABO)                                                                    
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"Class 1 / 2 Times - ',THIS_SMFID,C'/',                             
   THIS_SSID,C'"',                                                              
   /,                                                                           
   C'"Hour",',                                                                  
   C'"C1 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C1 / C2 TCB",',                                                           
   C'"C1 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C1 / C2 zIIP",',                                                          
   C'"C1 Time",',                                                               
   C'"C2 Time",',                                                               
   C'"C1 / C2 Time",',                                                          
   C'"C2 NN TCB",',                                                             
   C'"C2 SP TCB",',                                                             
   C'"C2 UDF TCB",',                                                            
   C'"SP SCH Time",',                                                           
   C'"UDF SCH Time",',                                                          
   C'"Commits",',                                                               
   X),                                                                          
*                                                                               
 OUTREC=(_RDW,                                                                  
* Time key field                                                                
   C'"',                                                                        
   _DATE,DT1,EDIT=(TTTT.TT.TT),X,                                               
   _HOUR,EDIT=(TT),                                                             
   C'",',                                                                       
   _C1TCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                               
   _C2TCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                               
   _C1TCB,MUL,+1000,DIV,_C2TCB,EDIT=(IIIIIIIT.TTT),C',',                        
   _C1ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C2ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C1ZIIP,MUL,+1000,DIV,_C2ZIIP,EDIT=(IIIIIIIT.TTT),C',',                      
   _C1TIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C2TIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C1TIME,MUL,+1000,DIV,_C2TIME,EDIT=(IIIIIIIT.TTT),C',',                      
   _C2NNTCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                             
   _C2SPTCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                             
   _C2UDFTCB,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                            
   _C2SPSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                         
   _C2UDFSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                        
   _COMMABO,EDIT=(IIIIIIIIT),C',',                                              
*                                                                               
   50X)                                                                         
 END                                                                            
/*                                                                              