-- Add units for drug_strength
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Actuation', 'Unit', 'UCUM', 'Unit', 'S', '{actuat}', '01-JAN-1970', '31-DEC-2099', null);	
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'allergenic unit', 'Unit', 'UCUM', 'Unit', 'S', '{AU}', '01-JAN-1970', '31-DEC-2099', null);	
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'bioequivalent allergenic unit', 'Unit', 'UCUM', 'Unit', 'S', '{BAU}', '01-JAN-1970', '31-DEC-2099', null);	
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'cells', 'Unit', 'UCUM', 'Unit', 'S', '{cells}', '01-JAN-1970', '31-DEC-2099', null);	
update concept set concept_name='pH unit' where concept_id=8569;
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'clinical unit', 'Unit', 'UCUM', 'Unit', 'S', '{CU}', '01-JAN-1970', '31-DEC-2099', null);	
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'limit of flocculation unit', 'Unit', 'UCUM', 'Unit', 'S', '{LFU}', '01-JAN-1970', '31-DEC-2099', null);	
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'bacteria', 'Unit', 'UCUM', 'Unit', 'S', '{bacteria}', '01-JAN-1970', '31-DEC-2099', null);	
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'protein nitrogen unit', 'Unit', 'UCUM', 'Unit', 'S', '{PNU}', '01-JAN-1970', '31-DEC-2099', null);	

-- Add combination of Measurement and Procedure
insert into concept (concept_id,  concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (43, 'Measurement/Procedure', 'Metadata', 'Domain', 'Domain', 'S', 'OMOP generated', '1-Jan-1970', '31-Dec-2099', null);
insert into domain (domain_id, domain_name, domain_concept_id)
values ('Meas/Procedure', 'Measurement/Procedure', 43);

-- Erica's and Martijn's type concepts
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Pre-qualification time period', 'Obs Period Type', 'Obs Period Type', 'Obs Period Type', 'S', 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);	
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'EHR Episode Entry', 'Condition Type', 'Condition Type', 'Condition Type', 'S', 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);	

-- Make all Metadata non-standard
update concept 
set standard_concept=null where domain_id='Metadata';

-- Abolish extra vocabulary 'LOINC Multidimensional Classification (Regenstrief Institute)'. Will become only concept class
update concept
set vocabulary_id='LOINC' where vocabulary_id='LOINC Hierarchy';
delete from vocabulary where vocabulary_id='LOINC Hierarchy';
update concept set 
  valid_end_date='1-Dec-2014',
  invalid_reason='D'
where concept_id=44819139
;

-- Add concept_class 'LOINC Class'
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'LOINC Class', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('LOINC Class', 'LOINC Class', (select concept_id from concept where concept_name='LOINC Class'));

