<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-Dispense_Record_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks    	SYSTEM 'templates/Dispense_Record_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks.ent'>
<!ENTITY ent-Dispense_Record_ClinicalDocument_6_2                               	SYSTEM 'templates/Dispense_Record_ClinicalDocument_6_2.ent'>
<!ENTITY ent-Dispense_Record_ClinicalDocument_6_2_custom                        	SYSTEM 'templates/Dispense_Record_ClinicalDocument_6_2_custom.ent'>
<!ENTITY ent-Dispense_Record_Custodian_6_4                                      	SYSTEM 'templates/Dispense_Record_Custodian_6_4.ent'>
<!ENTITY ent-Dispense_Record_DataType_Global_Checks                             	SYSTEM 'templates/Dispense_Record_DataType_Global_Checks.ent'>
<!ENTITY ent-Dispense_Record_DispenseRecord_8_1                                 	SYSTEM 'templates/Dispense_Record_DispenseRecord_8_1.ent'>
<!ENTITY ent-Dispense_Record_Dispenser_7_3                                      	SYSTEM 'templates/Dispense_Record_Dispenser_7_3.ent'>
<!ENTITY ent-Dispense_Record_DispensingOrganization_7_4                         	SYSTEM 'templates/Dispense_Record_DispensingOrganization_7_4.ent'>
<!ENTITY ent-Dispense_Record_DispensingOrganization_7_4_custom                  	SYSTEM 'templates/Dispense_Record_DispensingOrganization_7_4_custom.ent'>
<!ENTITY ent-Dispense_Record_EncompassingEncounter_6_5                          	SYSTEM 'templates/Dispense_Record_EncompassingEncounter_6_5.ent'>
<!ENTITY ent-Dispense_Record_Entity_Identifier_Checks                           	SYSTEM 'templates/Dispense_Record_Entity_Identifier_Checks.ent'>
<!ENTITY ent-Dispense_Record_Global_Checks                                      	SYSTEM 'templates/Dispense_Record_Global_Checks.ent'>
<!ENTITY ent-Dispense_Record_Global_Code_Checks_custom                          	SYSTEM 'templates/Dispense_Record_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Dispense_Record_LegalAuthenticator_6_3                             	SYSTEM 'templates/Dispense_Record_LegalAuthenticator_6_3.ent'>
<!ENTITY ent-Dispense_Record_LOINC_Codes_Checks                                 	SYSTEM 'templates/Dispense_Record_LOINC_Codes_Checks.ent'>
<!ENTITY ent-Dispense_Record_SubjectofCare_7_2                                  	SYSTEM 'templates/Dispense_Record_SubjectofCare_7_2.ent'>
<!ENTITY ent-Dispense_Record_SubjectofCare_7_2_custom                           	SYSTEM 'templates/Dispense_Record_SubjectofCare_7_2_custom.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 1A conformance to Dispense Record CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-Dispense_Record_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks-errors"/>
	<active pattern = "p-Dispense_Record_ClinicalDocument_6_2-errors"/>
	<active pattern = "p-Dispense_Record_ClinicalDocument_6_2_custom-errors"/>
	<active pattern = "p-Dispense_Record_Custodian_6_4-errors"/>
	<active pattern = "p-Dispense_Record_DataType_Global_Checks-errors"/>
	<active pattern = "p-Dispense_Record_DispenseRecord_8_1-errors"/>
	<active pattern = "p-Dispense_Record_Dispenser_7_3-errors"/>
	<active pattern = "p-Dispense_Record_DispensingOrganization_7_4-errors"/>
	<active pattern = "p-Dispense_Record_DispensingOrganization_7_4_custom-errors"/>
	<active pattern = "p-Dispense_Record_EncompassingEncounter_6_5-errors"/>
	<active pattern = "p-Dispense_Record_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-Dispense_Record_Global_Checks-errors"/>
	<active pattern = "p-Dispense_Record_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Dispense_Record_LegalAuthenticator_6_3-errors"/>
	<active pattern = "p-Dispense_Record_LOINC_Codes_Checks-errors"/>
	<active pattern = "p-Dispense_Record_SubjectofCare_7_2-errors"/>
	<active pattern = "p-Dispense_Record_SubjectofCare_7_2_custom-errors"/>


</phase>


	&ent-Dispense_Record_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks;
	&ent-Dispense_Record_ClinicalDocument_6_2;
	&ent-Dispense_Record_ClinicalDocument_6_2_custom;
	&ent-Dispense_Record_Custodian_6_4;
	&ent-Dispense_Record_DataType_Global_Checks;
	&ent-Dispense_Record_DispenseRecord_8_1;
	&ent-Dispense_Record_Dispenser_7_3;
	&ent-Dispense_Record_DispensingOrganization_7_4;
	&ent-Dispense_Record_DispensingOrganization_7_4_custom;
	&ent-Dispense_Record_EncompassingEncounter_6_5;
	&ent-Dispense_Record_Entity_Identifier_Checks;
	&ent-Dispense_Record_Global_Checks;
	&ent-Dispense_Record_Global_Code_Checks_custom;
	&ent-Dispense_Record_LegalAuthenticator_6_3;
	&ent-Dispense_Record_LOINC_Codes_Checks;
	&ent-Dispense_Record_SubjectofCare_7_2;
	&ent-Dispense_Record_SubjectofCare_7_2_custom;


</schema>
