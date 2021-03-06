OPTIONS (errors=0, SKIP=1, direct=true)
LOAD DATA 
CHARACTERSET UTF8  
INFILE 'loinc.csv'  
BADFILE 'loinc.bad'
DISCARDFILE 'loinc.dsc'                                                           
TRUNCATE
INTO TABLE LOINC                                                                
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'                                                       
TRAILING NULLCOLS                                                               
(                                                                               
   LOINC_NUM                        CHAR NULLIF (LOINC_NUM=BLANKS)              
 , COMPONENT                        CHAR NULLIF (COMPONENT=BLANKS)              
 , PROPERTY                         CHAR NULLIF (PROPERTY=BLANKS)               
 , TIME_ASPCT                       CHAR NULLIF (TIME_ASPCT=BLANKS)             
 , SYSTEM                           CHAR NULLIF (SYSTEM=BLANKS)                 
 , SCALE_TYP                        CHAR NULLIF (SCALE_TYP=BLANKS)              
 , METHOD_TYP                       CHAR NULLIF (METHOD_TYP=BLANKS)             
 , CLASS                            CHAR NULLIF (CLASS=BLANKS)                  
 , SOURCE                           CHAR NULLIF (SOURCE=BLANKS)                 
 , VersionLastChanged               CHAR NULLIF (VersionLastChanged=BLANKS)                                                                       
 , CHNG_TYPE                        CHAR NULLIF (CHNG_TYPE=BLANKS)              
 , DEFINITIONDESCRIPTION            CHAR(5000) NULLIF (DEFINITIONDESCRIPTION=BLANKS)                                               
 , STATUS                           CHAR NULLIF (STATUS=BLANKS)                 
 , CONSUMER_NAME                    CHAR NULLIF (CONSUMER_NAME=BLANKS)          
 , CLASSTYPE                        CHAR NULLIF (CLASSTYPE=BLANKS)              
 , FORMULA                          CHAR(5000) NULLIF (FORMULA=BLANKS)                
 , SPECIES                          CHAR NULLIF (SPECIES=BLANKS)                
 , EXMPL_ANSWERS                    CHAR(5000) NULLIF (EXMPL_ANSWERS=BLANKS)                                            
 , SURVEY_QUEST_TEXT                CHAR(5000) NULLIF (SURVEY_QUEST_TEXT =BLANKS)                                             
 , SURVEY_QUEST_SRC                 CHAR NULLIF (SURVEY_QUEST_SRC=BLANKS)       
 , UNITSREQUIRED                    CHAR NULLIF (UNITSREQUIRED=BLANKS)          
 , SUBMITTED_UNITS                  CHAR NULLIF (SUBMITTED_UNITS=BLANKS)        
 , RELATEDNAMES2                    CHAR(5000) NULLIF (RELATEDNAMES2=BLANKS)                                            
 , SHORTNAME                        CHAR NULLIF (SHORTNAME=BLANKS)              
 , ORDER_OBS                        CHAR NULLIF (ORDER_OBS=BLANKS)              
 , CDISC_COMMON_TESTS               CHAR NULLIF (CDISC_COMMON_TESTS=BLANKS)     
 , HL7_FIELD_SUBFIELD_ID            CHAR NULLIF (HL7_FIELD_SUBFIELD_ID=BLANKS)  
 , EXTERNAL_COPYRIGHT_NOTICE        CHAR(5000) NULLIF (EXTERNAL_COPYRIGHT_NOTICE=BLANKS)                                            
 , EXAMPLE_UNITS                    CHAR NULLIF (EXAMPLE_UNITS=BLANKS)          
 , LONG_COMMON_NAME                 CHAR NULLIF (LONG_COMMON_NAME=BLANKS)       
 , UNITSANDRANGE                    CHAR(5000) NULLIF (UNITSANDRANGE=BLANKS)                                            
 , DOCUMENT_SECTION                 CHAR NULLIF (DOCUMENT_SECTION=BLANKS)       
 , EXAMPLE_UCUM_UNITS               CHAR NULLIF (EXAMPLE_UCUM_UNITS=BLANKS)     
 , EXAMPLE_SI_UCUM_UNITS            CHAR NULLIF (EXAMPLE_SI_UCUM_UNITS=BLANKS)  
 , STATUS_REASON                    CHAR NULLIF (STATUS_REASON=BLANKS)          
 , STATUS_TEXT                      CHAR(5000) NULLIF (STATUS_TEXT=BLANKS)                                            
 , CHANGE_REASON_PUBLIC             CHAR(5000) NULLIF (CHANGE_REASON_PUBLIC=BLANKS)                                            
 , COMMON_TEST_RANK                 CHAR NULLIF (COMMON_TEST_RANK=BLANKS)       
 , COMMON_ORDER_RANK                CHAR NULLIF (COMMON_ORDER_RANK=BLANKS)      
 , COMMON_SI_TEST_RANK              CHAR NULLIF (COMMON_SI_TEST_RANK=BLANKS)    
 , HL7_ATTACHMENT_STRUCTURE         CHAR NULLIF (HL7_ATTACHMENT_STRUCTURE=BLANKS)    
 , EXTERNAL_COPYRIGHT_LINK          CHAR NULLIF (EXTERNAL_COPYRIGHT_LINK=BLANKS) 
 , PANELTYPE                        CHAR NULLIF (PANELTYPE=BLANKS)
 , ASKATORDERENTRY                  CHAR NULLIF (ASKATORDERENTRY=BLANKS)
 , ASSOCIATEDOBSERVATIONS           CHAR NULLIF (ASSOCIATEDOBSERVATIONS=BLANKS)
   
)                                                        
