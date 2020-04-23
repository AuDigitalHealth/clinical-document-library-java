<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-Pharmacist_Shared_Medicines_List_1A_CDA_Narrative_Only                                    	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_1A_CDA_Narrative_Only.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_CDA_Narrative_Nested_Sections                            	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_CDA_Narrative_Nested_Sections.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1                                     	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1_custom                              	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_CLINICALDOCUMENT_7_1                                     	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_CLINICALDOCUMENT_7_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Custodian_5_1_3                                          	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Custodian_5_1_3.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Custodian_5_1_3_custom                                   	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Custodian_5_1_3_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_DataType_Global_Checks                                   	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_DataType_Global_Checks.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1                          	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1_custom                   	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_DVA_File_Number_Checks                                   	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_DVA_File_Number_Checks.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Employment_Checks                                        	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Employment_Checks.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_ENCOUNTER_6_1_3                                          	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_ENCOUNTER_6_1_3.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Entity_Identifier_Checks                                 	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Entity_Identifier_Checks.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Global_Checks                                            	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Global_Checks.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Global_Checks_Exceptions_Option_04                       	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Global_Checks_Exceptions_Option_04.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_HEALTHCAREFACILITY_6_1_3_1                               	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_HEALTHCAREFACILITY_6_1_3_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2                               	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2_custom                        	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_LegalAuthenticator_5_1_1                                 	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Consumer_Part1               	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Consumer_Part1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_LA       	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_LA.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_Part1    	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_Part1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part1                         	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part2                         	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part2.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part3                         	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part3.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2                      	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2_custom               	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1                             	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1_custom                      	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_PARTICIPANT_6_1_4_custom                                 	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_PARTICIPANT_6_1_4_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Participation_Period                                     	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Participation_Period.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_SECTION_7_1_1                                            	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_SECTION_7_1_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_SECTION_7_1_1_custom                                     	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_SECTION_7_1_1_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1                                      	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1_custom                               	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Pharmacist_Shared_Medicines_List_Xml_Stylesheet_Exclusion                                 	SYSTEM 'templates/Pharmacist_Shared_Medicines_List_Xml_Stylesheet_Exclusion.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 1A conformance to Pharmacist Shared Medicines List CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-Pharmacist_Shared_Medicines_List_1A_CDA_Narrative_Only-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_CDA_Narrative_Nested_Sections-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_CLINICALDOCUMENT_7_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Custodian_5_1_3-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Custodian_5_1_3_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_DataType_Global_Checks-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_DVA_File_Number_Checks-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Employment_Checks-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_ENCOUNTER_6_1_3-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Global_Checks-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Global_Checks_Exceptions_Option_04-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_HEALTHCAREFACILITY_6_1_3_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Consumer_Part1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_LA-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_Part1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part2-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part3-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_PARTICIPANT_6_1_4_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Participation_Period-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_SECTION_7_1_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_SECTION_7_1_1_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Pharmacist_Shared_Medicines_List_Xml_Stylesheet_Exclusion-errors"/>


</phase>


	&ent-Pharmacist_Shared_Medicines_List_1A_CDA_Narrative_Only;
	&ent-Pharmacist_Shared_Medicines_List_CDA_Narrative_Nested_Sections;
	&ent-Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1;
	&ent-Pharmacist_Shared_Medicines_List_ClinicalDocument_5_1_custom;
	&ent-Pharmacist_Shared_Medicines_List_CLINICALDOCUMENT_7_1;
	&ent-Pharmacist_Shared_Medicines_List_Custodian_5_1_3;
	&ent-Pharmacist_Shared_Medicines_List_Custodian_5_1_3_custom;
	&ent-Pharmacist_Shared_Medicines_List_DataType_Global_Checks;
	&ent-Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1;
	&ent-Pharmacist_Shared_Medicines_List_DOCUMENTAUTHORasaPERSON_6_1_2_1_custom;
	&ent-Pharmacist_Shared_Medicines_List_DVA_File_Number_Checks;
	&ent-Pharmacist_Shared_Medicines_List_Employment_Checks;
	&ent-Pharmacist_Shared_Medicines_List_ENCOUNTER_6_1_3;
	&ent-Pharmacist_Shared_Medicines_List_Entity_Identifier_Checks;
	&ent-Pharmacist_Shared_Medicines_List_Global_Checks;
	&ent-Pharmacist_Shared_Medicines_List_Global_Checks_Exceptions_Option_04;
	&ent-Pharmacist_Shared_Medicines_List_HEALTHCAREFACILITY_6_1_3_1;
	&ent-Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2;
	&ent-Pharmacist_Shared_Medicines_List_InformationRecipient_5_1_2_custom;
	&ent-Pharmacist_Shared_Medicines_List_LegalAuthenticator_5_1_1;
	&ent-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Consumer_Part1;
	&ent-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_LA;
	&ent-Pharmacist_Shared_Medicines_List_Local_Identifier_Healthcare_Provider_Individual_Part1;
	&ent-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part1;
	&ent-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part2;
	&ent-Pharmacist_Shared_Medicines_List_mediaType_Packaging_Checks_Part3;
	&ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2;
	&ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasanORGANISATION_6_1_4_2_custom;
	&ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1;
	&ent-Pharmacist_Shared_Medicines_List_PARTICIPANTasaPERSON_6_1_4_1_custom;
	&ent-Pharmacist_Shared_Medicines_List_PARTICIPANT_6_1_4_custom;
	&ent-Pharmacist_Shared_Medicines_List_Participation_Period;
	&ent-Pharmacist_Shared_Medicines_List_SECTION_7_1_1;
	&ent-Pharmacist_Shared_Medicines_List_SECTION_7_1_1_custom;
	&ent-Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1;
	&ent-Pharmacist_Shared_Medicines_List_SUBJECTOFCARE_6_1_1_custom;
	&ent-Pharmacist_Shared_Medicines_List_Xml_Stylesheet_Exclusion;


</schema>
