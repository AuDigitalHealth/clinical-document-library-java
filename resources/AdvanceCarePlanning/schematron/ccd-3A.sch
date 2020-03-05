<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-Advance_Care_Information_1B_CDA_Narrative                                                 	SYSTEM 'templates/Advance_Care_Information_1B_CDA_Narrative.ent'>
<!ENTITY ent-Advance_Care_Information_2_AdministrativeObservations_4                                   	SYSTEM 'templates/Advance_Care_Information_2_AdministrativeObservations_4.ent'>
<!ENTITY ent-Advance_Care_Information_2_ADVANCECAREINFORMATIONSECTION_7_1_1                            	SYSTEM 'templates/Advance_Care_Information_2_ADVANCECAREINFORMATIONSECTION_7_1_1.ent'>
<!ENTITY ent-Advance_Care_Information_2_ADVANCECAREINFORMATION_7_1                                     	SYSTEM 'templates/Advance_Care_Information_2_ADVANCECAREINFORMATION_7_1.ent'>
<!ENTITY ent-Advance_Care_Information_2_Global_Code_Checks_custom                                      	SYSTEM 'templates/Advance_Care_Information_2_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2            	SYSTEM 'templates/Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2.ent'>
<!ENTITY ent-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom1    	SYSTEM 'templates/Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom1.ent'>
<!ENTITY ent-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom2    	SYSTEM 'templates/Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom2.ent'>
<!ENTITY ent-Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1                                      	SYSTEM 'templates/Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1.ent'>
<!ENTITY ent-Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom                               	SYSTEM 'templates/Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom.ent'>
<!ENTITY ent-Advance_Care_Information_3A_Global_Checks                                                 	SYSTEM 'templates/Advance_Care_Information_3A_Global_Checks.ent'>
<!ENTITY ent-Advance_Care_Information_3A_Global_Code_Checks_custom                                     	SYSTEM 'templates/Advance_Care_Information_3A_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1                                       	SYSTEM 'templates/Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1.ent'>
<!ENTITY ent-Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1_custom                                	SYSTEM 'templates/Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1_custom.ent'>
<!ENTITY ent-Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1                                           	SYSTEM 'templates/Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1_custom                                    	SYSTEM 'templates/Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Advance_Care_Information_ANZSCO_Checks_Revision1                                          	SYSTEM 'templates/Advance_Care_Information_ANZSCO_Checks_Revision1.ent'>
<!ENTITY ent-Advance_Care_Information_ClinicalDocument_5_1                                             	SYSTEM 'templates/Advance_Care_Information_ClinicalDocument_5_1.ent'>
<!ENTITY ent-Advance_Care_Information_ClinicalDocument_5_1_custom                                      	SYSTEM 'templates/Advance_Care_Information_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-Advance_Care_Information_CommonDocumentAuthor_6_1_2_1_or_6_1_2_2                          	SYSTEM 'templates/Advance_Care_Information_CommonDocumentAuthor_6_1_2_1_or_6_1_2_2.ent'>
<!ENTITY ent-Advance_Care_Information_Custodian_5_1_2                                                  	SYSTEM 'templates/Advance_Care_Information_Custodian_5_1_2.ent'>
<!ENTITY ent-Advance_Care_Information_Custodian_5_1_2_custom                                           	SYSTEM 'templates/Advance_Care_Information_Custodian_5_1_2_custom.ent'>
<!ENTITY ent-Advance_Care_Information_DataType_Global_Checks                                           	SYSTEM 'templates/Advance_Care_Information_DataType_Global_Checks.ent'>
<!ENTITY ent-Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2               	SYSTEM 'templates/Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2.ent'>
<!ENTITY ent-Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom        	SYSTEM 'templates/Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom.ent'>
<!ENTITY ent-Advance_Care_Information_DocumentAuthorasaPerson_Non-HealthcareProvider_6_1_2_1           	SYSTEM 'templates/Advance_Care_Information_DocumentAuthorasaPerson_Non-HealthcareProvider_6_1_2_1.ent'>
<!ENTITY ent-Advance_Care_Information_DocumentAuthorasaPerson_NonHealthcareProvider_6_1_2_1_custom     	SYSTEM 'templates/Advance_Care_Information_DocumentAuthorasaPerson_NonHealthcareProvider_6_1_2_1_custom.ent'>
<!ENTITY ent-Advance_Care_Information_DVA_File_Number_Checks                                           	SYSTEM 'templates/Advance_Care_Information_DVA_File_Number_Checks.ent'>
<!ENTITY ent-Advance_Care_Information_Entity_Identifier_Checks                                         	SYSTEM 'templates/Advance_Care_Information_Entity_Identifier_Checks.ent'>
<!ENTITY ent-Advance_Care_Information_Global_Checks                                                    	SYSTEM 'templates/Advance_Care_Information_Global_Checks.ent'>
<!ENTITY ent-Advance_Care_Information_Global_Checks_Exceptions_Option_04                               	SYSTEM 'templates/Advance_Care_Information_Global_Checks_Exceptions_Option_04.ent'>
<!ENTITY ent-Advance_Care_Information_Global_Code_Checks_custom                                        	SYSTEM 'templates/Advance_Care_Information_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part1                      	SYSTEM 'templates/Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part2                      	SYSTEM 'templates/Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part3                      	SYSTEM 'templates/Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part3.ent'>
<!ENTITY ent-Advance_Care_Information_HPI-I_Enforced                                                   	SYSTEM 'templates/Advance_Care_Information_HPI-I_Enforced.ent'>
<!ENTITY ent-Advance_Care_Information_IHI_Common_Conformance_Requirements_Part1                        	SYSTEM 'templates/Advance_Care_Information_IHI_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-Advance_Care_Information_IHI_Common_Conformance_Requirements_Part2                        	SYSTEM 'templates/Advance_Care_Information_IHI_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-Advance_Care_Information_LegalAuthenticator_5_1_1                                         	SYSTEM 'templates/Advance_Care_Information_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-Advance_Care_Information_mediaType_Additional_Checks                                      	SYSTEM 'templates/Advance_Care_Information_mediaType_Additional_Checks.ent'>
<!ENTITY ent-Advance_Care_Information_Participation_Period                                             	SYSTEM 'templates/Advance_Care_Information_Participation_Period.ent'>
<!ENTITY ent-Advance_Care_Information_SUBJECTOFCARE_6_1_1                                              	SYSTEM 'templates/Advance_Care_Information_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Advance_Care_Information_SUBJECTOFCARE_6_1_1_custom                                       	SYSTEM 'templates/Advance_Care_Information_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Advance_Care_Information_Xml_Stylesheet_Exclusion                                         	SYSTEM 'templates/Advance_Care_Information_Xml_Stylesheet_Exclusion.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 3A conformance to Advance Care Information CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-Advance_Care_Information_1B_CDA_Narrative-errors"/>
	<active pattern = "p-Advance_Care_Information_2_AdministrativeObservations_4-errors"/>
	<active pattern = "p-Advance_Care_Information_2_ADVANCECAREINFORMATIONSECTION_7_1_1-errors"/>
	<active pattern = "p-Advance_Care_Information_2_ADVANCECAREINFORMATION_7_1-errors"/>
	<active pattern = "p-Advance_Care_Information_2_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom1-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom2-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_Global_Checks-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_ANZSCO_Checks_Revision1-errors"/>
	<active pattern = "p-Advance_Care_Information_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-Advance_Care_Information_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_CommonDocumentAuthor_6_1_2_1_or_6_1_2_2-errors"/>
	<active pattern = "p-Advance_Care_Information_Custodian_5_1_2-errors"/>
	<active pattern = "p-Advance_Care_Information_Custodian_5_1_2_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_DataType_Global_Checks-errors"/>
	<active pattern = "p-Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2-errors"/>
	<active pattern = "p-Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_DocumentAuthorasaPerson_Non-HealthcareProvider_6_1_2_1-errors"/>
	<active pattern = "p-Advance_Care_Information_DocumentAuthorasaPerson_NonHealthcareProvider_6_1_2_1_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_DVA_File_Number_Checks-errors"/>
	<active pattern = "p-Advance_Care_Information_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-Advance_Care_Information_Global_Checks-errors"/>
	<active pattern = "p-Advance_Care_Information_Global_Checks_Exceptions_Option_04-errors"/>
	<active pattern = "p-Advance_Care_Information_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part3-errors"/>
	<active pattern = "p-Advance_Care_Information_HPI-I_Enforced-errors"/>
	<active pattern = "p-Advance_Care_Information_IHI_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-Advance_Care_Information_IHI_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-Advance_Care_Information_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-Advance_Care_Information_mediaType_Additional_Checks-errors"/>
	<active pattern = "p-Advance_Care_Information_Participation_Period-errors"/>
	<active pattern = "p-Advance_Care_Information_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Advance_Care_Information_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Advance_Care_Information_Xml_Stylesheet_Exclusion-errors"/>


