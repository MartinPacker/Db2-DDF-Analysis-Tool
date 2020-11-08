*  Constant values for QWHCATYP (Connection Type) here as CONNTYPE              
QWHCTSO,X'00000001'             TSO Foreground and Background                   
QWHCDB2C,X'00000002'            DB2 Call Attach                                 
QWHCDLIB,X'00000003'            DL/I Batch                                      
QWHCCICS,X'00000004'            CICS Attach                                     
QWHCIMSB,X'00000005'            IMS Attach BMP                                  
QWHCIMSM,X'00000006'            IMS Attach MPP                                  
QWHCDUW,X'00000007'             DB2 Private Protocol                            
QWHCRUW,X'00000008'             DRDA Protocol                                   
QWHCICTL,X'00000009'            IMS Control Region                              
QWHCTBMP,X'0000000A'            IMS Transaction BMP                             
QWHCUTIL,X'0000000B'            DB2 Utilities                                   
QWHCTRRS,X'0000000C'            RRSAF Attach                                    
*                                                                               
* Note: for IFCID 239 code gives a 0 value for QWACRINV as there is no          
* QWAC section to contain one. So 0 means this an IFCID 239 record. For         
* IFCID 3 one of the values should apply.                                       
IFCID239,X'00000000'         IFCID 239 so no QWACRINV                           
QWACRACC,X'00000001'         /*ACCUMULATING DATA BY END USER FOR DDF */ 07290000
*                            /*OR RRSAF AND THRESHOLD REACHED FOR #  */ 07300000
*                            /*END USER OCCURRENCES. THIS IS ALSO    */ 07310000
*                            /*THE QWACRINV VALUE FOR IFI 147/148    */ 07320000
*                            /*RECORDS THAT REPRESENT DDF/RRSAF      */ 07330000
*                            /*ROLLUP DATA.                          */ 07340000
QWACRSTG,X'00000002'         /*ACCUMULATING DATA BY END USER FOR DDF */ 07350000
*                            /*OR RRSAF AND INTERNAL DB2 STORAGE     */ 07360000
*                            /*THRESHOLD HAS BEEN REACHED            */ 07370000
QWACRSTL,X'00000003'         /*ACCUMULATING DATA BY END USER FOR DDF */ 07380000
*                            /*OR RRSAF AND ACCUMULATED DATA HAS     */ 07390000
*                            /*EXCEEDED THE STALENESS THRESHOLD      */ 07400000
QWACRIFI,X'00000004'         /*IFI READS REQUEST FOR IFCID 147 OR    */ 07410000
*                            /*148                                   */ 07420000
QWACRSUS,X'00000006'         /*SAME USER RESIGN-ON WITH SAME AUTHID  */ 07430000
QWACRNUS,X'00000008'         /*NEW USER - THE AUTHORIZATION ID       */ 07440000
*                            /*CHANGED.                              */ 07450000
QWACRINA,X'0000000A'         /*DDF THREAD IS BECOMING INACTIVE       */ 07460000
QWACRIN2,X'0000000B'         /*DDF TYPE 2 INACT IS BECOMING INACTIVE */ 07470000
QWACRDEA,X'0000000C'         /*DEALLOCATION - NORMAL PROGRAM         */ 07480000
*                            /*TERMINATION                           */ 07490000
QWACRAAC,X'0000000E'         /*COMMIT - RRSAF THREAD SPECIFIED       */ 07500000
*                            /*ACCOUNTING INTERVAL = COMMIT          */ 07510000
*/********************************************************************/ 07520000
*/* THE FOLLOWING CONSTANTS INDICATE WHY ACCOUNTING WAS CALLED,         07530000
*   HOWEVER, THE ACCOUNTING RECORD IS WRITTEN AT DEALLOCATION        */ 07540000
*/********************************************************************/ 07550000
*                                                                       07560000
QWACEOTN,X'00000010'         /*END OF TASK - APPLICATION PROGRAM     */ 07570000
*                            /*TERMINATED - NORMAL                   */ 07580000
QWACEOTA,X'00000014'         /*END OF TASK - APPLICATION PROGRAM     */ 07590000
*                            /*ABEND SITUATION - ABNORMAL            */ 07600000
QWACEOMA,X'00000018'         /*END OF MEMORY - ABNORMAL TERMINATION  */ 07610000
QWACRESI,X'0000001C'         /*RESOLVE INDOUBT - ABNORMAL            */ 07620000
QWACCANF,X'00000020'         /*CANCEL FORCE - STOP FORCE COMMAND     */ 07630000
*                            /*TERMINATED - ABNORMAL                 */ 07640000
*/********************************************************************/ 07650000
*/* THE FOLLOWING CONSTANTS INDICATE WHY ACCOUNTING WAS CALLED,         07660000
*    AND THE ACCOUNTING RECORD IS WRITTEN NOW WITH THE WORK UNIT        07670000
*    HAVING GONE  INDOUBT                                            */ 07680000
*/********************************************************************/ 07690000
QWACETIN,X'00000028'         /*END OF TASK - APPLICATION PROGRAM     */ 07700000
*                            /*TERMINATED - NORMAL                   */ 07710000
QWACETIA,X'0000002C'         /*END OF TASK - APPLICATION PROGRAM     */ 07720000
*                            /*ABEND SITUATION - ABNORMAL            */ 07730000
QWACEMIA,X'00000030'         /*END OF MEMORY - ABNORMAL TERMINATION  */ 07740000
*                            /*ABNORMAL                              */ 07750000
QWACCNFI,X'00000038'         /*CANCEL FORCE - STOP FORCE COMMAND     */ 07760000
*                            /*ABNORMAL                              */ 07770000
*                                                                       07780000
*                                                                               
* Helper stuff for reformatting the records after selection                     
POSITION,1                                                                      
RDW,*,4                                                                         
TSTIME,*,4,BI                                                                   
TSDATE,*,4,PD                                                                   
TSHOUR,*,2,PD                                                                   
TSMIN,*,2,PD                                                                    
TSSEC,*,2,PD                                                                    
TSHUN,*,2,PD                                                                    
SSIDENT,*,8,CH                Sys and Subsys concatenated                       
SMFID,=,4,CH                                                                    
SSID,*,4,CH                                                                     
AUTHID,*,8,CH                                                                   
CORRID,*,12,CH                                                                  
CONNID,*,8,CH                                                                   
PLANID,*,8,CH                                                                   
OPERID,*,8,CH                                                                   
QWHCATYP,*,4,BI                                                                 
QWHCTOKN,*,22,CH                                                                
QWHCEUID,*,16,CH             Optionally set by End User WS                      
QWHCEUTX,*,32,CH            "                                                   
QWHCEUWN,*,18,CH            "                                                   
QWACRINV,*,4,BI                                                                 
QWACWLME,*,8,CH                                                                 
QMDAEYEC,*,8,CH                                                                 
QMDAASLN,*,1,BI                                                                 
SKIP,1                                                                          
IFCID,*,2,BI                                                                    
* Need fixed position because of remapping                                      
QMDAAINF,189,255,CH                                                             
QMDAPRID,=,8,CH                                                                 
QMDAPTYP,=,3,CH                                                                 
QMDAPVER,*,2,CH                                                                 
QMDAPREL,*,2,CH                                                                 
QMDAPMOD,*,1,CH                                                                 
QMDAPLAT,*,18,CH                                                                
QMDAAPPL,*,20,CH                                                                
QMDAATID,*,8,CH                                                                 
QMDASFLN,*,2,BI                                                                 
QMDASUFX,*,200,CH                                                               
*                                                                               
* MVS DB2 Specific                                                              
POSITION,197                                                                    
QMDALOCN,*,16,CH                                                                
QMDANETN,*,8,CH                                                                 
QMDALUNM,*,8,CH                                                                 
QMDACNAM,*,8,CH                                                                 
QMDACTYP,*,8,CH                                                                 
QMDACORR,*,12,CH                                                                
QMDAAUTH,*,8,CH                                                                 
QMDAPLAN,*,8,CH                                                                 
QMDAACCT,*,32,CH                                                                
*                                                                               
POSITION,457                                                                    
QWHSEYEC,*,8,CH                                                                 
QWHSLWID,*,24,CH                                                                
QWHSNID,=,8,CH                                                                  
QWHSLUNM,*,8,CH                                                                 
* Remainder of LWID is approx STCK value. (Last 2 bytes commit count            
* but this introduced inaccuracy in STCK value is OK.)                          
* Use eg DC1 for date and TC1 for time.                                         
QWHSLUUV_STCK,*,8,BI                                                            
* Following is first 6 bytes of STCK                                            
QWHSLUUV,=,6,BI                                                                 
* This is commit count                                                          
QWHSLUCC,*,2,BI                                                                 
QLACEYEC,497,8,CH                                                               
QLACLOCN,*,16,CH                                                                
QLACSQLS,*,8,BI                                                                 
QLACSQLR,*,8,BI                                                                 
QLACROWS,*,8,BI                                                                 
QLACROWR,*,8,BI                                                                 
QLACBYTS,*,8,BI                                                                 
QLACBYTR,*,8,BI                                                                 
QLACCNVS,*,8,BI                                                                 
QLACCNVR,*,8,BI                                                                 
QLACMSGS,*,8,BI                                                                 
QLACMSGR,*,8,BI                                                                 
QLACCOMS,*,8,BI                                                                 
QLACCOMR,*,8,BI                                                                 
QLACABRS,*,8,BI                                                                 
QLACABRR,*,8,BI                                                                 
QLACBTBF,*,8,BI                                                                 
QLACBRBF,*,8,BI                                                                 
QWACPKGN,*,2,BI                                                                 
SKIP,2                                                                          
QWACCOMM,*,4,BI                                                                 
QWACABRT,*,4,BI                                                                 
*                                                                               
TEMP,*,4,CH                                                                     
QXSTEYEC,*,8,CH                                                                 
*                                                                               
QXSELECT,*,8,BI                                                                 
QXINSRT,*,8,BI                                                                  
QXUPDTE,*,8,BI                                                                  
QXDELET,*,8,BI                                                                  
QXDESC,*,8,BI                                                                   
QXPREP,*,8,BI                                                                   
QXOPEN,*,8,BI                                                                   
QXCLOSE,*,8,BI                                                                  
QXFETCH,*,8,BI                                                                  
CALLSP,*,8,BI                                                                   
CALLUDF,*,8,BI                                                                  
*                                                                               
QWACEYEC,*,8,CH                                                                 
*                                                                               
C1TCB,*,8,BI                    STCK - Total Class 1 TCB                        
C2NNTCB,*,8,BI                  STCK - Non-nested Class 2 TCB                   
C1TIME,*,8,BI                   STCK - Total Class 1 time                       
C2TIME,*,8,BI                   STCK - Total Class 2 time                       
C2NNTIME,*,8,BI                 STCK - Non-nested Class 2 time                  
C2SPTIME,*,8,BI                 STCK - Stored Procedures Class 2 time           
C2UDFTIME,*,8,BI                STCK - UDF Class 2 time                         
C2SPSCHTIME,*,8,BI              STCK - Stored Procedures Scheduling wait        
C2UDFSCHTIME,*,8,BI             STCK - UDF Scheduling wait                      
IPADDR,*,16,CH                                                                  
QXSTFND,*,8,BI                                                                  
QXSTNFND,*,8,BI                                                                 
QXSTIPRP,*,8,BI                                                                 
QXSTNPRP,*,8,BI                                                                 
QXSTDEXP,*,8,BI                                                                 
QXSTDINV,*,8,BI                                                                 
C1ZIIP,*,8,BI                                                                   
C2ZIIP,*,8,BI                                                                   
ZIIP_ELIGIBLE,*,8,BI                                                            
C2TCB,*,8,BI                    STCK - Total Class 2 TCB                        
C2SPTCB,*,8,BI                  STCK - Stored Procedures Class 2 TCB            
C2UDFTCB,*,8,BI                 STCK - UDF Class 2 TCB                          
QWACBSC,*,8,BI                                                                  
QWACESC,*,8,BI                                                                  
NONC2TIME,*,8,BI                                                                
NONC2TCB,*,8,BI                                                                 
QWHSLOCN,*,16,CH                                                                
QWHDSVNM,*,16,CH                                                                
COMMABORT,*,4,BI                                                                
SKIP,4                                                                          
QLACMDWT,*,8,BI                                                                 
SYNCRD,*,8,BI                                                                   
ASYNCWR,*,8,BI                                                                  
ASYNCRD,*,8,BI                                                                  
LOCALLOCK,*,8,BI                                                                
GLOBALLOCK,*,8,BI                                                               
LOGBYTESWR,*,8,BI                                                               
LOGRECSWR,*,4,BI                                                                
LOGWREVT,*,4,BI                                                                 
QWAXEYEC,*,8,CH                                                                 
QWAXOTSE,*,8,BI                                                                 
ALOGWR,*,8,BI                                                                   
QWAXALOG,*,8,BI                                                                 
QWAXAWAR,*,8,BI                                                                 
QWAXALCT,*,4,BI                                                                 
QWAXANAR,*,4,BI                                                                 
*                                                                               
* Package mappings - Temporary - PACKAGET file                                  
POSITION,1                                                                      
PKT_RDW,*,4,BI                                                                  
PKT_SMFID,*,4,CH                                                                
PKT_SSID,*,4,CH                                                                 
PKT_QWHS,*,8,CH                 Eyecatcher                                      
PKT_LWID,*,24,CH                                                                
PKT_NID,=,8,CH                                                                  
PKT_LUNM,*,8,CH                                                                 
* Remainder of LWID is approx STCK value. (Last 2 bytes commit count            
* but this introduced inaccuracy in STCK value is OK.)                          
* Use eg DC1 for date and TC1 for time.                                         
PKT_LUUV_STCK,*,8,BI                                                            
* Following is first 6 bytes of STCK                                            
PKT_LUUV,=,6,BI                                                                 
* This is commit count                                                          
PKT_LUCC,*,2,BI                                                                 
PKT_LOCN,*,16,CH                                                                
PKT_ATYP,*,4,BI                                                                 
PKT_SECTL,*,2,BI                                                                
PKT_SECTN,*,2,BI                                                                
PKT_CORR,*,12,CH                                                                
PKT_CONN,*,8,CH                                                                 
PKT_PLAN,*,8,CH                                                                 
*                                                                               
SKIP,90                          For compatibility with IFCID 3 flat            
PKT_IFCID,*,2,BI                                                                
*                                                                               
PKT_RECN0,*,2,BI                                                                
PKT_LOCN0,*,16,CH                                                               
PKT_COLN0,*,18,CH                                                               
PKT_PKID0,*,18,CH                                                               
PKT_AAFG0,*,2,BI                                                                
PKT_AANM0,*,18,CH                                                               
PKT_ASCH0,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU0,*,8,BI                                                                 
PKT_ZIIP0,*,8,BI                                                                
PKT_ET0,*,8,BI                                                                  
PKT_SPROCS0,*,4,BI                                                              
PKT_UDFS0,*,4,BI                                                                
PKT_IDAA0,*,8,BI                                                                
*                                                                               
PKT_RECN1,*,2,BI                                                                
PKT_LOCN1,*,16,CH                                                               
PKT_COLN1,*,18,CH                                                               
PKT_PKID1,*,18,CH                                                               
PKT_AAFG1,*,2,BI                                                                
PKT_AANM1,*,18,CH                                                               
PKT_ASCH1,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU1,*,8,BI                                                                 
PKT_ZIIP1,*,8,BI                                                                
PKT_ET1,*,8,BI                                                                  
PKT_SPROCS1,*,4,BI                                                              
PKT_UDFS1,*,4,BI                                                                
PKT_IDAA1,*,8,BI                                                                
*                                                                               
PKT_RECN2,*,2,BI                                                                
PKT_LOCN2,*,16,CH                                                               
PKT_COLN2,*,18,CH                                                               
PKT_PKID2,*,18,CH                                                               
PKT_AAFG2,*,2,BI                                                                
PKT_AANM2,*,18,CH                                                               
PKT_ASCH2,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU2,*,8,BI                                                                 
PKT_ZIIP2,*,8,BI                                                                
PKT_ET2,*,8,BI                                                                  
PKT_SPROCS2,*,4,BI                                                              
PKT_UDFS2,*,4,BI                                                                
PKT_IDAA2,*,8,BI                                                                
*                                                                               
PKT_RECN3,*,2,BI                                                                
PKT_LOCN3,*,16,CH                                                               
PKT_COLN3,*,18,CH                                                               
PKT_PKID3,*,18,CH                                                               
PKT_AAFG3,*,2,BI                                                                
PKT_AANM3,*,18,CH                                                               
PKT_ASCH3,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU3,*,8,BI                                                                 
PKT_ZIIP3,*,8,BI                                                                
PKT_ET3,*,8,BI                                                                  
PKT_SPROCS3,*,4,BI                                                              
PKT_UDFS3,*,4,BI                                                                
PKT_IDAA3,*,8,BI                                                                
*                                                                               
PKT_RECN4,*,2,BI                                                                
PKT_LOCN4,*,16,CH                                                               
PKT_COLN4,*,18,CH                                                               
PKT_PKID4,*,18,CH                                                               
PKT_AAFG4,*,2,BI                                                                
PKT_AANM4,*,18,CH                                                               
PKT_ASCH4,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU4,*,8,BI                                                                 
PKT_ZIIP4,*,8,BI                                                                
PKT_ET4,*,8,BI                                                                  
PKT_SPROCS4,*,4,BI                                                              
PKT_UDFS4,*,4,BI                                                                
PKT_IDAA4,*,8,BI                                                                
*                                                                               
PKT_RECN5,*,2,BI                                                                
PKT_LOCN5,*,16,CH                                                               
PKT_COLN5,*,18,CH                                                               
PKT_PKID5,*,18,CH                                                               
PKT_AAFG5,*,2,BI                                                                
PKT_AANM5,*,18,CH                                                               
PKT_ASCH5,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU5,*,8,BI                                                                 
PKT_ZIIP5,*,8,BI                                                                
PKT_ET5,*,8,BI                                                                  
PKT_SPROCS5,*,4,BI                                                              
PKT_UDFS5,*,4,BI                                                                
PKT_IDAA5,*,8,BI                                                                
*                                                                               
PKT_RECN6,*,2,BI                                                                
PKT_LOCN6,*,16,CH                                                               
PKT_COLN6,*,18,CH                                                               
PKT_PKID6,*,18,CH                                                               
PKT_AAFG6,*,2,BI                                                                
PKT_AANM6,*,18,CH                                                               
PKT_ASCH6,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU6,*,8,BI                                                                 
PKT_ZIIP6,*,8,BI                                                                
PKT_ET6,*,8,BI                                                                  
PKT_SPROCS6,*,4,BI                                                              
PKT_UDFS6,*,4,BI                                                                
PKT_IDAA6,*,8,BI                                                                
*                                                                               
PKT_RECN7,*,2,BI                                                                
PKT_LOCN7,*,16,CH                                                               
PKT_COLN7,*,18,CH                                                               
PKT_PKID7,*,18,CH                                                               
PKT_AAFG7,*,2,BI                                                                
PKT_AANM7,*,18,CH                                                               
PKT_ASCH7,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU7,*,8,BI                                                                 
PKT_ZIIP7,*,8,BI                                                                
PKT_ET7,*,8,BI                                                                  
PKT_SPROCS7,*,4,BI                                                              
PKT_UDFS7,*,4,BI                                                                
PKT_IDAA7,*,8,BI                                                                
*                                                                               
PKT_RECN8,*,2,BI                                                                
PKT_LOCN8,*,16,CH                                                               
PKT_COLN8,*,18,CH                                                               
PKT_PKID8,*,18,CH                                                               
PKT_AAFG8,*,2,BI                                                                
PKT_AANM8,*,18,CH                                                               
PKT_ASCH8,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU8,*,8,BI                                                                 
PKT_ZIIP8,*,8,BI                                                                
PKT_ET8,*,8,BI                                                                  
PKT_SPROCS8,*,4,BI                                                              
PKT_UDFS8,*,4,BI                                                                
PKT_IDAA8,*,8,BI                                                                
*                                                                               
PKT_RECN9,*,2,BI                                                                
PKT_LOCN9,*,16,CH                                                               
PKT_COLN9,*,18,CH                                                               
PKT_PKID9,*,18,CH                                                               
PKT_AAFG9,*,2,BI                                                                
PKT_AANM9,*,18,CH                                                               
PKT_ASCH9,*,8,CH                                                                
ALIGN,D                                                                         
PKT_CPU9,*,8,BI                                                                 
PKT_ZIIP9,*,8,BI                                                                
PKT_ET9,*,8,BI                                                                  
PKT_SPROCS9,*,4,BI                                                              
PKT_UDFS9,*,4,BI                                                                
PKT_IDAA9,*,8,BI                                                                
*                                                                               
* Package mappings - Permanent - PACKAGES file                                  
POSITION,1                                                                      
PKG_SMFID,*,4,CH                                                                
PKG_SSID,*,4,CH                                                                 
PKG_LWID,*,24,CH                                                                
PKG_NID,=,8,CH                                                                  
PKG_LUNM,*,8,CH                                                                 
* Remainder of LWID is approx STCK value. (Last 2 bytes commit count            
* but this introduced inaccuracy in STCK value is OK.)                          
* Use eg DC1 for date and TC1 for time.                                         
PKG_LUUV_STCK,*,8,BI                                                            
* Following is first 6 bytes of STCK                                            
PKG_LUUV,=,6,BI                                                                 
* This is commit count                                                          
PKG_LUCC,*,2,BI                                                                 
PKG_LOCN,*,16,CH                                                                
PKG_ATYP,*,4,BI                                                                 
PKG_SECTL,*,2,BI                                                                
PKG_SECTN,*,2,BI                                                                
PKG_CORR,*,12,CH                                                                
PKG_CONN,*,8,CH                                                                 
PKG_PLAN,*,8,CH                                                                 
PKG_RECN,*,2,BI                                                                 
PKG_LOCATION,*,16,CH                                                            
PKG_COLN,*,18,CH                                                                
PKG_PKID,*,18,CH                                                                
PKG_AAFG,*,2,BI                                                                 
PKG_AANM,*,18,CH                                                                
PKG_ASCH,*,8,CH                                                                 
PKG_CPU,*,8,BI                                                                  
PKG_ZIIP,*,8,BI                                                                 
PKG_ET,*,8,BI                                                                   
PKG_SPROCS,*,4,BI                                                               
PKG_UDFS,*,4,BI                                                                 
PKG_IDAA,*,8,BI                                                                 
*                                                                               
* Constants                                                                     
ONE,X'00000001'                  Fullword One                                   
ZERO,X'00000000'                 Fullword Zero                                  
*                                                                               
* Constants for QPACAAFG                                                        
AAFG_PKG,X'0000'                 Normal Package                         03900000
AAFG_SP,C'0001'                  Stored procedure                       03900000
AAFG_UDF,C'0002'                 User defined function                  03910000
AAFG_TRIGGER,C'0003'             Trigger executing                      03920000
AAFG_NATIVE_SP,C'0004'           Native SQL stored procedure            03930000
AAFG_NON_INLINE_UDF,C'0005'      Non-inline UDF                         03940000
*                                                                               
* Application Names                                                             
MS_IIS,C'inetinfo.exe'                                                          
MS_TS,C'mtx.exe'                                                                
JDBC,C'db2jcc_appli'                                                            
*                                                                               
* Time constants for STCK compares and divides                                  
ONE_MILLI,+4096000                                                              
ONE_SEC,+4096000000                                                             
ONE_MIN,+245760000000                                                           
TEN_MINS,+2457600000000                                                         
FIVE_MINS,+1228800000000                                                        
