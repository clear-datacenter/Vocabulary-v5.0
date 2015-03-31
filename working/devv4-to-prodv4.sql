-- Copy all relevant tables from DevV4

CREATE TABLE CONCEPT AS SELECT * FROM DEVV4.CONCEPT;
CREATE TABLE VOCABULARY AS SELECT * FROM DEVV4.VOCABULARY;
CREATE TABLE CONCEPT_RELATIONSHIP AS SELECT * FROM DEVV4.CONCEPT_RELATIONSHIP;
CREATE TABLE RELATIONSHIP AS SELECT * FROM DEVV4.RELATIONSHIP;
CREATE TABLE CONCEPT_SYNONYM AS SELECT * FROM DEVV4.CONCEPT_SYNONYM;
CREATE TABLE CONCEPT_ANCESTOR AS SELECT * FROM DEVV4.CONCEPT_ANCESTOR;
CREATE TABLE SOURCE_TO_CONCEPT_MAP AS SELECT * FROM DEVV4.SOURCE_TO_CONCEPT_MAP;
CREATE TABLE DRUG_STRENGTH AS SELECT * FROM DEVV4.DRUG_STRENGTH;

UPDATE VOCABULARY SET VOCABULARY_NAME='OMOP Vocabulary v4.5 21-Mar-2015' WHERE VOCABULARY_ID=0;

ALTER TABLE CONCEPT ADD CONSTRAINT XPK_CONCEPT PRIMARY KEY (CONCEPT_ID);
CREATE INDEX CONCEPT_VOCAB ON CONCEPT (VOCABULARY_ID);

CREATE INDEX CONCEPT_RELATIONSHIP_C_1 ON CONCEPT_RELATIONSHIP (CONCEPT_ID_1);
CREATE INDEX CONCEPT_RELATIONSHIP_C_2 ON CONCEPT_RELATIONSHIP (CONCEPT_ID_2);

CREATE INDEX CONCEPT_SYNONYM_CONCEPT ON CONCEPT_SYNONYM (CONCEPT_ID);