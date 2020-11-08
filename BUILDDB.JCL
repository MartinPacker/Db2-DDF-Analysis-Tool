//JCL1     JCLLIB  ORDER=<HLQ>.<QUAL2>.JCL                                      
//DELFLAT EXEC PGM=IEFBR14                                                      
//CLSRVDDF DD  DISP=(MOD,DELETE),                                               
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF,                                 
//         SPACE=(TRK,1),UNIT=<UNIT>                                            
//MFDB2DDF DD  DISP=(MOD,DELETE),                                               
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF,                                 
//         SPACE=(TRK,1),UNIT=<UNIT>                                            
//JDBCDDF  DD  DISP=(MOD,DELETE),                                               
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF,                                  
//         SPACE=(TRK,1),UNIT=<UNIT>                                            
//CLICICS  DD  DISP=(MOD,DELETE),                                               
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLICICS,                                  
//         SPACE=(TRK,1),UNIT=<UNIT>                                            
//CLIBATCH DD  DISP=(MOD,DELETE),                                               
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLIBATCH,                                 
//         SPACE=(TRK,1),UNIT=<UNIT>                                            
//CLIOTHER DD  DISP=(MOD,DELETE),                                               
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLIOTHER,                                 
//         SPACE=(TRK,1),UNIT=<UNIT>                                            
//IFCID239 DD  DISP=(MOD,DELETE),                                               
//         DSN=<HLQ>.<QUAL2>.DDF.FLAT.IFCID239,                                 
//         SPACE=(TRK,1),UNIT=<UNIT>                                            
//*                                                                             
//MAKEFLAT EXEC PGM=SORT,REGION=0M                                              
//SYSOUT   DD SYSOUT=<SYSOUT>                                                   
//SYSUDUMP DD SYSOUT=<SYSOUT>                                                   
//SYSPRINT DD SYSOUT=<SYSOUT>                                                   
//SYMNOUT  DD SYSOUT=<SYSOUT>                                                   
//EXITLIB  DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.LOAD                                               
//*                                                                             
//SORTIN   DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.SMF.DB2ACCT.HOURS2                                 
//*                                                                             
//CLSRVDDF DD DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLSRVDDF,                              
//         DISP=(NEW,CATLG),                                                    
//         SPACE=(CYL,(50,50),RLSE),                                            
//             DATACLAS=<DATACLASS>,                                            
//         DCB=*.SORTIN,RECFM=VB                                                
//MFDB2DDF DD DSN=<HLQ>.<QUAL2>.DDF.FLAT.MFDB2DDF,                              
//         DISP=(NEW,CATLG),                                                    
//         SPACE=(CYL,(50,50),RLSE),                                            
//             DATACLAS=<DATACLASS>,                                            
//         DCB=*.SORTIN,RECFM=VB                                                
//JDBCDDF  DD DSN=<HLQ>.<QUAL2>.DDF.FLAT.JDBCDDF,                               
//         DISP=(NEW,CATLG),                                                    
//         SPACE=(CYL,(50,50),RLSE),                                            
//             DATACLAS=<DATACLASS>,                                            
//         DCB=*.SORTIN,RECFM=VB                                                
//CLICICS  DD DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLICICS,                               
//         DISP=(NEW,CATLG),                                                    
//         SPACE=(CYL,(50,50),RLSE),                                            
//             DATACLAS=<DATACLASS>,                                            
//         DCB=*.SORTIN,RECFM=VB                                                
//CLIBATCH DD DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLIBATCH,                              
//         DISP=(NEW,CATLG),                                                    
//         SPACE=(CYL,(50,50),RLSE),                                            
//             DATACLAS=<DATACLASS>,                                            
//         DCB=*.SORTIN,RECFM=VB                                                
//CLIOTHER DD DSN=<HLQ>.<QUAL2>.DDF.FLAT.CLIOTHER,                              
//         DISP=(NEW,CATLG),                                                    
//         SPACE=(CYL,(50,50),RLSE),                                            
//             DATACLAS=<DATACLASS>,                                            
//         DCB=*.SORTIN,RECFM=VB                                                
//IFCID239 DD DSN=<HLQ>.<QUAL2>.DDF.FLAT.IFCID239,                              
//         DISP=(NEW,CATLG),                                                    
//         SPACE=(CYL,(500,500),RLSE),                                          
//             DATACLAS=<DATACLASS>,                                            
//         DCB=*.SORTIN,RECFM=VB                                                
//SYMNAMES DD DISP=SHR,                                                         
//         DSN=<HLQ>.<QUAL2>.PMSERV.CTL(DDFIDSYM)                               
//*                                                                             
//SYSIN    DD  *                                                                
* Always keep the following statements in                                       
 MODS  E15=(E15DDFID,75000,EXITLIB,N)                                           
 OPTION COPY,VLSHRT                                                             
 OUTFIL FNAMES=CLSRVDDF,                                                        
   INCLUDE=(QMDAPTYP,EQ,C'SQL',AND,QLACSQLS,EQ,+0,AND,IFCID,EQ,+3)              
 OUTFIL FNAMES=MFDB2DDF,                                                        
   INCLUDE=(QMDAPTYP,EQ,C'DSN',AND,QLACSQLS,EQ,+0,AND,IFCID,EQ,+3)              
 OUTFIL FNAMES=JDBCDDF,                                                         
   INCLUDE=(QMDAPTYP,EQ,C'JCC',AND,QLACSQLS,EQ,+0,AND,IFCID,EQ,+3)              
 OUTFIL FNAMES=CLICICS,                                                         
   INCLUDE=(QLACSQLS,GT,+0,AND,QWHCATYP,EQ,QWHCCICS,AND,IFCID,EQ,+3)            
 OUTFIL FNAMES=CLIBATCH,                                                        
   INCLUDE=(QLACSQLS,GT,+0,AND,                                                 
     (QWHCATYP,EQ,QWHCTSO,OR,QWHCATYP,EQ,QWHCDB2C,OR,                           
      QWHCATYP,EQ,QWHCDLIB,OR,QWHCATYP,EQ,QWHCIMSB,OR,                          
      QWHCATYP,EQ,QWHCUTIL,OR,CONNID,EQ,C'BATCH   '),AND,IFCID,EQ,+3)           
 OUTFIL FNAMES=IFCID239,INCLUDE=(IFCID,EQ,+239)                                 
 OUTFIL FNAMES=CLIOTHER,SAVE                                                    
*                                                                               
 END                                                                            
/*                                                                              
