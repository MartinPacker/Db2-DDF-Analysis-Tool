//JCL1     JCLLIB  ORDER=<HLQ>.<QUAL2>.JCL                                      
//BYMINUTE EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=<SYSOUT>                                                   
//SYSUDUMP DD SYSOUT=<SYSOUT>                                                   
//SYSPRINT DD SYSOUT=<SYSOUT>                                                   
//SYMNOUT  DD SYSOUT=<SYSOUT>                                                   
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLIOTHER                                  
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                  
//REPORT   DD SYSOUT=<SYSOUT>                                                   
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                               
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
_MIN,*,2,PD                                                                     
_ONE,*,4,BI                                                                     
_COMMITS,*,4,BI                                                                 
_ABORTS,*,4,BI                                                                  
_C1TIME,*,8,BI                                                                  
_C2TIME,*,8,BI                                                                  
_C1TCB,*,8,BI                                                                   
_C2TCB,*,8,BI                                                                   
_SQLS,*,8,BI                                                                    
_SQLR,*,8,BI                                                                    
*                                                                               
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INCLUDE COND=(SMFID,EQ,C'<SMFID>',AND,SSID,EQ,C'<SSID>')                       
*                                                                               
 INREC FIELDS=(RDW,                                                             
   TSDATE,                                                                      
   TSHOUR,                                                                      
   TSMIN,                                                                       
   ONE,                                                                         
   QWACCOMM,                                                                    
   QWACABRT,                                                                    
   C1TIME,                                                                      
   C2TIME,                                                                      
   C1TCB,                                                                       
   C2TCB,                                                                       
   QLACSQLS,                                                                    
   QLACSQLR)                                                                    
*                                                                               
 SORT FIELDS=(_DATE,A,                                                          
   _HOUR,A,                                                                     
   _MIN,A)                                                                      
*                                                                               
 SUM FIELDS=(_ONE,                                                              
  _COMMITS,                                                                     
  _ABORTS,                                                                      
  _C1TIME,                                                                      
  _C2TIME,                                                                      
  _C1TCB,                                                                       
  _C2TCB,                                                                       
  _SQLS,                                                                        
  _SQLR)                                                                        
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=('1-Minute Level Data For <SMFID>/<SSID>',/,/,                         
 'Date & Time,',                                                                
   'Records,',                                                                  
   'Commits,',                                                                  
   'Aborts,',                                                                   
   'C1 Time,',                                                                  
   'C2 Time,',                                                                  
   'C1 TCB,',                                                                   
   'C2 TCB,',                                                                   
   'SQL Sent,',                                                                 
   'SQL Received'),                                                             
 OUTREC=(RDW,                                                                   
   _DATE,DT1,EDIT=(TTTT/TT/TT),X,                                               
   _HOUR,EDIT=(TT),                                                             
   C':',                                                                        
   _MIN,EDIT=(TT),C',',                                                         
   _ONE,EDIT=(IIIIIIIIT),C',',                                                  
   _COMMITS,EDIT=(IIIIIIIIT),C',',                                              
   _ABORTS,EDIT=(IIIIIIIIT),C',',                                               
   _C1TIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C2TIME,DIV,ONE_MILLI,EDIT=(IIIIIIIT.TTT),C',',                              
   _C1TCB,DIV,ONE_MILLI,EDIT=(IIIIIIT.TTT),C',',                                
   _C2TCB,DIV,ONE_MILLI,EDIT=(IIIIIIT.TTT),C',',                                
   _SQLS,EDIT=(IIIIIIIIIT),C',',                                                
   _SQLR,EDIT=(IIIIIIIIIT))                                                     
 END                                                                            
/*                                                                              
