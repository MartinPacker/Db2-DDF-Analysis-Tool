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
     CALLUDF)                                                                   
*                                                                               
 SORT FIELDS=(_SMFID,A,                                                         
  _SSID,A,                                                                      
  _DATE,A)                                                                      
*                                                                               
 SUM FIELDS=(_RECORDS,                                                          
   _COMMITS,                                                                    
   _ABORTS,                                                                     
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
   _CALLUDF)                                                                    
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
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
 INCLUDE COND=(QWACWLME,NE,X'0000000000000000')                                 
 INREC BUILD=(RDW,                                                              
     SMFID,                                                                     
     SSID,                                                                      
     CORRID,                                                                    
     TSDATE,                                                                    
     ONE,                                                                       
     QWACCOMM,                                                                  
     QWACABRT,                                                                  
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
     CALLUDF)                                                                   
*                                                                               
 SORT FIELDS=(_SMFID,A,                                                         
  _SSID,A,                                                                      
  _DATE,A,                                                                      
  _CORRID,A)                                                                    
*                                                                               
 SUM FIELDS=(_RECORDS,                                                          
   _COMMITS,                                                                    
   _ABORTS,                                                                     
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
   _CALLUDF)                                                                    
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
   50X)                                                                         
 END                                                                            
/*                                                                              
