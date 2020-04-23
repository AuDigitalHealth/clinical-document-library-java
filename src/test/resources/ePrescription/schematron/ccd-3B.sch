<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-e-Prescription_1B_CDA_Narrative                                   	SYSTEM 'templates/e-Prescription_1B_CDA_Narrative.ent'>
<!ENTITY ent-e-Prescription_2_AdministrativeObservations_5                     	SYSTEM 'templates/e-Prescription_2_AdministrativeObservations_5.ent'>
<!ENTITY ent-e-Prescription_2_e-Prescription_8_1                               	SYSTEM 'templates/e-Prescription_2_e-Prescription_8_1.ent'>
<!ENTITY ent-e-Prescription_2_Global_Code_Checks_custom                        	SYSTEM 'templates/e-Prescription_2_Global_Code_Checks_custom.ent'>
<!ENTITY ent-e-Prescription_2_Observations_8_3                                 	SYSTEM 'templates/e-Prescription_2_Observations_8_3.ent'>
<!ENTITY ent-e-Prescription_2_Prescriptionitem_8_2                             	SYSTEM 'templates/e-Prescription_2_Prescriptionitem_8_2.ent'>
<!ENTITY ent-e-Prescription_3A_Bodyheight_8_5                                  	SYSTEM 'templates/e-Prescription_3A_Bodyheight_8_5.ent'>
<!ENTITY ent-e-Prescription_3A_Bodyweight_8_4                                  	SYSTEM 'templates/e-Prescription_3A_Bodyweight_8_4.ent'>
<!ENTITY ent-e-Prescription_3A_CommonSectionsEntitlement_7_3AND7_4             	SYSTEM 'templates/e-Prescription_3A_CommonSectionsEntitlement_7_3AND7_4.ent'>
<!ENTITY ent-e-Prescription_3A_CommonSectionsEntitlement_7_3and7_4_custom      	SYSTEM 'templates/e-Prescription_3A_CommonSectionsEntitlement_7_3and7_4_custom.ent'>
<!ENTITY ent-e-Prescription_3A_Global_Code_Checks_custom                       	SYSTEM 'templates/e-Prescription_3A_Global_Code_Checks_custom.ent'>
<!ENTITY ent-e-Prescription_3A_Prescriptionitem_8_2                            	SYSTEM 'templates/e-Prescription_3A_Prescriptionitem_8_2.ent'>
<!ENTITY ent-e-Prescription_3A_Prescriptionitem_8_2_custom                     	SYSTEM 'templates/e-Prescription_3A_Prescriptionitem_8_2_custom.ent'>
<!ENTITY ent-e-Prescription_3A_Prescriptionnotedetail_8_6                      	SYSTEM 'templates/e-Prescription_3A_Prescriptionnotedetail_8_6.ent'>
<!ENTITY ent-e-Prescription_3A_Subjectofcare_7_2                               	SYSTEM 'templates/e-Prescription_3A_Subjectofcare_7_2.ent'>
<!ENTITY ent-e-Prescription_3A_Subjectofcare_7_2_custom                        	SYSTEM 'templates/e-Prescription_3A_Subjectofcare_7_2_custom.ent'>
<!ENTITY ent-e-Prescription_3B_SNOMED_AMT_Attributes                           	SYSTEM 'templates/e-Prescription_3B_SNOMED_AMT_Attributes.ent'>
<!ENTITY ent-e-Prescription_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks    	SYSTEM 'templates/e-Prescription_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks.ent'>
<!ENTITY ent-e-Prescription_ClinicalDocument_6_2                               	SYSTEM 'templates/e-Prescription_ClinicalDocument_6_2.ent'>
<!ENTITY ent-e-Prescription_ClinicalDocument_6_2_custom                        	SYSTEM 'templates/e-Prescription_ClinicalDocument_6_2_custom.ent'>
<!ENTITY ent-e-Prescription_Custodian_6_4                                      	SYSTEM 'templates/e-Prescription_Custodian_6_4.ent'>
<!ENTITY ent-e-Prescription_DataType_Global_Checks                             	SYSTEM 'templates/e-Prescription_DataType_Global_Checks.ent'>
<!ENTITY ent-e-Prescription_e-Prescription_7_1                                 	SYSTEM 'templates/e-Prescription_e-Prescription_7_1.ent'>
<!ENTITY ent-e-Prescription_EncompassingEncounter_6_5                          	SYSTEM 'templates/e-Prescription_EncompassingEncounter_6_5.ent'>
<!ENTITY ent-e-Prescription_Entity_Identifier_Checks                           	SYSTEM 'templates/e-Prescription_Entity_Identifier_Checks.ent'>
<!ENTITY ent-e-Prescription_Global_Checks                                      	SYSTEM 'templates/e-Prescription_Global_Checks.ent'>
<!ENTITY ent-e-Prescription_Global_Code_Checks_custom                          	SYSTEM 'templates/e-Prescription_Global_Code_Checks_custom.ent'>
<!ENTITY ent-e-Prescription_LegalAuthenticator_6_3                             	SYSTEM 'templates/e-Prescription_LegalAuthenticator_6_3.ent'>
<!ENTITY ent-e-Prescription_LOINC_Codes_Checks                                 	SYSTEM 'templates/e-Prescription_LOINC_Codes_Checks.ent'>
<!ENTITY ent-e-Prescription_Prescriberorganisation_7_4                         	SYSTEM 'templates/e-Prescription_Prescriberorganisation_7_4.ent'>
<!ENTITY ent-e-Prescription_PrescriberOrganisation_7_4_custom                  	SYSTEM 'templates/e-Prescription_PrescriberOrganisation_7_4_custom.ent'>
<!ENTITY ent-e-Prescription_Prescriber_7_3                                     	SYSTEM 'templates/e-Prescription_Prescriber_7_3.ent'>
<!ENTITY ent-e-Prescription_Prescriber_7_3_custom                              	SYSTEM 'templates/e-Prescription_Prescriber_7_3_custom.ent'>
<!ENTITY ent-e-Prescription_Subjectofcare_7_2                                  	SYSTEM 'templates/e-Prescription_Subjectofcare_7_2.ent'>
<!ENTITY ent-e-Prescription_Subjectofcare_7_2_custom                           	SYSTEM 'templates/e-Prescription_Subjectofcare_7_2_custom.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 3B conformance to e-Prescription CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-e-Prescription_1B_CDA_Narrative-errors"/>
	<active pattern = "p-e-Prescription_2_AdministrativeObservations_5-errors"/>
	<active pattern = "p-e-Prescription_2_e-Prescription_8_1-errors"/>
	<active pattern = "p-e-Prescription_2_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-e-Prescription_2_Observations_8_3-errors"/>
	<active pattern = "p-e-Prescription_2_Prescriptionitem_8_2-errors"/>
	<active pattern = "p-e-Prescription_3A_Bodyheight_8_5-errors"/>
	<active pattern = "p-e-Prescription_3A_Bodyweight_8_4-errors"/>
	<active pattern = "p-e-Prescription_3A_CommonSectionsEntitlement_7_3AND7_4-errors"/>
	<active pattern = "p-e-Prescription_3A_CommonSectionsEntitlement_7_3and7_4_custom-errors"/>
	<active pattern = "p-e-Prescription_3A_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-e-Prescription_3A_Prescriptionitem_8_2-errors"/>
	<active pattern = "p-e-Prescription_3A_Prescriptionitem_8_2_custom-errors"/>
	<active pattern = "p-e-Prescription_3A_Prescriptionnotedetail_8_6-errors"/>
	<active pattern = "p-e-Prescription_3A_Subjectofcare_7_2-errors"/>
	<active pattern = "p-e-Prescription_3A_Subjectofcare_7_2_custom-errors"/>
	<active pattern = "p-e-Prescription_3B_SNOMED_AMT_Attributes-errors"/>
	<active pattern = "p-e-Prescription_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks-errors"/>
	<active pattern = "p-e-Prescription_ClinicalDocument_6_2-errors"/>
	<active pattern = "p-e-Prescription_ClinicalDocument_6_2_custom-errors"/>
	<active pattern = "p-e-Prescription_Custodian_6_4-errors"/>
	<active pattern = "p-e-Prescription_DataType_Global_Checks-errors"/>
	<active pattern = "p-e-Prescription_e-Prescription_7_1-errors"/>
	<active pattern = "p-e-Prescription_EncompassingEncounter_6_5-errors"/>
	<active pattern = "p-e-Prescription_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-e-Prescription_Global_Checks-errors"/>
	<active pattern = "p-e-Prescription_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-e-Prescription_LegalAuthenticator_6_3-errors"/>
	<active pattern = "p-e-Prescription_LOINC_Codes_Checks-errors"/>
	<active pattern = "p-e-Prescription_Prescriberorganisation_7_4-errors"/>
	<active pattern = "p-e-Prescription_PrescriberOrganisation_7_4_custom-errors"/>
	<active pattern = "p-e-Prescription_Prescriber_7_3-errors"/>
	<active pattern = "p-e-Prescription_Prescriber_7_3_custom-errors"/>
	<active pattern = "p-e-Prescription_Subjectofcare_7_2-errors"/>
	<active pattern = "p-e-Prescription_Subjectofcare_7_2_custom-errors"/>


