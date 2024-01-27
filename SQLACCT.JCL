//JCL1     JCLLIB  ORDER=<HLQ>.<QUAL2>.JCL                                      
//*                                                                             
//SQLSSIDS EXEC PGM=SORT,REGION=0M                                              
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
//         DSN=<HLQ>.<QUAL2>.DDF.REPORTS(SQLSSIDS)                              
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                               
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
_COMMABORT,*,4,BI                                                               
_SELECT,*,8,BI                                                                  
_INSERT,*,8,BI                                                                  
_UPDATE,*,8,BI                                                                  
_DELETE,*,8,BI                                                                  
_DESCRIBE,*,8,BI                                                                
_PREPARE,*,8,BI                                                                 
_OPEN,*,8,BI                                                                    
_CLOSE,*,8,BI                                                                   
_FETCH,*,8,BI                                                                   
_CALLSP,*,8,BI                                                                  
_CALLUDF,*,8,BI                                                                 
_QXSTFND,*,8,BI                                                                 
_QXSTNFND,*,8,BI                                                                
_QXSTNPRP,*,8,BI                                                                
_QXSTIPRP,*,8,BI                                                                
_QXSTDINV,*,8,BI                                                                
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INCLUDE COND=(QWACWLME,NE,X'0000000000000000')                                 
 INREC BUILD=(RDW,                                                              
     SMFID,                                                                     
     SSID,                                                                      
     TSDATE,                                                                    
     ONE,                                                                       
     QWACCOMM,                                                                  
     QWACABRT,                                                                  
     COMMABORT,                                                                 
     QXSELECT,                                                                  
     QXINSRT,                                                                   
     QXUPDTE,                                                                   
     QXDELET,                                                                   
     QXDESC,                                                                    
     QXPREP,                                                                    
     QXOPEN,                                                                    
     QXCLOSE,                                                                   
     QXFETCH,                                                                   
     CALLSP,                                                                    
     CALLUDF,                                                                   
     QXSTFND,                                                                   
     QXSTNFND,                                                                  
     QXSTNPRP,                                                                  
     QXSTIPRP,                                                                  
     QXSTDINV)                                                                  
*                                                                               
 SORT FIELDS=(_SMFID,A,                                                         
  _SSID,A,                                                                      
  _DATE,A)                                                                      
*                                                                               
 SUM FIELDS=(_RECORDS,                                                          
   _COMMITS,                                                                    
   _ABORTS,                                                                     
   _COMMABORT,                                                                  
   _SELECT,                                                                     
   _INSERT,                                                                     
   _UPDATE,                                                                     
   _DELETE,                                                                     
   _DESCRIBE,                                                                   
   _PREPARE,                                                                    
   _OPEN,                                                                       
   _CLOSE,                                                                      
   _FETCH,                                                                      
   _CALLSP,                                                                     
   _CALLUDF,                                                                    
   _QXSTFND,                                                                    
   _QXSTNFND,                                                                   
   _QXSTNPRP,                                                                   
   _QXSTIPRP,                                                                   
   _QXSTDINV)                                                                   
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
   C'"SELECT",',                                                                
   C'"INSERT",',                                                                
   C'"UPDATE",',                                                                
   C'"DELETE",',                                                                
   C'"DESCRIBE",',                                                              
   C'"PREPARE",',                                                               
   C'"OPEN",',                                                                  
   C'"CLOSE",',                                                                 
   C'"FETCH",',                                                                 
   C'"Call SP",',                                                               
   C'"Call UDF",',                                                              
   C'"Global Hit",',                                                            
   C'"Global Miss",',                                                           
   C'"Local Hit",',                                                             
   C'"Local Miss",',                                                            
   C'"Local Invalidated",',                                                     
   C'"SELECTs Per",',                                                           
   C'"INSERTs Per",',                                                           
   C'"UPDATEs Per",',                                                           
   C'"DELETEs Per",',                                                           
   C'"DESCRIBEs Per",',                                                         
   C'"PREPAREs Per",',                                                          
   C'"OPENs Per",',                                                             
   C'"CLOSEs Per",',                                                            
   C'"FETCHes Per",',                                                           
   C'"Call SPs Per",',                                                          
   C'"Call UDFs Per",',                                                         
   C'"Global Hit Per",',                                                        
   C'"Global Miss Per",',                                                       
   C'"Local Hit Per",',                                                         
   C'"Local Miss Per",',                                                        
   C'"Local Invalidated Per",',                                                 
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
   _RECORDS,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _COMMITS,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _ABORTS,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _SELECT,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _INSERT,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _UPDATE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _DELETE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _DESCRIBE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _PREPARE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _OPEN,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                         
   _CLOSE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                        
   _FETCH,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                        
   _CALLSP,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _CALLUDF,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _QXSTFND,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _QXSTNFND,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _QXSTNPRP,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _QXSTIPRP,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _QXSTDINV,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _SELECT,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _INSERT,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _UPDATE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _DELETE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _DESCRIBE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _PREPARE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',             
   _OPEN,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',                
   _CLOSE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',               
   _FETCH,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',               
   _CALLSP,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _CALLUDF,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',             
   _QXSTFND,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',             
   _QXSTNFND,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _QXSTNPRP,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _QXSTIPRP,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _QXSTDINV,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   50X)                                                                         
 END                                                                            
