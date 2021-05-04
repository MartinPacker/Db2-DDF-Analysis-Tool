//JCL1     JCLLIB  ORDER=<HLQ>.<QUAL2>.JCL                                      
//SUMSSIDS EXEC PGM=SORT,REGION=0M                                              
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
//         DSN=<HLQ>.<QUAL2>.DDF.REPORTS(SUMSSIDS)                              
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.CTL(DDFIDSYM)                                      
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_SMFID,*,4,CH                                                                   
_SSID,*,4,CH                                                                    
_DATE,*,4,PD                                                                    
_RECORDS,*,4,BI                                                                 
_COMMITS,*,4,BI                                                                 
_ABORTS,*,4,BI                                                                  
_C1TCB,*,8,BI                                                                   
_C1ZIIP,*,8,BI                                                                  
_C2TCB,*,8,BI                                                                   
_C2ZIIP,*,8,BI                                                                  
_C2NNTCB,*,8,BI                                                                 
_C2SPTCB,*,8,BI                                                                 
_C2UDFTCB,*,8,BI                                                                
_C1TIME,*,8,BI                                                                  
_C2TIME,*,8,BI                                                                  
_C2NNTIME,*,8,BI                                                                
_C2SPTIME,*,8,BI                                                                
_C2UDFTIME,*,8,BI                                                               
_C2SPSCHTIME,*,8,BI                                                             
_C2UDFSCHTIME,*,8,BI                                                            
_NOZIIP,*,4,BI                                                                  
_ZIIP_EL,*,8,BI                                                                 
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INREC IFTHEN=(WHEN=INIT,                                                       
   BUILD=(RDW,                                                                  
     SMFID,                                                                     
     SSID,                                                                      
     TSDATE,                                                                    
     ONE,                                                                       
     QWACCOMM,                                                                  
     QWACABRT,                                                                  
     C1TCB,                                                                     
     C1ZIIP,                                                                    
     C2TCB,                                                                     
     C2ZIIP,                                                                    
     C2NNTCB,                                                                   
     C2SPTCB,                                                                   
     C2UDFTCB,                                                                  
     C1TIME,                                                                    
     C2TIME,                                                                    
     C2NNTIME,                                                                  
     C2SPTIME,                                                                  
     C2UDFTIME,                                                                 
     C2SPSCHTIME,                                                               
     C2UDFSCHTIME,                                                              
     ZERO,                                                                      
     ZIIP_ELIGIBLE)),                                                           
 IFTHEN=(WHEN=(_C1ZIIP,EQ,ZERO),                                                
   OVERLAY=(_NOZIIP:ONE))                                                       
*                                                                               
 SORT FIELDS=(_SMFID,A,                                                         
  _SSID,A,                                                                      
  _DATE,A)                                                                      
*                                                                               
 SUM FIELDS=(_RECORDS,                                                          
   _COMMITS,                                                                    
   _ABORTS,                                                                     
   _C1TCB,                                                                      
   _C1ZIIP,                                                                     
   _C2TCB,                                                                      
   _C2ZIIP,                                                                     
   _C2NNTCB,                                                                    
   _C2SPTCB,                                                                    
   _C2UDFTCB,                                                                   
   _C1TIME,                                                                     
   _C2TIME,                                                                     
   _C2NNTIME,                                                                   
   _C2SPTIME,                                                                   
   _C2UDFTIME,                                                                  
   _C2SPSCHTIME,                                                                
   _C2UDFSCHTIME,                                                               
   _NOZIIP,                                                                     
   _ZIIP_EL)                                                                    
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"By Subsystem By Day",',                                            
   /,                                                                           
   C'"SMFID",',                                                                 
   C'"SSID",',                                                                  
   C'"Date",',                                                                  
   C'"Records",',                                                               
   C'"Commits",',                                                               
   C'"Aborts",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 zIIP",',                                                               
   C'"C2 TCB",',                                                                
   C'"C2 zIIP",',                                                               
   C'"No zIIP",',                                                               
   C'"zIIP on GCP",',                                                           
   C'"C2 NN TCB",',                                                             
   C'"C2 SP TCB",',                                                             
   C'"C2 UDF TCB",',                                                            
   C'"C1 Time",',                                                               
   C'"C2 Time",',                                                               
   C'"C2 NN Time",',                                                            
   C'"C2 SP Time",',                                                            
   C'"C2 UDF Time",',                                                           
   C'"C2 SP Sch",',                                                             
   C'"C2 UDF Sch",',                                                            
   X),                                                                          
 OUTREC=(_RDW,                                                                  
   C'"',                                                                        
   _SMFID,                                                                      
   C'",',                                                                       
   C'"',                                                                        
   _SSID,                                                                       
   C'",',                                                                       
   C'"',                                                                        
   _DATE,DT1,EDIT=(TTTT/TT/TT),X,                                               
   C'",',                                                                       
   _RECORDS,EDIT=(IIIIIIIIT),C',',                                              
   _COMMITS,EDIT=(IIIIIIIIT),C',',                                              
   _ABORTS,EDIT=(IIIIIIIIT),C',',                                               
   _C1TCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                 
   _C1ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                 
   _C2ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _NOZIIP,EDIT=(IIIIIIIIT),C',',                                               
   _ZIIP_EL,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2NNTCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2SPTCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2UDFTCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _C1TIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2NNTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _C2SPTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _C2UDFTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                             
   _C2SPSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                           
   _C2UDFSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                          
   50X)                                                                         
