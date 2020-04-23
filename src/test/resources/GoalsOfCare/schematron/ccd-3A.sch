<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-Goals_of_Care_1B_CDA_Narrative                                                  	SYSTEM 'templates/Goals_of_Care_1B_CDA_Narrative.ent'>
<!ENTITY ent-Goals_of_Care_1B_CDA_Narrative_Nested_Sections                                  	SYSTEM 'templates/Goals_of_Care_1B_CDA_Narrative_Nested_Sections.ent'>
<!ENTITY ent-Goals_of_Care_2_AdministrativeObservations_4                                    	SYSTEM 'templates/Goals_of_Care_2_AdministrativeObservations_4.ent'>
<!ENTITY ent-Goals_of_Care_2_ADVANCECAREINFORMATIONSECTION_7_1_1                             	SYSTEM 'templates/Goals_of_Care_2_ADVANCECAREINFORMATIONSECTION_7_1_1.ent'>
<!ENTITY ent-Goals_of_Care_2_ADVANCECAREINFORMATION_7_1                                      	SYSTEM 'templates/Goals_of_Care_2_ADVANCECAREINFORMATION_7_1.ent'>
<!ENTITY ent-Goals_of_Care_2_Global_Optional_Code_Checks_custom                              	SYSTEM 'templates/Goals_of_Care_2_Global_Optional_Code_Checks_custom.ent'>
<!ENTITY ent-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2             	SYSTEM 'templates/Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2.ent'>
<!ENTITY ent-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom1     	SYSTEM 'templates/Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom1.ent'>
<!ENTITY ent-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom2     	SYSTEM 'templates/Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom2.ent'>
<!ENTITY ent-Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1                                       	SYSTEM 'templates/Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1.ent'>
<!ENTITY ent-Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom                                	SYSTEM 'templates/Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom.ent'>
<!ENTITY ent-Goals_of_Care_3A_Global_Optional_Code_Checks_custom                             	SYSTEM 'templates/Goals_of_Care_3A_Global_Optional_Code_Checks_custom.ent'>
<!ENTITY ent-Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1                                        	SYSTEM 'templates/Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1.ent'>
<!ENTITY ent-Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1_custom                                 	SYSTEM 'templates/Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1_custom.ent'>
<!ENTITY ent-Goals_of_Care_3A_SUBJECTOFCARE_6_1_1                                            	SYSTEM 'templates/Goals_of_Care_3A_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Goals_of_Care_3A_SUBJECTOFCARE_6_1_1_custom                                     	SYSTEM 'templates/Goals_of_Care_3A_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Goals_of_Care_ANZSCO_Checks_Revision1                                           	SYSTEM 'templates/Goals_of_Care_ANZSCO_Checks_Revision1.ent'>
<!ENTITY ent-Goals_of_Care_ClinicalDocument_5_1                                              	SYSTEM 'templates/Goals_of_Care_ClinicalDocument_5_1.ent'>
<!ENTITY ent-Goals_of_Care_ClinicalDocument_5_1_custom                                       	SYSTEM 'templates/Goals_of_Care_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-Goals_of_Care_Custodian_5_1_2                                                   	SYSTEM 'templates/Goals_of_Care_Custodian_5_1_2.ent'>
<!ENTITY ent-Goals_of_Care_Custodian_5_1_2_custom                                            	SYSTEM 'templates/Goals_of_Care_Custodian_5_1_2_custom.ent'>
<!ENTITY ent-Goals_of_Care_DataType_Global_Checks                                            	SYSTEM 'templates/Goals_of_Care_DataType_Global_Checks.ent'>
<!ENTITY ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2                	SYSTEM 'templates/Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2.ent'>
<!ENTITY ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom         	SYSTEM 'templates/Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom.ent'>
<!ENTITY ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1            	SYSTEM 'templates/Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1.ent'>
<!ENTITY ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom1    	SYSTEM 'templates/Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom1.ent'>
<!ENTITY ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom2    	SYSTEM 'templates/Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom2.ent'>
<!ENTITY ent-Goals_of_Care_DOCUMENTAUTHOR_6_1_2_1or6_1_2_2                                   	SYSTEM 'templates/Goals_of_Care_DOCUMENTAUTHOR_6_1_2_1or6_1_2_2.ent'>
<!ENTITY ent-Goals_of_Care_DVA_File_Number_Checks                                            	SYSTEM 'templates/Goals_of_Care_DVA_File_Number_Checks.ent'>
<!ENTITY ent-Goals_of_Care_Entity_Identifier_Checks                                          	SYSTEM 'templates/Goals_of_Care_Entity_Identifier_Checks.ent'>
<!ENTITY ent-Goals_of_Care_Global_Checks                                                     	SYSTEM 'templates/Goals_of_Care_Global_Checks.ent'>
<!ENTITY ent-Goals_of_Care_Global_Checks_Exceptions_Option_04                                	SYSTEM 'templates/Goals_of_Care_Global_Checks_Exceptions_Option_04.ent'>
<!ENTITY ent-Goals_of_Care_HPI-I_Enforced                                                    	SYSTEM 'templates/Goals_of_Care_HPI-I_Enforced.ent'>
<!ENTITY ent-Goals_of_Care_LegalAuthenticator_5_1_1                                          	SYSTEM 'templates/Goals_of_Care_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part0                        	SYSTEM 'templates/Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part0.ent'>
<!ENTITY ent-Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part1                        	SYSTEM 'templates/Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part1.ent'>
<!ENTITY ent-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Author            	SYSTEM 'templates/Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Author.ent'>
<!ENTITY ent-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_LA                	SYSTEM 'templates/Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_LA.ent'>
<!ENTITY ent-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Part1             	SYSTEM 'templates/Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Part1.ent'>
<!ENTITY ent-Goals_of_Care_mediaType_Additional_Checks                                       	SYSTEM 'templates/Goals_of_Care_mediaType_Additional_Checks.ent'>
<!ENTITY ent-Goals_of_Care_My_Health_Record_Conformance_Profile_v1_0_custom                  	SYSTEM 'templates/Goals_of_Care_My_Health_Record_Conformance_Profile_v1_0_custom.ent'>
<!ENTITY ent-Goals_of_Care_Packaging_Requirements                                            	SYSTEM 'templates/Goals_of_Care_Packaging_Requirements.ent'>
<!ENTITY ent-Goals_of_Care_Participation_Period                                              	SYSTEM 'templates/Goals_of_Care_Participation_Period.ent'>
<!ENTITY ent-Goals_of_Care_SUBJECTOFCARE_6_1_1                                               	SYSTEM 'templates/Goals_of_Care_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Goals_of_Care_SUBJECTOFCARE_6_1_1_custom                                        	SYSTEM 'templates/Goals_of_Care_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Goals_of_Care_Xml_Stylesheet_Exclusion                                          	SYSTEM 'templates/Goals_of_Care_Xml_Stylesheet_Exclusion.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 3A conformance to Goals of Care CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-Goals_of_Care_1B_CDA_Narrative-errors"/>
	<active pattern = "p-Goals_of_Care_1B_CDA_Narrative_Nested_Sections-errors"/>
	<active pattern = "p-Goals_of_Care_2_AdministrativeObservations_4-errors"/>
	<active pattern = "p-Goals_of_Care_2_ADVANCECAREINFORMATIONSECTION_7_1_1-errors"/>
	<active pattern = "p-Goals_of_Care_2_ADVANCECAREINFORMATION_7_1-errors"/>
	<active pattern = "p-Goals_of_Care_2_Global_Optional_Code_Checks_custom-errors"/>
	<active pattern = "p-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2-errors"/>
	<active pattern = "p-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom1-errors"/>
	<active pattern = "p-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom2-errors"/>
	<active pattern = "p-Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1-errors"/>
	<active pattern = "p-Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom-errors"/>
	<active pattern = "p-Goals_of_Care_3A_Global_Optional_Code_Checks_custom-errors"/>
	<active pattern = "p-Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1-errors"/>
	<active pattern = "p-Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1_custom-errors"/>
	<active pattern = "p-Goals_of_Care_3A_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Goals_of_Care_3A_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Goals_of_Care_ANZSCO_Checks_Revision1-errors"/>
	<active pattern = "p-Goals_of_Care_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-Goals_of_Care_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-Goals_of_Care_Custodian_5_1_2-errors"/>
	<active pattern = "p-Goals_of_Care_Custodian_5_1_2_custom-errors"/>
	<active pattern = "p-Goals_of_Care_DataType_Global_Checks-errors"/>
	<active pattern = "p-Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2-errors"/>
	<active pattern = "p-Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom-errors"/>
	<active pattern = "p-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1-errors"/>
	<active pattern = "p-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom1-errors"/>
	<active pattern = "p-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom2-errors"/>
	<active pattern = "p-Goals_of_Care_DOCUMENTAUTHOR_6_1_2_1or6_1_2_2-errors"/>
	<active pattern = "p-Goals_of_Care_DVA_File_Number_Checks-errors"/>
	<active pattern = "p-Goals_of_Care_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-Goals_of_Care_Global_Checks-errors"/>
	<active pattern = "p-Goals_of_Care_Global_Checks_Exceptions_Option_04-errors"/>
	<active pattern = "p-Goals_of_Care_HPI-I_Enforced-errors"/>
	<active pattern = "p-Goals_of_Care_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part0-errors"/>
	<active pattern = "p-Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part1-errors"/>
	<active pattern = "p-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Author-errors"/>
	<active pattern = "p-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_LA-errors"/>
	<active pattern = "p-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Part1-errors"/>
	<active pattern = "p-Goals_of_Care_mediaType_Additional_Checks-errors"/>
	<active pattern = "p-Goals_of_Care_My_Health_Record_Conformance_Profile_v1_0_custom-errors"/>
	<active pattern = "p-Goals_of_Care_Packaging_Requirements-errors"/>
	<active pattern = "p-Goals_of_Care_Participation_Period-errors"/>
	<active pattern = "p-Goals_of_Care_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Goals_of_Care_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Goals_of_Care_Xml_Stylesheet_Exclusion-errors"/>


