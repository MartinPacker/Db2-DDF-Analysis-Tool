//JCL1     JCLLIB  ORDER=<HLQ>.<QUAL2>.JCL                                      
//*                                                                             
//WLMQUERY EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=<SYSOUT>                                                   
//SYSUDUMP DD SYSOUT=<SYSOUT>                                                   
//SYSPRINT DD SYSOUT=<SYSOUT>                                                   
//SYMNOUT  DD SYSOUT=<SYSOUT>                                                   
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                  
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                  
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                   
//REPORT   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.REPORTS(BYSCLASS)                              
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                               
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_SMFID,*,4,CH                                                                   
_SSID,*,4,CH                                                                    
_SCLASS,*,8,CH                                                                  
*                                                                               
_RECORDS,*,4,BI                                                                 
_COMMITS,*,4,BI                                                                 
_ABORTS,*,4,BI                                                                  
_C1TCB,*,8,BI                                                                   
_C1ZIIP,*,8,BI                                                                  
_C2TCB,*,8,BI                                                                   
_C2ZIIP,*,8,BI                                                                  
*                                                                               
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INREC BUILD=(RDW,                                                              
     SMFID,                                                                     
     SSID,                                                                      
     QWACWLME,                                                                  
     ONE,                                                                       
     QWACCOMM,                                                                  
     QWACABRT,                                                                  
     C1TCB,                                                                     
     C1ZIIP,                                                                    
     C2TCB,                                                                     
     C2ZIIP,                                                                    
     X)                                                                         
*                                                                               
 SORT FIELDS=(_SMFID,A,_SSID,A,_SCLASS,A)                                       
 SUM FIELDS=(_RECORDS,_COMMITS,_ABORTS,_C1TCB,_C1ZIIP,_C2TCB,_C2ZIIP)           
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'SMFID SSID SrvClass Records',X,                                     
  'Commits  Aborts     C1-TCB    C1-ZIIP     C2-TCB    C2-ZIIP'),               
*                                                                               
 OUTREC=(_RDW,X,                                                                
* Time key field                                                                
   _SMFID,X,                                                                    
   _SSID,X,                                                                     
   _SCLASS,X,                                                                   
   _RECORDS,EDIT=(IIIIIIT),X,                                                   
   _COMMITS,EDIT=(IIIIIIT),X,                                                   
   _ABORTS,EDIT=(IIIIIIT),X,                                                    
   _C1TCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),X,                                    
   _C1ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),X,                                   
   _C2TCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),X,                                    
   _C2ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),X,                                   
   50X)                                                                         
 END                                                                            
/*                                                                              
//*                                                                             
