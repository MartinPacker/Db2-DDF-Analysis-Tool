//JCL1     JCLLIB  ORDER=<HLQ>.<QUAL2>.JCL                                      
//ALLMIN   EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=<SYSOUT>                                                   
//SYSUDUMP DD SYSOUT=<SYSOUT>                                                   
//SYSPRINT DD SYSOUT=<SYSOUT>                                                   
//SYMNOUT  DD SYSOUT=<SYSOUT>                                                   
//*                                                                             
//******************************************************************            
//* THIS JOB REPORTS ON ACTIVITY TO NAMES SMFID/SUBSYSTEM PAIRS,   *            
//* AND TELLS YOU HOW MUCH THERE IS TO SUBSYSTEMS YOU DIDN'T       *            
//* IDENTIFY IN EG SMFID1 & SSID1 SYMBOLS - WHICH YOU NEED TO EDIT *            
//* BEFORE SUBMITTING.                                             *            
//*                                                                *            
//* YOU MIGHT ALSO WANT TO EDIT AND UNCOMMENT THE INCLUDE STATE-   *            
//* MENT. (THIS ONE FILTERS ON A SPECIFIC WLM SERVICE CLASS NAME.) *            
//*******************************************************************           
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF                                  
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF                                  
//         DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF                                   
//REPORT   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.DDF.REPORTS(SSIDMIN)                               
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.CTL(DDFIDSYM)                                      
//         DD *                                                                 
* DFSORT symbols pre-made for pre-determined number of subsystems               
* Leave blank the SMFIDs and SSIDs you don't want.                              
SMFID1,C'SYSA'                                                                  
SSID1,C'DB2A'                                                                   
SMFID2,C'SYSB'                                                                  
SSID2,C'DB2B'                                                                   
SMFID3,C'    '                                                                  
SSID3,C'    '                                                                   
SMFID4,C'    '                                                                  
SSID4,C'    '                                                                   
SMFID5,C'    '                                                                  
SSID5,C'    '                                                                   
SMFID6,C'    '                                                                  
SSID6,C'    '                                                                   
SMFID7,C'    '                                                                  
SSID7,C'    '                                                                   
SMFID8,C'    '                                                                  
SSID8,C'    '                                                                   
*                                                                               
* RESULTS OF INREC                                                              
POSITION,1                                                                      
_RDW,*,4,BI                                                                     
_SMFID,*,4,CH                                                                   
_SSID,*,4,CH                                                                    
_DATE,*,4,PD                                                                    
_HOUR,*,2,PD                                                                    
_MIN,*,2,PD                                                                     
*                                                                               
_COMMITS,*,4,BI                                                                 
_COMM1,*,4,BI                                                                   
_COMM2,*,4,BI                                                                   
_COMM3,*,4,BI                                                                   
_COMM4,*,4,BI                                                                   
_COMM5,*,4,BI                                                                   
_COMM6,*,4,BI                                                                   
_COMM7,*,4,BI                                                                   
_COMM8,*,4,BI                                                                   
_COMMO,*,4,BI                                                                   
*                                                                               
_C1TCB,*,8,BI                                                                   
_C1TCB1,*,8,BI                                                                  
_C1TCB2,*,8,BI                                                                  
_C1TCB3,*,8,BI                                                                  
_C1TCB4,*,8,BI                                                                  
_C1TCB5,*,8,BI                                                                  
_C1TCB6,*,8,BI                                                                  
_C1TCB7,*,8,BI                                                                  
_C1TCB8,*,8,BI                                                                  
_C1TCBO,*,8,BI                                                                  
*                                                                               
_C2TCB,*,8,BI                                                                   
_C2TCB1,*,8,BI                                                                  
_C2TCB2,*,8,BI                                                                  
_C2TCB3,*,8,BI                                                                  
_C2TCB4,*,8,BI                                                                  
_C2TCB5,*,8,BI                                                                  
_C2TCB6,*,8,BI                                                                  
_C2TCB7,*,8,BI                                                                  
_C2TCB8,*,8,BI                                                                  
_C2TCBO,*,8,BI                                                                  
*                                                                               
_C1ZIIP,*,8,BI                                                                  
_C1ZIIP1,*,8,BI                                                                 
_C1ZIIP2,*,8,BI                                                                 
_C1ZIIP3,*,8,BI                                                                 
_C1ZIIP4,*,8,BI                                                                 
_C1ZIIP5,*,8,BI                                                                 
_C1ZIIP6,*,8,BI                                                                 
_C1ZIIP7,*,8,BI                                                                 
_C1ZIIP8,*,8,BI                                                                 
_C1ZIIPO,*,8,BI                                                                 
*                                                                               
_C2ZIIP,*,8,BI                                                                  
_C2ZIIP1,*,8,BI                                                                 
_C2ZIIP2,*,8,BI                                                                 
_C2ZIIP3,*,8,BI                                                                 
_C2ZIIP4,*,8,BI                                                                 
_C2ZIIP5,*,8,BI                                                                 
_C2ZIIP6,*,8,BI                                                                 
_C2ZIIP7,*,8,BI                                                                 
_C2ZIIP8,*,8,BI                                                                 
_C2ZIIPO,*,8,BI                                                                 
*                                                                               
_ZIIP_EL,*,8,BI                                                                 
_ZIIP_EL1,*,8,BI                                                                
_ZIIP_EL2,*,8,BI                                                                
_ZIIP_EL3,*,8,BI                                                                
_ZIIP_EL4,*,8,BI                                                                
_ZIIP_EL5,*,8,BI                                                                
_ZIIP_EL6,*,8,BI                                                                
_ZIIP_EL7,*,8,BI                                                                
_ZIIP_EL8,*,8,BI                                                                
*                                                                               
_ZIIP_ELO,*,8,BI                                                                
*                                                                               
_C1TIME,*,8,BI                                                                  
_C1TIME1,*,8,BI                                                                 
_C1TIME2,*,8,BI                                                                 
_C1TIME3,*,8,BI                                                                 
_C1TIME4,*,8,BI                                                                 
_C1TIME5,*,8,BI                                                                 
_C1TIME6,*,8,BI                                                                 
_C1TIME7,*,8,BI                                                                 
_C1TIME8,*,8,BI                                                                 
*                                                                               
_C1TIMEO,*,8,BI                                                                 
*                                                                               
_C2TIME,*,8,BI                                                                  
_C2TIME1,*,8,BI                                                                 
_C2TIME2,*,8,BI                                                                 
_C2TIME3,*,8,BI                                                                 
_C2TIME4,*,8,BI                                                                 
_C2TIME5,*,8,BI                                                                 
_C2TIME6,*,8,BI                                                                 
_C2TIME7,*,8,BI                                                                 
_C2TIME8,*,8,BI                                                                 
*                                                                               
_C2TIMEO,*,8,BI                                                                 
*                                                                               
/*                                                                              
//*                                                                             
//SYSIN    DD  *                                                                
* INCLUDE COND=(QWACWLME,EQ,C'DDFHOT')                                          
 INREC IFTHEN=(WHEN=INIT,                                                       
   BUILD=(RDW,                                                                  
     SMFID,                                                                     
     SSID,                                                                      
     TSDATE,                                                                    
     TSHOUR,                                                                    
     TSMIN,                                                                     
     QWACCOMM,                                                                  
*                                                                               
* Commits for each named subsystem                                              
     X'00000000',                                                               
     X'00000000',                                                               
     X'00000000',                                                               
     X'00000000',                                                               
     X'00000000',                                                               
     X'00000000',                                                               
     X'00000000',                                                               
     X'00000000',                                                               
* Commits for "other" subsys                                                    
     X'00000000',                                                               
*                                                                               
     C1TCB,                                                                     
* C1 TCB for each named subsystem                                               
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
* C1 TCB for "other" subsys                                                     
     X'0000000000000000',                                                       
*                                                                               
     C2TCB,                                                                     
* C2 TCB for each named subsystem                                               
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
* C2 TCB for "other" subsys                                                     
     X'0000000000000000',                                                       
*                                                                               
     C1ZIIP,                                                                    
* C1 ZIIP for each named subsystem                                              
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
* C1 ZIIP for "other" subsys                                                    
     X'0000000000000000',                                                       
*                                                                               
     C2ZIIP,                                                                    
* C2 ZIIP for each named subsystem                                              
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
* C2 ZIIP for "other" subsys                                                    
     X'0000000000000000',                                                       
*                                                                               
     ZIIP_ELIGIBLE,                                                             
* zIIP Eligible for each named subsystem                                        
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
* zIIP Eligible for "other" subsys                                              
     X'0000000000000000',                                                       
*                                                                               
     C1TIME,                                                                    
* C1 Time for each named subsystem                                              
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
* C1 Time for "other" subsys                                                    
     X'0000000000000000',                                                       
*                                                                               
     C2TIME,                                                                    
* C2 Time for each named subsystem                                              
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
     X'0000000000000000',                                                       
* C2 Time for "other" subsys                                                    
     X'0000000000000000',                                                       
*                                                                               
*                                                                               
     X)),                                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID1,AND,_SSID,EQ,SSID1),                            
    OVERLAY=(_COMM1:_COMMITS,                                                   
      _C1TCB1:_C1TCB,                                                           
      _C2TCB1:_C2TCB,                                                           
      _C1ZIIP1:_C1ZIIP,                                                         
      _C2ZIIP1:_C2ZIIP,                                                         
      _ZIIP_EL1:_ZIIP_EL,                                                       
      _C1TIME1:_C1TIME,                                                         
      _C2TIME1:_C2TIME)),                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID2,AND,_SSID,EQ,SSID2),                            
    OVERLAY=(_COMM2:_COMMITS,                                                   
      _C1TCB2:_C1TCB,                                                           
      _C2TCB2:_C2TCB,                                                           
      _C1ZIIP2:_C1ZIIP,                                                         
      _C2ZIIP2:_C2ZIIP,                                                         
      _ZIIP_EL2:_ZIIP_EL,                                                       
      _C1TIME2:_C1TIME,                                                         
      _C2TIME2:_C2TIME)),                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID3,AND,_SSID,EQ,SSID3),                            
    OVERLAY=(_COMM3:_COMMITS,                                                   
      _C1TCB3:_C1TCB,                                                           
      _C2TCB3:_C2TCB,                                                           
      _C1ZIIP3:_C1ZIIP,                                                         
      _C2ZIIP3:_C2ZIIP,                                                         
      _ZIIP_EL3:_ZIIP_EL,                                                       
      _C1TIME3:_C1TIME,                                                         
      _C2TIME3:_C2TIME)),                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID4,AND,_SSID,EQ,SSID4),                            
    OVERLAY=(_COMM4:_COMMITS,                                                   
      _C1TCB4:_C1TCB,                                                           
      _C2TCB4:_C2TCB,                                                           
      _C1ZIIP4:_C1ZIIP,                                                         
      _C2ZIIP4:_C2ZIIP,                                                         
      _ZIIP_EL4:_ZIIP_EL,                                                       
      _C1TIME4:_C1TIME,                                                         
      _C2TIME4:_C2TIME)),                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID5,AND,_SSID,EQ,SSID5),                            
    OVERLAY=(_COMM5:_COMMITS,                                                   
      _C1TCB5:_C1TCB,                                                           
      _C2TCB5:_C2TCB,                                                           
      _C1ZIIP5:_C1ZIIP,                                                         
      _C2ZIIP5:_C2ZIIP,                                                         
      _ZIIP_EL5:_ZIIP_EL,                                                       
      _C1TIME5:_C1TIME,                                                         
      _C2TIME5:_C2TIME)),                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID6,AND,_SSID,EQ,SSID6),                            
    OVERLAY=(_COMM6:_COMMITS,                                                   
      _C1TCB6:_C1TCB,                                                           
      _C2TCB6:_C2TCB,                                                           
      _C1ZIIP6:_C1ZIIP,                                                         
      _C2ZIIP6:_C2ZIIP,                                                         
      _ZIIP_EL6:_ZIIP_EL,                                                       
      _C1TIME6:_C1TIME,                                                         
      _C2TIME6:_C2TIME)),                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID7,AND,_SSID,EQ,SSID7),                            
    OVERLAY=(_COMM7:_COMMITS,                                                   
      _C1TCB7:_C1TCB,                                                           
      _C2TCB7:_C2TCB,                                                           
      _C1ZIIP7:_C1ZIIP,                                                         
      _C2ZIIP7:_C2ZIIP,                                                         
      _ZIIP_EL7:_ZIIP_EL,                                                       
      _C1TIME7:_C1TIME,                                                         
      _C2TIME7:_C2TIME)),                                                       
 IFTHEN=(WHEN=(_SMFID,EQ,SMFID8,AND,_SSID,EQ,SSID8),                            
    OVERLAY=(_COMM8:_COMMITS,                                                   
      _C1TCB8:_C1TCB,                                                           
      _C2TCB8:_C2TCB,                                                           
      _C1ZIIP8:_C1ZIIP,                                                         
      _C2ZIIP8:_C2ZIIP,                                                         
      _ZIIP_EL8:_ZIIP_EL,                                                       
      _C1TIME8:_C1TIME,                                                         
      _C2TIME8:_C2TIME)),                                                       
 IFTHEN=(WHEN=NONE,                                                             
    OVERLAY=(_COMMO:_COMMITS,                                                   
      _C1TCBO:_C1TCB,                                                           
      _C2TCBO:_C2TCB,                                                           
      _C1ZIIPO:_C1ZIIP,                                                         
      _C2ZIIPO:_C2ZIIP,                                                         
      _ZIIP_ELO:_ZIIP_EL,                                                       
      _C1TIMEO:_C1TIME,                                                         
      _C2TIMEO:_C2TIME))                                                        
*                                                                               
 SORT FIELDS=(_DATE,A,                                                          
  _HOUR,A,                                                                      
  _MIN,A)                                                                       
*                                                                               
* Commits for each named subsystem                                              
 SUM FIELDS=(_COMM1,                                                            
   _COMM2,                                                                      
   _COMM3,                                                                      
   _COMM4,                                                                      
   _COMM5,                                                                      
   _COMM6,                                                                      
   _COMM7,                                                                      
   _COMM8,                                                                      
* Commits for "other" subsys                                                    
   _COMMO,                                                                      
*                                                                               
* C1 TCB for each named subsystem                                               
   _C1TCB1,                                                                     
   _C1TCB2,                                                                     
   _C1TCB3,                                                                     
   _C1TCB4,                                                                     
   _C1TCB5,                                                                     
   _C1TCB6,                                                                     
   _C1TCB7,                                                                     
   _C1TCB8,                                                                     
* C1 TCB for "other" subsys                                                     
   _C1TCBO,                                                                     
*                                                                               
* C2 TCB for each named subsystem                                               
   _C2TCB1,                                                                     
   _C2TCB2,                                                                     
   _C2TCB3,                                                                     
   _C2TCB4,                                                                     
   _C2TCB5,                                                                     
   _C2TCB6,                                                                     
   _C2TCB7,                                                                     
   _C2TCB8,                                                                     
* C2 TCB for "other" subsys                                                     
   _C2TCBO,                                                                     
*                                                                               
* C1 zIIP for each named subsystem                                              
   _C1ZIIP1,                                                                    
   _C1ZIIP2,                                                                    
   _C1ZIIP3,                                                                    
   _C1ZIIP4,                                                                    
   _C1ZIIP5,                                                                    
   _C1ZIIP6,                                                                    
   _C1ZIIP7,                                                                    
   _C1ZIIP8,                                                                    
* C1 zIIP for "other" subsys                                                    
   _C1ZIIPO,                                                                    
*                                                                               
* C2 zIIP for each named subsystem                                              
   _C2ZIIP1,                                                                    
   _C2ZIIP2,                                                                    
   _C2ZIIP3,                                                                    
   _C2ZIIP4,                                                                    
   _C2ZIIP5,                                                                    
   _C2ZIIP6,                                                                    
   _C2ZIIP7,                                                                    
   _C2ZIIP8,                                                                    
* C2 zIIP for "other" subsys                                                    
   _C2ZIIPO,                                                                    
*                                                                               
* zIIP Eligible for each named subsystem                                        
   _ZIIP_EL1,                                                                   
   _ZIIP_EL2,                                                                   
   _ZIIP_EL3,                                                                   
   _ZIIP_EL4,                                                                   
   _ZIIP_EL5,                                                                   
   _ZIIP_EL6,                                                                   
   _ZIIP_EL7,                                                                   
   _ZIIP_EL8,                                                                   
* zIIP Eligible for "other" subsys                                              
   _ZIIP_ELO,                                                                   
*                                                                               
* C1 Time for each named subsystem                                              
   _C1TIME1,                                                                    
   _C1TIME2,                                                                    
   _C1TIME3,                                                                    
   _C1TIME4,                                                                    
   _C1TIME5,                                                                    
   _C1TIME6,                                                                    
   _C1TIME7,                                                                    
   _C1TIME8,                                                                    
* C1 Time for "other" subsys                                                    
   _C1TIMEO,                                                                    
*                                                                               
* C2 Time for each named subsystem                                              
   _C2TIME1,                                                                    
   _C2TIME2,                                                                    
   _C2TIME3,                                                                    
   _C2TIME4,                                                                    
   _C2TIME5,                                                                    
   _C2TIME6,                                                                    
   _C2TIME7,                                                                    
   _C2TIME8,                                                                    
* C2 Time for "other" subsys                                                    
   _C2TIMEO)                                                                    
*                                                                               
*                                                                               
 OUTFIL FNAMES=REPORT,REMOVECC,                                                 
 HEADER1=(C'"By Subsystem By Minute",',                                         
   /,                                                                           
* Blank cell above 'Time'                                                       
   C'"",',                                                                      
*                                                                               
* Commits for each named subsystem                                              
   C'"Commits",',                                                               
   C'"Commits",',                                                               
   C'"Commits",',                                                               
   C'"Commits",',                                                               
   C'"Commits",',                                                               
   C'"Commits",',                                                               
   C'"Commits",',                                                               
   C'"Commits",',                                                               
* Commits for "other" subsys                                                    
   C'"Commits",',                                                               
*                                                                               
* C1 TCB for each named subsystem                                               
   C'"C1 TCB",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 TCB",',                                                                
   C'"C1 TCB",',                                                                
* C1 TCB for "other" subsys                                                     
   C'"C1 TCB",',                                                                
*                                                                               
* C2 TCB for each named subsystem                                               
   C'"C2 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C2 TCB",',                                                                
   C'"C2 TCB",',                                                                
* C2 TCB for "other" subsys                                                     
   C'"C2 TCB",',                                                                
*                                                                               
* C1 zIIP for each named subsystem                                              
   C'"C1 zIIP",',                                                               
   C'"C1 zIIP",',                                                               
   C'"C1 zIIP",',                                                               
   C'"C1 zIIP",',                                                               
   C'"C1 zIIP",',                                                               
   C'"C1 zIIP",',                                                               
   C'"C1 zIIP",',                                                               
   C'"C1 zIIP",',                                                               
* C1 zIIP for "other" subsys                                                    
   C'"C1 zIIP",',                                                               
*                                                                               
* C2 zIIP for each named subsystem                                              
   C'"C2 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
   C'"C2 zIIP",',                                                               
* C2 zIIP for "other" subsys                                                    
   C'"C2 zIIP",',                                                               
*                                                                               
* zIIP Eligible for each named subsystem                                        
   C'"zIIP Eligible",',                                                         
   C'"zIIP Eligible",',                                                         
   C'"zIIP Eligible",',                                                         
   C'"zIIP Eligible",',                                                         
   C'"zIIP Eligible",',                                                         
   C'"zIIP Eligible",',                                                         
   C'"zIIP Eligible",',                                                         
   C'"zIIP Eligible",',                                                         
* zIIP Eligible for "other" subsys                                              
   C'"zIIP Eligible",',                                                         
*                                                                               
* C1 Time for each named subsystem                                              
   C'"C1 Elapsed",',                                                            
   C'"C1 Elapsed",',                                                            
   C'"C1 Elapsed",',                                                            
   C'"C1 Elapsed",',                                                            
   C'"C1 Elapsed",',                                                            
   C'"C1 Elapsed",',                                                            
   C'"C1 Elapsed",',                                                            
   C'"C1 Elapsed",',                                                            
* C1 Time for "other" subsys                                                    
   C'"C1 Elapsed",',                                                            
*                                                                               
* C2 Time for each named subsystem                                              
   C'"C2 Elapsed",',                                                            
   C'"C2 Elapsed",',                                                            
   C'"C2 Elapsed",',                                                            
   C'"C2 Elapsed",',                                                            
   C'"C2 Elapsed",',                                                            
   C'"C2 Elapsed",',                                                            
   C'"C2 Elapsed",',                                                            
   C'"C2 Elapsed",',                                                            
* C2 Time for "other" subsys                                                    
   C'"C2 Elapsed",',                                                            
*                                                                               
* 2nd line of titles                                                            
   /,                                                                           
* Time key field                                                                
   C'"Time",',                                                                  
*                                                                               
* Commits for each named subsystem                                              
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* Commits for "other" subsys                                                    
   C'"Other",',                                                                 
*                                                                               
* C1 TCB for each named subsystem                                               
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* C1 TCB for "other" subsys                                                     
   C'"Other",',                                                                 
*                                                                               
* C2 TCB for each named subsystem                                               
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* C2 TCB for "other" subsys                                                     
   C'"Other",',                                                                 
*                                                                               
* C1 zIIP for each named subsystem                                              
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* C1 zIIP for "other" subsys                                                    
   C'"Other",',                                                                 
*                                                                               
* C2 zIIP for each named subsystem                                              
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* C2 zIIP for "other" subsys                                                    
   C'"Other",',                                                                 
*                                                                               
* zIIP Eligible for each named subsystem                                        
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* zIIP Eligible for "other" subsys                                              
   C'"Other",',                                                                 
*                                                                               
* C1 Time for each named subsystem                                              
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* C1 Time for "other" subsys                                                    
   C'"Other",',                                                                 
*                                                                               
* C2 Time for each named subsystem                                              
   C'"',SMFID1,' / ',SSID1,'",',                                                
   C'"',SMFID2,' / ',SSID2,'",',                                                
   C'"',SMFID3,' / ',SSID3,'",',                                                
   C'"',SMFID4,' / ',SSID4,'",',                                                
   C'"',SMFID5,' / ',SSID5,'",',                                                
   C'"',SMFID6,' / ',SSID6,'",',                                                
   C'"',SMFID7,' / ',SSID7,'",',                                                
   C'"',SMFID8,' / ',SSID8,'",',                                                
* C2 Time for "other" subsys                                                    
   C'"Other",'),                                                                
*                                                                               
 OUTREC=(_RDW,                                                                  
* Time key field                                                                
   C'"',                                                                        
   _DATE,DT1,EDIT=(TTTT/TT/TT),X,                                               
   _HOUR,EDIT=(TT),                                                             
   C':',                                                                        
   _MIN,EDIT=(TT),                                                              
   C'",',                                                                       
*                                                                               
* Commits for each named subsystem                                              
   _COMM1,EDIT=(IIIIIIIIT),C',',                                                
   _COMM2,EDIT=(IIIIIIIIT),C',',                                                
   _COMM3,EDIT=(IIIIIIIIT),C',',                                                
   _COMM4,EDIT=(IIIIIIIIT),C',',                                                
   _COMM5,EDIT=(IIIIIIIIT),C',',                                                
   _COMM6,EDIT=(IIIIIIIIT),C',',                                                
   _COMM7,EDIT=(IIIIIIIIT),C',',                                                
   _COMM8,EDIT=(IIIIIIIIT),C',',                                                
* Commits for "other" subsys                                                    
   _COMMO,EDIT=(IIIIIIIIT),C',',                                                
*                                                                               
* C1 TCB for each named subsystem                                               
   _C1TCB1,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C1TCB2,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C1TCB3,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C1TCB4,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C1TCB5,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C1TCB6,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C1TCB7,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C1TCB8,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
* C1 TCB for "other" subsys                                                     
   _C1TCBO,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
*                                                                               
* C2 TCB for each named subsystem                                               
   _C2TCB1,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB2,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB3,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB4,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB5,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB6,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB7,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
   _C2TCB8,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
* C2 TCB for "other" subsys                                                     
   _C2TCBO,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                                
*                                                                               
* C1 zIIP for each named subsystem                                              
   _C1ZIIP1,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1ZIIP2,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1ZIIP3,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1ZIIP4,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1ZIIP5,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1ZIIP6,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1ZIIP7,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1ZIIP8,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
* C1 ZIIP for "other" subsys                                                    
   _C1ZIIPO,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
*                                                                               
* C2 zIIP for each named subsystem                                              
   _C2ZIIP1,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2ZIIP2,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2ZIIP3,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2ZIIP4,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2ZIIP5,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2ZIIP6,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2ZIIP7,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2ZIIP8,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
* C2 ZIIP for "other" subsys                                                    
   _C2ZIIPO,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
*                                                                               
* zIIP Eligible for each named subsystem                                        
   _ZIIP_EL1,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _ZIIP_EL2,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _ZIIP_EL3,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _ZIIP_EL4,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _ZIIP_EL5,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _ZIIP_EL6,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _ZIIP_EL7,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
   _ZIIP_EL8,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
* zIIP Eligible for "other" subsys                                              
   _ZIIP_ELO,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                              
*                                                                               
* C1 Time for each named subsystem                                              
   _C1TIME1,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1TIME2,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1TIME3,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1TIME4,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1TIME5,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1TIME6,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1TIME7,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C1TIME8,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
* C1 Time for "other" subsys                                                    
   _C1TIMEO,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
*                                                                               
* C2 Time for each named subsystem                                              
   _C2TIME1,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2TIME2,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2TIME3,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2TIME4,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2TIME5,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2TIME6,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2TIME7,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
   _C2TIME8,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
* C2 Time for "other" subsys                                                    
   _C2TIMEO,DIV,ONE_MILLI,EDIT=(IIIIIT.TTT),C',',                               
*                                                                               
   20X)                                                                         
 END                                                                            
/*                                                                              
//*                                                                             