//*                                                                             
//SUMCORRS EXEC PGM=SORT,REGION=0M                                              
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
//         DSN=<HLQ>.<QUAL2>.DDF.REPORTS(SUMCORRS)                              
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.CTL(DDFIDSYM)                                      
//         DD *                                                                 
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_SMFID,*,4,CH                                                                   
_SSID,*,4,CH                                                                    
_CORRID,*,12,CH                                                                 
_DATE,*,4,PD                                                                    
_RECORDS,*,4,BI                                                                 
_COMMITS,*,4,BI                                                                 
_ABORTS,*,4,BI                                                                  
_C1TCB,*,8,BI                                                                   
_C1ZIIP,*,8,BI                                                                  
_C2TCB,*,8,BI                                                                   
_C2ZIIP,*,8,BI                                                                  
_C2NNTCB,*,8,BI                                                                 
_C2SPTCB,*,8,BI                                                                 
_C2UDFTCB,*,8,BI                                                                
_C1TIME,*,8,BI                                                                  
_C2TIME,*,8,BI                                                                  
_C2NNTIME,*,8,BI                                                                
_C2SPTIME,*,8,BI                                                                
_C2UDFTIME,*,8,BI                                                               
_C2SPSCHTIME,*,8,BI                                                             
_C2UDFSCHTIME,*,8,BI                                                            
_NOZIIP,*,4,BI                                                                  
_ZIIP_EL,*,8,BI                                                                 
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INREC IFTHEN=(WHEN=INIT,                                                       
   BUILD=(RDW,                                                                  
     SMFID,                                                                     
     SSID,                                                                      
     CORRID,                                                                    
     TSDATE,                                                                    
     ONE,                                                                       
     QWACCOMM,                                                                  
     QWACABRT,                                                                  
     C1TCB,                                                                     
     C1ZIIP,                                                                    
     C2TCB,                                                                     
     C2ZIIP,                                                                    
     C2NNTCB,                                                                   
     C2SPTCB,                                                                   
     C2UDFTCB,                                                                  
     C1TIME,                                                                    
     C2TIME,                                                                    
     C2NNTIME,                                                                  
     C2SPTIME,                                                                  
     C2UDFTIME,                                                                 
     C2SPSCHTIME,                                                               
     C2UDFSCHTIME,                                                              
     ZERO,                                                                      
     ZIIP_ELIGIBLE)),                                                           
 IFTHEN=(WHEN=(_C1ZIIP,EQ,ZERO),                                                
   OVERLAY=(_NOZIIP:ONE))                                                       
*                                                                               
 SORT FIELDS=(_SMFID,A,                                                         
  _SSID,A,                                                                      
  _CORRID,A,                                                                    
  _DATE,A)                                                                      
*                                                                               
 SUM FIELDS=(_RECORDS,                                                          
   _COMMITS,                                                                    
   _ABORTS,                                                                     
   _C1TCB,                                                                      
   _C1ZIIP,                                                                     
   _C2TCB,                                                                      
   _C2ZIIP,                                                                     
   _C2NNTCB,                                                                    
   _C2SPTCB,                                                                    
   _C2UDFTCB,                                                                   
   _C1TIME,                                                                     
   _C2TIME,                                                                     
   _C2NNTIME,                                                                   
   _C2SPTIME,                                                                   
   _C2UDFTIME,                                                                  
   _C2SPSCHTIME,                                                                
   _C2UDFSCHTIME,                                                               
   _NOZIIP,                                                                     
   _ZIIP_EL)                                                                    
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"By Corrid By Day",',                                               
   /,                                                                           
   C'"SMFID",',                                                                 
   C'"SSID",',                                                                  
   C'"Corrid",',                                                                
   C'"Date",',                                                                  
   C'"Records",',                                                               
   C'"Commits",',                                                               
   C'"Aborts",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 zIIP",',                                                               
   C'"C2 TCB",',                                                                
   C'"C2 zIIP",',                                                               
   C'"No zIIP",',                                                               
   C'"zIIP on GCP",',                                                           
   C'"C2 NN TCB",',                                                             
   C'"C2 SP TCB",',                                                             
   C'"C2 UDF TCB",',                                                            
   C'"C1 Time",',                                                               
   C'"C2 Time",',                                                               
   C'"C2 NN Time",',                                                            
   C'"C2 SP Time",',                                                            
   C'"C2 UDF Time",',                                                           
   C'"C2 SP Sch",',                                                             
   C'"C2 UDF Sch",',                                                            
   X),                                                                          
 OUTREC=(_RDW,                                                                  
   C'"',                                                                        
   _SMFID,                                                                      
   C'",',                                                                       
   C'"',                                                                        
   _SSID,                                                                       
   C'",',                                                                       
   C'"',                                                                        
   _CORRID,                                                                     
   C'",',                                                                       
   C'"',                                                                        
   _DATE,DT1,EDIT=(TTTT/TT/TT),X,                                               
   C'",',                                                                       
   _RECORDS,EDIT=(IIIIIIIIT),C',',                                              
   _COMMITS,EDIT=(IIIIIIIIT),C',',                                              
   _ABORTS,EDIT=(IIIIIIIIT),C',',                                               
   _C1TCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                 
   _C1ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                 
   _C2ZIIP,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _NOZIIP,EDIT=(IIIIIIIIT),C',',                                               
   _ZIIP_EL,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2NNTCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2SPTCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2UDFTCB,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _C1TIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2NNTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _C2SPTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _C2UDFTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                             
   _C2SPSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                           
   _C2UDFSCHTIME,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                          
   50X)                                                                         
 END                                                                            
/*                                                                              