//*                                                                             
//SQLCORRS EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=<SYSOUT>                                                   
//SYSUDUMP DD SYSOUT=<SYSOUT>                                                   
//SYSPRINT DD SYSOUT=<SYSOUT>                                                   
//SYMNOUT  DD SYSOUT=<SYSOUT>                                                   
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                  
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                  
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                   
//REPORT   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.REPORTS(SQLCORRS)                              
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                               
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
_COMMABORT,*,4,BI                                                               
_SELECT,*,8,BI                                                                  
_INSERT,*,8,BI                                                                  
_UPDATE,*,8,BI                                                                  
_DELETE,*,8,BI                                                                  
_DESCRIBE,*,8,BI                                                                
_PREPARE,*,8,BI                                                                 
_OPEN,*,8,BI                                                                    
_CLOSE,*,8,BI                                                                   
_FETCH,*,8,BI                                                                   
_CALLSP,*,8,BI                                                                  
_CALLUDF,*,8,BI                                                                 
_QXSTFND,*,8,BI                                                                 
_QXSTNFND,*,8,BI                                                                
_QXSTNPRP,*,8,BI                                                                
_QXSTIPRP,*,8,BI                                                                
_QXSTDINV,*,8,BI                                                                
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INCLUDE COND=(QWACWLME,NE,X'0000000000000000')                                 
*                                                                               
 INREC BUILD=(RDW,                                                              
     SMFID,                                                                     
     SSID,                                                                      
     CORRID,                                                                    
     TSDATE,                                                                    
     ONE,                                                                       
     QWACCOMM,                                                                  
     QWACABRT,                                                                  
     COMMABORT,                                                                 
     QXSELECT,                                                                  
     QXINSRT,                                                                   
     QXUPDTE,                                                                   
     QXDELET,                                                                   
     QXDESC,                                                                    
     QXPREP,                                                                    
     QXOPEN,                                                                    
     QXCLOSE,                                                                   
     QXFETCH,                                                                   
     CALLSP,                                                                    
     CALLUDF,                                                                   
     QXSTFND,                                                                   
     QXSTNFND,                                                                  
     QXSTNPRP,                                                                  
     QXSTIPRP,                                                                  
     QXSTDINV)                                                                  
*                                                                               
 SORT FIELDS=(_SMFID,A,                                                         
  _SSID,A,                                                                      
  _DATE,A,                                                                      
  _CORRID,A)                                                                    
*                                                                               
 SUM FIELDS=(_RECORDS,                                                          
   _COMMITS,                                                                    
   _ABORTS,                                                                     
   _COMMABORT,                                                                  
   _SELECT,                                                                     
   _INSERT,                                                                     
   _UPDATE,                                                                     
   _DELETE,                                                                     
   _DESCRIBE,                                                                   
   _PREPARE,                                                                    
   _OPEN,                                                                       
   _CLOSE,                                                                      
   _FETCH,                                                                      
   _CALLSP,                                                                     
   _CALLUDF,                                                                    
   _QXSTFND,                                                                    
   _QXSTNFND,                                                                   
   _QXSTNPRP,                                                                   
   _QXSTIPRP,                                                                   
   _QXSTDINV)                                                                   
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"By Subsystem By Day",',                                            
   /,                                                                           
   C'"SMFID",',                                                                 
   C'"SSID",',                                                                  
   C'"Correlation",',                                                           
   C'"Date",',                                                                  
   C'"Records",',                                                               
   C'"Commits",',                                                               
   C'"Aborts",',                                                                
   C'"SELECT",',                                                                
   C'"INSERT",',                                                                
   C'"UPDATE",',                                                                
   C'"DELETE",',                                                                
   C'"DESCRIBE",',                                                              
   C'"PREPARE",',                                                               
   C'"OPEN",',                                                                  
   C'"CLOSE",',                                                                 
   C'"FETCH",',                                                                 
   C'"Call SP",',                                                               
   C'"Call UDF",',                                                              
   C'"Global Hit",',                                                            
   C'"Global Miss",',                                                           
   C'"Local Hit",',                                                             
   C'"Local Miss",',                                                            
   C'"Local Invalidated",',                                                     
   C'"SELECTs Per",',                                                           
   C'"INSERTs Per",',                                                           
   C'"UPDATEs Per",',                                                           
   C'"DELETEs Per",',                                                           
   C'"DESCRIBEs Per",',                                                         
   C'"PREPAREs Per",',                                                          
   C'"OPENs Per",',                                                             
   C'"CLOSEs Per",',                                                            
   C'"FETCHes Per",',                                                           
   C'"Call SPs Per",',                                                          
   C'"Call UDFs Per",',                                                         
   C'"Global Hit Per",',                                                        
   C'"Global Miss Per",',                                                       
   C'"Local Hit Per",',                                                         
   C'"Local Miss Per",',                                                        
   C'"Local Invalidated Per",',                                                 
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
   _RECORDS,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _COMMITS,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _ABORTS,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _SELECT,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _INSERT,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _UPDATE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _DELETE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _DESCRIBE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _PREPARE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _OPEN,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                         
   _CLOSE,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                        
   _FETCH,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                        
   _CALLSP,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                       
   _CALLUDF,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _QXSTFND,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                      
   _QXSTNFND,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _QXSTNPRP,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _QXSTIPRP,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _QXSTDINV,EDIT=(IIIIIIIIIIIIIIIIT),C',',                                     
   _SELECT,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _INSERT,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _UPDATE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _DELETE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _DESCRIBE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _PREPARE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',             
   _OPEN,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',                
   _CLOSE,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',               
   _FETCH,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',               
   _CALLSP,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',              
   _CALLUDF,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',             
   _QXSTFND,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',             
   _QXSTNFND,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _QXSTNPRP,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _QXSTIPRP,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   _QXSTDINV,MUL,+1000,DIV,_COMMABORT,EDIT=(IIIIIIIIIIIIT.TTT),C',',            
   50X)                                                                         
 END                                                                            
/*                                                                              