-- LOINC concept_class_ids
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Laboratory Class', 'Metadata', 'Concept Class', 'Concept Class', null, '1', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Lab Test', 'Laboratory Class', (select concept_id from concept where concept_name='Laboratory Class'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Clinical Class', 'Metadata', 'Concept Class', 'Concept Class', null, '2', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Clinical Observation', 'Clinical Class', (select concept_id from concept where concept_name='Clinical Class'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Claims Attachments', 'Metadata', 'Concept Class', 'Concept Class', null, '3', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Claims Attachment', 'Claims Attachments', (select concept_id from concept where concept_name='Claims Attachments'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Surveys', 'Metadata', 'Concept Class', 'Concept Class', null, '4', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Survey', 'Surveys', (select concept_id from concept where concept_name='Surveys'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Answers', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Answer', 'Answers', (select concept_id from concept where concept_name='Answers'));

-- change LOINC Hierarchy concepts to 'C'
update concept 
set standard_concept='C' where concept_class_id='LOINC Hierarchy';

-- add new relationship between LOINC surveys etc. and answers
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Has Answer (LOINC)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Has Answer', 'Has Answer (LOINC)', 0, 0, 'Is a', (select concept_id from concept where concept_name='Has Answer (LOINC)'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Answer of (LOINC)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Answer of', 'Answer of (LOINC)', 0, 0, 'Answer of', (select concept_id from concept where concept_name='Answer of (LOINC)'));
update relationship -- The reverse wasn't in at the time of writing 'Has Answer'
set reverse_relationship_id='Answer of' where relationship_id='Has Answer';
update relationship -- The reverse wasn't in at the time of writing 'Has Answer'
set reverse_relationship_id='Has Answer' where relationship_id='Answer of';

-- Add new CPT4 concpet classes
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'CPT4 Modifier', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('CTP4 Modifier', 'CPT4 Modifier', (select concept_id from concept where concept_name='CPT4 Modifier'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'CPT4 Hierarchy', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('CTP4 Hierarchy', 'CPT4 Hierarchy', (select concept_id from concept where concept_name='CPT4 Hierarchy'));

-- Add new HCPCS concept classes
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'HCPCS Modifier', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('HCPCS Modifier', 'HCPCS Modifier', (select concept_id from concept where concept_name='HCPCS Modifier'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'HCPCS Class', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('HCPCS Class', 'HCPCS Class', (select concept_id from concept where concept_name='HCPCS Class'));

-- Add HCPCS class concepts
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Office visits - new', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M1A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Office visits - established', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M1B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Hospital visit - initial', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M2A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Hospital visit - subsequent', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M2B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Hospital visit - critical care', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M2C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Emergency room visit', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M3 ', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Home visit', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M4A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Nursing home visit', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'M4B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Specialist - pathology', 'Provider Specialty', 'HCPCS', 'HCPCS Class', 'C', 'M5A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Specialist - psychiatry', 'Provider Specialty', 'HCPCS', 'HCPCS Class', 'C', 'M5B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Specialist - opthamology', 'Provider Specialty', 'HCPCS', 'HCPCS Class', 'C', 'M5C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Specialist - other', 'Provider Specialty', 'HCPCS', 'HCPCS Class', 'C', 'M5D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Consultations', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'M6 ', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Anesthesia', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P0 ', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure - breast', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P1A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure - colectomy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P1B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure - cholecystectomy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P1C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure - turp', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P1D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure - hysterectomy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P1E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure - explor/decompr/excisdisc', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P1F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure - Other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P1G', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, cardiovascular-CABG', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P2A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, cardiovascular-Aneurysm repair', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P2B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major Procedure, cardiovascular-Thromboendarterectomy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P2C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, cardiovascualr-Coronary angioplasty (PTCA)', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P2D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, cardiovascular-Pacemaker insertion', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P2E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, cardiovascular-Other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P2F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, orthopedic - Hip fracture repair', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P3A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, orthopedic - Hip replacement', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P3B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, orthopedic - Knee replacement', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P3C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Major procedure, orthopedic - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P3D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Eye procedure - corneal transplant', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P4A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Eye procedure - cataract removal/lens insertion', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P4B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Eye procedure - retinal detachment', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P4C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Eye procedure - treatment of retinal lesions', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P4D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Eye procedure - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P4E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Ambulatory procedures - skin', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P5A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Ambulatory procedures - musculoskeletal', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P5B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Ambulatory procedures - inguinal hernia repair', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P5C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Ambulatory procedures - lithotripsy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P5D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Ambulatory procedures - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P5E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Minor procedures - skin', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P6A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Minor procedures - musculoskeletal', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P6B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Minor procedures - other (Medicare fee schedule)', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P6C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Minor procedures - other (non-Medicare fee schedule)', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P6D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Oncology - radiation therapy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P7A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Oncology - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P7B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - arthroscopy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - upper gastrointestinal', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - sigmoidoscopy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - colonoscopy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - cystoscopy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - bronchoscopy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - laparoscopic cholecystectomy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8G', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - laryngoscopy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8H', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Endoscopy - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P8I', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Dialysis services (medicare fee schedule)', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P9A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Dialysis services (non-medicare fee schedule)', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'P9B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Standard imaging - chest', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I1A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Standard imaging - musculoskeletal', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I1B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Standard imaging - breast', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I1C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Standard imaging - contrast gastrointestinal', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I1D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Standard imaging - nuclear medicine', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I1E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Standard imaging - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I1F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Advanced imaging - CAT/CT/CTA: brain/head/neck', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I2A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Advanced imaging - CAT/CT/CTA: other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I2B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Advanced imaging - MRI/MRA: brain/head/neck', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I2C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Advanced imaging - MRI/MRA: other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I2D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Echography/ultrasonography - eye', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I3A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Echography/ultrasonography - abdomen/pelvis', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I3B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Echography/ultrasonography - heart', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I3C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Echography/ultrasonography - carotid arteries', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I3D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Echography/ultrasonography - prostate, transrectal', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I3E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Echography/ultrasonography - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I3F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Imaging/procedure - heart including cardiac catheterization', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I4A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Imaging/procedure - other', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'I4B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - routine venipuncture (non Medicare fee schedule)', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - automated general profiles', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - urinalysis', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - blood counts', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - glucose', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - bacterial cultures', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - other (Medicare fee schedule)', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1G', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Lab tests - other (non-Medicare fee schedule)', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T1H', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other tests - electrocardiograms', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T2A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other tests - cardiovascular stress tests', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T2B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other tests - EKG monitoring', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T2C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other tests - other', 'Measurement', 'HCPCS', 'HCPCS Class', 'C', 'T2D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Medical/surgical supplies', 'Device', 'HCPCS', 'HCPCS Class', 'C', 'D1A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Hospital beds', 'Device', 'HCPCS', 'HCPCS Class', 'C', 'D1B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Oxygen and supplies', 'Device', 'HCPCS', 'HCPCS Class', 'C', 'D1C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Wheelchairs', 'Device', 'HCPCS', 'HCPCS Class', 'C', 'D1D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other DME', 'Device', 'HCPCS', 'HCPCS Class', 'C', 'D1E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Prosthetic/Orthotic devices', 'Device', 'HCPCS', 'HCPCS Class', 'C', 'D1F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Drugs Administered through DME', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'D1G', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Ambulance', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'O1A', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Chiropractic', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'O1B', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Enteral and parenteral', 'Device', 'HCPCS', 'HCPCS Class', 'C', 'O1C', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Chemotherapy', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'O1D', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other drugs', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'O1E', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Hearing and speech services', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'O1F', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Immunizations/Vaccinations', 'Procedure', 'HCPCS', 'HCPCS Class', 'C', 'O1G', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other - Medicare fee schedule', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'Y1 ', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Other - non-Medicare fee schedule', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'Y2 ', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Local codes', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'Z1 ', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Undefined codes', 'Observation', 'HCPCS', 'HCPCS Class', 'C', 'Z2 ', '01-JAN-1970', '31-DEC-2099', null);

-- Add new SNOMED concept classes
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Navigational Concept', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Navi Concept', 'Navigational Concept', (select concept_id from concept where concept_name='Navigational Concept'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Inactive Concept', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Inactive Concept', 'Inactive Concept', (select concept_id from concept where concept_name='Inactive Concept'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Linkage Concept', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Linkage Concept', 'Linkage Concept', (select concept_id from concept where concept_name='Linkage Concept'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Link Assertion', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Link Assertion', 'Link Assertion', (select concept_id from concept where concept_name='Link Assertion'));

-- Fix existing SNOMED concept classes
update concept set concept_name='Situation with explicit context' where concept_id=44819051;
update concept_class set concept_class_name='Situation with explicit context' where concept_class_concept_id=44819051;

-- Fix Rimma's PCORNet null flavors. Leave only the Hispanic ones alive
update concept set concept_name='Other' where concept_id=44814649; -- rename from 'Hispanic - other'
update concept set concept_class_id='Undefined' where concept_id=44814649; -- give generic concept class
update concept set concept_name='Unknown' where concept_id=44814653; -- rename from 'Hispanic - unknown'
update concept set concept_class_id='Undefined' where concept_id=44814653; -- give generic concept class
update concept set concept_name='No information' where concept_id=44814650; -- rename from 'Hispanic - no information'
update concept set concept_class_id='Undefined' where concept_id=44814650; -- give generic concept class
update concept set valid_end_date='30-Nov-2014', invalid_reason='D' where concept_id in (44814688, 44814668, 44814713, 44814683, 44814662, 44814705); -- Unknown ones
update concept set valid_end_date='30-Nov-2014', invalid_reason='D' where concept_id in (44814669, 44814684, 44814714, 44814663, 44814689, 44814706); -- no information ones
update concept set valid_end_date='30-Nov-2014', invalid_reason='D' where concept_id in (44814667, 44814661, 44814682, 44814704, 44814712, 44814687); -- no information ones

-- Add PCORNet concpet classes and concepts that were not committed
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'DRG Type', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('DRG Type', 'DRG Type', (select concept_id from concept where concept_name='DRG Type'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Diagnosis Code Type', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Diagnosis Code Type', 'Diagnosis Code Type', (select concept_id from concept where concept_name='Diagnosis Code Type'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Diagnosis Type', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Diagnosis Type', 'Diagnosis Type', (select concept_id from concept where concept_name='Diagnosis Type'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Procedure Code Type', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Procedure Code Type', 'Procedure Code Type', (select concept_id from concept where concept_name='Procedure Code Type'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Vital Source', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Vital Source', 'Vital Source', (select concept_id from concept where concept_name='Vital Source'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Blood Pressure Position', 'Metadata', 'Concept Class', 'Concept Class', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into concept_class (concept_class_id, concept_class_name, concept_class_concept_id)
values ('Blood Pressure Pos', 'Blood Pressure Position', (select concept_id from concept where concept_name='Blood Pressure Position'));

insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819189, 'CMS-DRG', 'Observation', 'PCORNet', 'DRG Type', null, '01', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819190, 'MS-DRG', 'Observation', 'PCORNet', 'DRG Type', null, '02', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819191, 'No information', 'Observation', 'PCORNet', 'DRG Type', null, 'NI', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819192, 'Unknown', 'Observation', 'PCORNet', 'DRG Type', null, 'UN', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819193, 'Other', 'Observation', 'PCORNet', 'DRG Type', null, 'OT', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819194, 'ICD-9-CM', 'Observation', 'PCORNet', 'Diagnosis Code Type', null, '09', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819195, 'ICD-10-CM', 'Observation', 'PCORNet', 'Diagnosis Code Type', null, '10', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819196, 'ICD-11-CM', 'Observation', 'PCORNet', 'Diagnosis Code Type', null, '11', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819197, 'SNOMED CT', 'Observation', 'PCORNet', 'Diagnosis Code Type', null, 'SM', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819198, 'No information', 'Observation', 'PCORNet', 'Diagnosis Code Type', null, 'NI', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819199, 'Unknown', 'Observation', 'PCORNet', 'Diagnosis Code Type', null, 'UN', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819200, 'Other', 'Observation', 'PCORNet', 'Diagnosis Code Type', null, 'OT', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819201, 'Principal', 'Observation', 'PCORNet', 'Diagnosis Type', null, 'P', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819202, 'Secondary', 'Observation', 'PCORNet', 'Diagnosis Type', null, 'S', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819203, 'Unable to Classify', 'Observation', 'PCORNet', 'Diagnosis Type', null, 'X', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819204, 'No information', 'Observation', 'PCORNet', 'Diagnosis Type', null, 'NI', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819205, 'Unknown', 'Observation', 'PCORNet', 'Diagnosis Type', null, 'UN', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819206, 'Other', 'Observation', 'PCORNet', 'Diagnosis Type', null, 'OT', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819207, 'ICD-9-CM', 'Observation', 'PCORNet', 'Procedure Code Type', null, '09', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819208, 'ICD-10-PCS', 'Observation', 'PCORNet', 'Procedure Code Type', null, '10', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819209, 'ICD-11-PCS', 'Observation', 'PCORNet', 'Procedure Code Type', null, '11', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819210, 'CPT Category II', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'C2', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819211, 'CPT Category III', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'C3', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819212, 'CPT-4', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'C4', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819213, 'HCPCS Level III', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'H3', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819214, 'HCPCS', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'HC', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819215, 'LOINC', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'LC', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819216, 'NDC', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'ND', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819217, 'Revenue', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'RE', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819218, 'No information', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'NI', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819219, 'Unknown', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'UN', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819220, 'Other', 'Observation', 'PCORNet', 'Procedure Code Type', null, 'OT', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819221, 'Patient-reported', 'Observation', 'PCORNet', 'Vital Source', null, 'PR', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819222, 'Healthcare delivery setting', 'Observation', 'PCORNet', 'Vital Source', null, 'HC', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819223, 'No information', 'Observation', 'PCORNet', 'Vital Source', null, 'NI', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819224, 'Unknown', 'Observation', 'PCORNet', 'Vital Source', null, 'UN', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819225, 'Other', 'Observation', 'PCORNet', 'Vital Source', null, 'OT', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819226, 'Sitting', 'Observation', 'PCORNet', 'Blood Pressure Pos', null, '01', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819227, 'Standing', 'Observation', 'PCORNet', 'Blood Pressure Pos', null, '02', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819228, 'Supine', 'Observation', 'PCORNet', 'Blood Pressure Pos', null, '03', '01-Jan-1970', '31-Dec-1999', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819229, 'No information', 'Observation', 'PCORNet', 'Blood Pressure Pos', null, 'NI', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819230, 'Unknown', 'Observation', 'PCORNet', 'Blood Pressure Pos', null, 'UN', '01-Jan-1970', '30-Nov-2014', 'D');
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (44819231, 'Other', 'Observation', 'PCORNet', 'Blood Pressure Pos', null, 'OT', '01-Jan-1970', '30-Nov-2014', 'D');

-- add new relationship between SNOMED surveys etc. and answers
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Has Morphology (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Has morphology', 'Has Morphology (SNOMED)', 0, 0, 'Is a', (select concept_id from concept where concept_name='Has Morphology (SNOMED)'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Morphology of (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Morphology of', 'Morphology of (SNOMED)', 0, 0, 'Morphology of', (select concept_id from concept where concept_name='Morphology of (SNOMED)'));
update relationship -- The reverse wasn't in at the time of writing 'Has Morphology'
set reverse_relationship_id = 'Morphology of' where relationship_id='Has morphology';
update relationship -- The reverse wasn't in at the time of writing 'Has Morphology'
set reverse_relationship_id = 'Has morphology' where relationship_id='Morphology of';

insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Has Measured Component (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Has meas component', 'Has Measured Component (SNOMED)', 0, 0, 'Is a', (select concept_id from concept where concept_name='Has Measured Component (SNOMED)'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Measured Component of (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Meas component of', 'Measured Component of (SNOMED)', 0, 0, 'Has meas component', (select concept_id from concept where concept_name='Measured Component of (SNOMED)'));
update relationship -- The reverse wasn't in at the time of writing 'Has Measured Component'
set reverse_relationship_id = 'Meas component of' where relationship_id='Has meas component';

insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Caused by (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Caused by', 'Caused by (SNOMED)', 0, 0, 'Is a', (select concept_id from concept where concept_name='Caused by (SNOMED)'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Causes (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Causes', 'Causes (SNOMED)', 0, 0, 'Caused by', (select concept_id from concept where concept_name='Causes (SNOMED)'));
update relationship -- The reverse wasn't in at the time of writing 'Caused by'
set reverse_relationship_id='Causes' where relationship_id='Caused by';

insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Has Etiology (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Has etiology', 'Has Etiology (SNOMED)', 0, 0, 'Is a', (select concept_id from concept where concept_name='Has Etiology (SNOMED)'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Etiology of (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Etiology of', 'Etiology of (SNOMED)', 0, 0, 'Has etiology', (select concept_id from concept where concept_name='Etiology of (SNOMED)'));
update relationship -- The reverse wasn't in at the time of writing 'Has etiology'
set reverse_relationship_id='Etiology of' where relationship_id='Has etiology';

insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Has Stage (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Has stage', 'Has Stage (SNOMED)', 0, 0, 'Is a', (select concept_id from concept where concept_name='Has Stage (SNOMED)'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Stage of (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Stage of', 'Stage of (SNOMED)', 0, 0, 'Has stage', (select concept_id from concept where concept_name='Stage of (SNOMED)'));
update relationship -- The reverse wasn't in at the time of writing 'Has Stage'
set reverse_relationship_id='Stage of' where relationship_id='Has stage';

insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Has Extent (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Has extent', 'Has Extent (SNOMED)', 0, 0, 'Is a', (select concept_id from concept where concept_name='Has Extent (SNOMED)'));
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Extent of (SNOMED)', 'Metadata', 'Relationship', 'Relationship', null, 'OMOP generated', '01-JAN-1970', '31-DEC-2099', null);
insert into relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id)
values ('Extent of', 'Extent of (SNOMED)', 0, 0, 'Has extent', (select concept_id from concept where concept_name='Extent of (SNOMED)'));
update relationship -- The reverse wasn't in at the time of writing 'Has extent'
set reverse_relationship_id='Extent of' where relationship_id='Has extent';

commit;