</phase>


	&ent-Goals_of_Care_1B_CDA_Narrative;
	&ent-Goals_of_Care_1B_CDA_Narrative_Nested_Sections;
	&ent-Goals_of_Care_2_AdministrativeObservations_4;
	&ent-Goals_of_Care_2_ADVANCECAREINFORMATIONSECTION_7_1_1;
	&ent-Goals_of_Care_2_ADVANCECAREINFORMATION_7_1;
	&ent-Goals_of_Care_2_Global_Optional_Code_Checks_custom;
	&ent-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2;
	&ent-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom1;
	&ent-Goals_of_Care_3A_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom2;
	&ent-Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1;
	&ent-Goals_of_Care_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom;
	&ent-Goals_of_Care_3A_Global_Optional_Code_Checks_custom;
	&ent-Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1;
	&ent-Goals_of_Care_3A_RELATEDDOCUMENT_7_1_1_1_custom;
	&ent-Goals_of_Care_3A_SUBJECTOFCARE_6_1_1;
	&ent-Goals_of_Care_3A_SUBJECTOFCARE_6_1_1_custom;
	&ent-Goals_of_Care_ANZSCO_Checks_Revision1;
	&ent-Goals_of_Care_ClinicalDocument_5_1;
	&ent-Goals_of_Care_ClinicalDocument_5_1_custom;
	&ent-Goals_of_Care_Custodian_5_1_2;
	&ent-Goals_of_Care_Custodian_5_1_2_custom;
	&ent-Goals_of_Care_DataType_Global_Checks;
	&ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2;
	&ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-HealthcareProvider_6_1_2_2_custom;
	&ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1;
	&ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom1;
	&ent-Goals_of_Care_DOCUMENTAUTHORasaPERSON-NotaHealthcareProvider_6_1_2_1_custom2;
	&ent-Goals_of_Care_DOCUMENTAUTHOR_6_1_2_1or6_1_2_2;
	&ent-Goals_of_Care_DVA_File_Number_Checks;
	&ent-Goals_of_Care_Entity_Identifier_Checks;
	&ent-Goals_of_Care_Global_Checks;
	&ent-Goals_of_Care_Global_Checks_Exceptions_Option_04;
	&ent-Goals_of_Care_HPI-I_Enforced;
	&ent-Goals_of_Care_LegalAuthenticator_5_1_1;
	&ent-Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part0;
	&ent-Goals_of_Care_Local_Identifier_Healthcare_Consumer_Part1;
	&ent-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Author;
	&ent-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_LA;
	&ent-Goals_of_Care_Local_Identifier_Healthcare_Provider_Individual_Part1;
	&ent-Goals_of_Care_mediaType_Additional_Checks;
	&ent-Goals_of_Care_My_Health_Record_Conformance_Profile_v1_0_custom;
	&ent-Goals_of_Care_Packaging_Requirements;
	&ent-Goals_of_Care_Participation_Period;
	&ent-Goals_of_Care_SUBJECTOFCARE_6_1_1;
	&ent-Goals_of_Care_SUBJECTOFCARE_6_1_1_custom;
	&ent-Goals_of_Care_Xml_Stylesheet_Exclusion;


</schema>
