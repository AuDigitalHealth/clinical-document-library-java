<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-PCEHR_Dispense_Record_1B_CDA_Narrative                         	SYSTEM 'templates/PCEHR_Dispense_Record_1B_CDA_Narrative.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_2_AdministrativeObservations_4           	SYSTEM 'templates/PCEHR_Dispense_Record_2_AdministrativeObservations_4.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_2_DispenseItem_MEDICATIONACTION_7_1_1    	SYSTEM 'templates/PCEHR_Dispense_Record_2_DispenseItem_MEDICATIONACTION_7_1_1.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_2_Global_Code_Checks_custom              	SYSTEM 'templates/PCEHR_Dispense_Record_2_Global_Code_Checks_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_2_PCEHRDispenseRecord_7_1                	SYSTEM 'templates/PCEHR_Dispense_Record_2_PCEHRDispenseRecord_7_1.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_ClinicalDocument_5_1                     	SYSTEM 'templates/PCEHR_Dispense_Record_ClinicalDocument_5_1.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_ClinicalDocument_5_1_custom              	SYSTEM 'templates/PCEHR_Dispense_Record_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_ClinicalDocument_6_1_custom              	SYSTEM 'templates/PCEHR_Dispense_Record_ClinicalDocument_6_1_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_Custodian_5_1_2                          	SYSTEM 'templates/PCEHR_Dispense_Record_Custodian_5_1_2.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_Custodian_5_1_2_custom                   	SYSTEM 'templates/PCEHR_Dispense_Record_Custodian_5_1_2_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_DataType_Global_Checks                   	SYSTEM 'templates/PCEHR_Dispense_Record_DataType_Global_Checks.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_Dispenser_6_1_2                          	SYSTEM 'templates/PCEHR_Dispense_Record_Dispenser_6_1_2.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_Dispenser_6_1_2_custom                   	SYSTEM 'templates/PCEHR_Dispense_Record_Dispenser_6_1_2_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_DispensingOrganisation_6_1_3             	SYSTEM 'templates/PCEHR_Dispense_Record_DispensingOrganisation_6_1_3.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_EncompassingEncounter_5_1_3              	SYSTEM 'templates/PCEHR_Dispense_Record_EncompassingEncounter_5_1_3.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_Entity_Identifier_Checks                 	SYSTEM 'templates/PCEHR_Dispense_Record_Entity_Identifier_Checks.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_Global_Checks                            	SYSTEM 'templates/PCEHR_Dispense_Record_Global_Checks.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_Global_Code_Checks_custom                	SYSTEM 'templates/PCEHR_Dispense_Record_Global_Code_Checks_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_HPI-I_Relaxed                            	SYSTEM 'templates/PCEHR_Dispense_Record_HPI-I_Relaxed.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_IHI_Common_Conformance_Requirements      	SYSTEM 'templates/PCEHR_Dispense_Record_IHI_Common_Conformance_Requirements.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_LegalAuthenticator_5_1_1                 	SYSTEM 'templates/PCEHR_Dispense_Record_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_LegalAuthenticator_5_1_1_custom          	SYSTEM 'templates/PCEHR_Dispense_Record_LegalAuthenticator_5_1_1_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_ParentDocument_5_1_4                     	SYSTEM 'templates/PCEHR_Dispense_Record_ParentDocument_5_1_4.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_ParentDocument_5_1_4_custom              	SYSTEM 'templates/PCEHR_Dispense_Record_ParentDocument_5_1_4_custom.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_PCEHRDispenseRecord_6_1                  	SYSTEM 'templates/PCEHR_Dispense_Record_PCEHRDispenseRecord_6_1.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_SubjectofCare_6_1_1                      	SYSTEM 'templates/PCEHR_Dispense_Record_SubjectofCare_6_1_1.ent'>
<!ENTITY ent-PCEHR_Dispense_Record_SubjectofCare_6_1_1_custom               	SYSTEM 'templates/PCEHR_Dispense_Record_SubjectofCare_6_1_1_custom.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 2 conformance to PCEHR Dispense Record CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-PCEHR_Dispense_Record_1B_CDA_Narrative-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_2_AdministrativeObservations_4-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_2_DispenseItem_MEDICATIONACTION_7_1_1-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_2_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_2_PCEHRDispenseRecord_7_1-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_ClinicalDocument_6_1_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_Custodian_5_1_2-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_Custodian_5_1_2_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_DataType_Global_Checks-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_Dispenser_6_1_2-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_Dispenser_6_1_2_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_DispensingOrganisation_6_1_3-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_EncompassingEncounter_5_1_3-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_Global_Checks-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_HPI-I_Relaxed-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_IHI_Common_Conformance_Requirements-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_LegalAuthenticator_5_1_1_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_ParentDocument_5_1_4-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_ParentDocument_5_1_4_custom-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_PCEHRDispenseRecord_6_1-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_SubjectofCare_6_1_1-errors"/>
	<active pattern = "p-PCEHR_Dispense_Record_SubjectofCare_6_1_1_custom-errors"/>


</phase>


	&ent-PCEHR_Dispense_Record_1B_CDA_Narrative;
	&ent-PCEHR_Dispense_Record_2_AdministrativeObservations_4;
	&ent-PCEHR_Dispense_Record_2_DispenseItem_MEDICATIONACTION_7_1_1;
	&ent-PCEHR_Dispense_Record_2_Global_Code_Checks_custom;
	&ent-PCEHR_Dispense_Record_2_PCEHRDispenseRecord_7_1;
	&ent-PCEHR_Dispense_Record_ClinicalDocument_5_1;
	&ent-PCEHR_Dispense_Record_ClinicalDocument_5_1_custom;
	&ent-PCEHR_Dispense_Record_ClinicalDocument_6_1_custom;
	&ent-PCEHR_Dispense_Record_Custodian_5_1_2;
	&ent-PCEHR_Dispense_Record_Custodian_5_1_2_custom;
	&ent-PCEHR_Dispense_Record_DataType_Global_Checks;
	&ent-PCEHR_Dispense_Record_Dispenser_6_1_2;
	&ent-PCEHR_Dispense_Record_Dispenser_6_1_2_custom;
	&ent-PCEHR_Dispense_Record_DispensingOrganisation_6_1_3;
	&ent-PCEHR_Dispense_Record_EncompassingEncounter_5_1_3;
	&ent-PCEHR_Dispense_Record_Entity_Identifier_Checks;
	&ent-PCEHR_Dispense_Record_Global_Checks;
	&ent-PCEHR_Dispense_Record_Global_Code_Checks_custom;
	&ent-PCEHR_Dispense_Record_HPI-I_Relaxed;
	&ent-PCEHR_Dispense_Record_IHI_Common_Conformance_Requirements;
	&ent-PCEHR_Dispense_Record_LegalAuthenticator_5_1_1;
	&ent-PCEHR_Dispense_Record_LegalAuthenticator_5_1_1_custom;
	&ent-PCEHR_Dispense_Record_ParentDocument_5_1_4;
	&ent-PCEHR_Dispense_Record_ParentDocument_5_1_4_custom;
	&ent-PCEHR_Dispense_Record_PCEHRDispenseRecord_6_1;
	&ent-PCEHR_Dispense_Record_SubjectofCare_6_1_1;
	&ent-PCEHR_Dispense_Record_SubjectofCare_6_1_1_custom;


</schema>