</phase>


	&ent-Advance_Care_Information_1B_CDA_Narrative;
	&ent-Advance_Care_Information_2_AdministrativeObservations_4;
	&ent-Advance_Care_Information_2_ADVANCECAREINFORMATIONSECTION_7_1_1;
	&ent-Advance_Care_Information_2_ADVANCECAREINFORMATION_7_1;
	&ent-Advance_Care_Information_2_Global_Code_Checks_custom;
	&ent-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2;
	&ent-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom1;
	&ent-Advance_Care_Information_3A_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom2;
	&ent-Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1;
	&ent-Advance_Care_Information_3A_DOCUMENTAUTHOR_7_1_1_1_1_custom;
	&ent-Advance_Care_Information_3A_Global_Checks;
	&ent-Advance_Care_Information_3A_Global_Code_Checks_custom;
	&ent-Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1;
	&ent-Advance_Care_Information_3A_RELATEDDOCUMENT_7_1_1_1_custom;
	&ent-Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1;
	&ent-Advance_Care_Information_3A_SUBJECTOFCARE_6_1_1_custom;
	&ent-Advance_Care_Information_ANZSCO_Checks_Revision1;
	&ent-Advance_Care_Information_ClinicalDocument_5_1;
	&ent-Advance_Care_Information_ClinicalDocument_5_1_custom;
	&ent-Advance_Care_Information_CommonDocumentAuthor_6_1_2_1_or_6_1_2_2;
	&ent-Advance_Care_Information_Custodian_5_1_2;
	&ent-Advance_Care_Information_Custodian_5_1_2_custom;
	&ent-Advance_Care_Information_DataType_Global_Checks;
	&ent-Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2;
	&ent-Advance_Care_Information_DocumentAuthorasaPerson_HealthcareProvider_6_1_2_2_custom;
	&ent-Advance_Care_Information_DocumentAuthorasaPerson_Non-HealthcareProvider_6_1_2_1;
	&ent-Advance_Care_Information_DocumentAuthorasaPerson_NonHealthcareProvider_6_1_2_1_custom;
	&ent-Advance_Care_Information_DVA_File_Number_Checks;
	&ent-Advance_Care_Information_Entity_Identifier_Checks;
	&ent-Advance_Care_Information_Global_Checks;
	&ent-Advance_Care_Information_Global_Checks_Exceptions_Option_04;
	&ent-Advance_Care_Information_Global_Code_Checks_custom;
	&ent-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part1;
	&ent-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part2;
	&ent-Advance_Care_Information_HPI-I_Common_Conformance_Requirements_Part3;
	&ent-Advance_Care_Information_HPI-I_Enforced;
	&ent-Advance_Care_Information_IHI_Common_Conformance_Requirements_Part1;
	&ent-Advance_Care_Information_IHI_Common_Conformance_Requirements_Part2;
	&ent-Advance_Care_Information_LegalAuthenticator_5_1_1;
	&ent-Advance_Care_Information_mediaType_Additional_Checks;
	&ent-Advance_Care_Information_Participation_Period;
	&ent-Advance_Care_Information_SUBJECTOFCARE_6_1_1;
	&ent-Advance_Care_Information_SUBJECTOFCARE_6_1_1_custom;
	&ent-Advance_Care_Information_Xml_Stylesheet_Exclusion;


</schema>