</phase>


	&ent-e-Prescription_1B_CDA_Narrative;
	&ent-e-Prescription_2_AdministrativeObservations_5;
	&ent-e-Prescription_2_e-Prescription_8_1;
	&ent-e-Prescription_2_Global_Code_Checks_custom;
	&ent-e-Prescription_2_Observations_8_3;
	&ent-e-Prescription_2_Prescriptionitem_8_2;
	&ent-e-Prescription_3A_Bodyheight_8_5;
	&ent-e-Prescription_3A_Bodyweight_8_4;
	&ent-e-Prescription_3A_CommonSectionsEntitlement_7_3AND7_4;
	&ent-e-Prescription_3A_CommonSectionsEntitlement_7_3and7_4_custom;
	&ent-e-Prescription_3A_Global_Code_Checks_custom;
	&ent-e-Prescription_3A_Prescriptionitem_8_2;
	&ent-e-Prescription_3A_Prescriptionitem_8_2_custom;
	&ent-e-Prescription_3A_Prescriptionnotedetail_8_6;
	&ent-e-Prescription_3A_Subjectofcare_7_2;
	&ent-e-Prescription_3A_Subjectofcare_7_2_custom;
	&ent-e-Prescription_3B_SNOMED_AMT_Attributes;
	&ent-e-Prescription_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks;
	&ent-e-Prescription_ClinicalDocument_6_2;
	&ent-e-Prescription_ClinicalDocument_6_2_custom;
	&ent-e-Prescription_Custodian_6_4;
	&ent-e-Prescription_DataType_Global_Checks;
	&ent-e-Prescription_e-Prescription_7_1;
	&ent-e-Prescription_EncompassingEncounter_6_5;
	&ent-e-Prescription_Entity_Identifier_Checks;
	&ent-e-Prescription_Global_Checks;
	&ent-e-Prescription_Global_Code_Checks_custom;
	&ent-e-Prescription_LegalAuthenticator_6_3;
	&ent-e-Prescription_LOINC_Codes_Checks;
	&ent-e-Prescription_Prescriberorganisation_7_4;
	&ent-e-Prescription_PrescriberOrganisation_7_4_custom;
	&ent-e-Prescription_Prescriber_7_3;
	&ent-e-Prescription_Prescriber_7_3_custom;
	&ent-e-Prescription_Subjectofcare_7_2;
	&ent-e-Prescription_Subjectofcare_7_2_custom;


</schema>
