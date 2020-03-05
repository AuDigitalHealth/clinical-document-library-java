<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-Shared_Health_Summary_1B_CDA_Narrative                                       	SYSTEM 'templates/Shared_Health_Summary_1B_CDA_Narrative.ent'>
<!ENTITY ent-Shared_Health_Summary_2_AdministrativeObservations_4                         	SYSTEM 'templates/Shared_Health_Summary_2_AdministrativeObservations_4.ent'>
<!ENTITY ent-Shared_Health_Summary_2_ADVERSEREACTIONS_7_1_1                               	SYSTEM 'templates/Shared_Health_Summary_2_ADVERSEREACTIONS_7_1_1.ent'>
<!ENTITY ent-Shared_Health_Summary_2_Global_Code_Checks_custom                            	SYSTEM 'templates/Shared_Health_Summary_2_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Shared_Health_Summary_2_IMMUNISATIONS_7_1_4                                  	SYSTEM 'templates/Shared_Health_Summary_2_IMMUNISATIONS_7_1_4.ent'>
<!ENTITY ent-Shared_Health_Summary_2_Medications_MEDICATIONORDERS_7_1_2                   	SYSTEM 'templates/Shared_Health_Summary_2_Medications_MEDICATIONORDERS_7_1_2.ent'>
<!ENTITY ent-Shared_Health_Summary_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_3    	SYSTEM 'templates/Shared_Health_Summary_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_3.ent'>
<!ENTITY ent-Shared_Health_Summary_2_SharedHealthSummary_7_1                              	SYSTEM 'templates/Shared_Health_Summary_2_SharedHealthSummary_7_1.ent'>
<!ENTITY ent-Shared_Health_Summary_ANZSCO_Checks_Revision1                                	SYSTEM 'templates/Shared_Health_Summary_ANZSCO_Checks_Revision1.ent'>
<!ENTITY ent-Shared_Health_Summary_ClinicalDocument_5_1                                   	SYSTEM 'templates/Shared_Health_Summary_ClinicalDocument_5_1.ent'>
<!ENTITY ent-Shared_Health_Summary_ClinicalDocument_5_1_custom                            	SYSTEM 'templates/Shared_Health_Summary_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-Shared_Health_Summary_Custodian_5_1_2                                        	SYSTEM 'templates/Shared_Health_Summary_Custodian_5_1_2.ent'>
<!ENTITY ent-Shared_Health_Summary_Custodian_5_1_2_custom                                 	SYSTEM 'templates/Shared_Health_Summary_Custodian_5_1_2_custom.ent'>
<!ENTITY ent-Shared_Health_Summary_DataType_Global_Checks                                 	SYSTEM 'templates/Shared_Health_Summary_DataType_Global_Checks.ent'>
<!ENTITY ent-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1                                   	SYSTEM 'templates/Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1.ent'>
<!ENTITY ent-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1_custom                            	SYSTEM 'templates/Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1_custom.ent'>
<!ENTITY ent-Shared_Health_Summary_DVA_File_Number_Checks                                 	SYSTEM 'templates/Shared_Health_Summary_DVA_File_Number_Checks.ent'>
<!ENTITY ent-Shared_Health_Summary_Entity_Identifier_Checks                               	SYSTEM 'templates/Shared_Health_Summary_Entity_Identifier_Checks.ent'>
<!ENTITY ent-Shared_Health_Summary_Global_Checks                                          	SYSTEM 'templates/Shared_Health_Summary_Global_Checks.ent'>
<!ENTITY ent-Shared_Health_Summary_Global_Checks_Exceptions_Option_04                     	SYSTEM 'templates/Shared_Health_Summary_Global_Checks_Exceptions_Option_04.ent'>
<!ENTITY ent-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part1            	SYSTEM 'templates/Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part2            	SYSTEM 'templates/Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part3            	SYSTEM 'templates/Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part3.ent'>
<!ENTITY ent-Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part1              	SYSTEM 'templates/Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part2              	SYSTEM 'templates/Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-Shared_Health_Summary_LegalAuthenticator_5_1_1                               	SYSTEM 'templates/Shared_Health_Summary_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-Shared_Health_Summary_LegalAuthenticator_5_1_1_custom                        	SYSTEM 'templates/Shared_Health_Summary_LegalAuthenticator_5_1_1_custom.ent'>
<!ENTITY ent-Shared_Health_Summary_mediaType_Additional_Checks                            	SYSTEM 'templates/Shared_Health_Summary_mediaType_Additional_Checks.ent'>
<!ENTITY ent-Shared_Health_Summary_Participation_Period                                   	SYSTEM 'templates/Shared_Health_Summary_Participation_Period.ent'>
<!ENTITY ent-Shared_Health_Summary_SharedHealthSummary_6_1                                	SYSTEM 'templates/Shared_Health_Summary_SharedHealthSummary_6_1.ent'>
<!ENTITY ent-Shared_Health_Summary_SUBJECTOFCARE_6_1_2                                    	SYSTEM 'templates/Shared_Health_Summary_SUBJECTOFCARE_6_1_2.ent'>
<!ENTITY ent-Shared_Health_Summary_SUBJECTOFCARE_6_1_2_custom                             	SYSTEM 'templates/Shared_Health_Summary_SUBJECTOFCARE_6_1_2_custom.ent'>
<!ENTITY ent-Shared_Health_Summary_Xml_Stylesheet_Exclusion                               	SYSTEM 'templates/Shared_Health_Summary_Xml_Stylesheet_Exclusion.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 2 conformance to Shared Health Summary CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-Shared_Health_Summary_1B_CDA_Narrative-errors"/>
	<active pattern = "p-Shared_Health_Summary_2_AdministrativeObservations_4-errors"/>
	<active pattern = "p-Shared_Health_Summary_2_ADVERSEREACTIONS_7_1_1-errors"/>
	<active pattern = "p-Shared_Health_Summary_2_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Shared_Health_Summary_2_IMMUNISATIONS_7_1_4-errors"/>
	<active pattern = "p-Shared_Health_Summary_2_Medications_MEDICATIONORDERS_7_1_2-errors"/>
	<active pattern = "p-Shared_Health_Summary_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_3-errors"/>
	<active pattern = "p-Shared_Health_Summary_2_SharedHealthSummary_7_1-errors"/>
	<active pattern = "p-Shared_Health_Summary_ANZSCO_Checks_Revision1-errors"/>
	<active pattern = "p-Shared_Health_Summary_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-Shared_Health_Summary_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-Shared_Health_Summary_Custodian_5_1_2-errors"/>
	<active pattern = "p-Shared_Health_Summary_Custodian_5_1_2_custom-errors"/>
	<active pattern = "p-Shared_Health_Summary_DataType_Global_Checks-errors"/>
	<active pattern = "p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1-errors"/>
	<active pattern = "p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1_custom-errors"/>
	<active pattern = "p-Shared_Health_Summary_DVA_File_Number_Checks-errors"/>
	<active pattern = "p-Shared_Health_Summary_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-Shared_Health_Summary_Global_Checks-errors"/>
	<active pattern = "p-Shared_Health_Summary_Global_Checks_Exceptions_Option_04-errors"/>
	<active pattern = "p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part3-errors"/>
	<active pattern = "p-Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-Shared_Health_Summary_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-Shared_Health_Summary_LegalAuthenticator_5_1_1_custom-errors"/>
	<active pattern = "p-Shared_Health_Summary_mediaType_Additional_Checks-errors"/>
	<active pattern = "p-Shared_Health_Summary_Participation_Period-errors"/>
	<active pattern = "p-Shared_Health_Summary_SharedHealthSummary_6_1-errors"/>
	<active pattern = "p-Shared_Health_Summary_SUBJECTOFCARE_6_1_2-errors"/>
	<active pattern = "p-Shared_Health_Summary_SUBJECTOFCARE_6_1_2_custom-errors"/>
	<active pattern = "p-Shared_Health_Summary_Xml_Stylesheet_Exclusion-errors"/>


</phase>


	&ent-Shared_Health_Summary_1B_CDA_Narrative;
	&ent-Shared_Health_Summary_2_AdministrativeObservations_4;
	&ent-Shared_Health_Summary_2_ADVERSEREACTIONS_7_1_1;
	&ent-Shared_Health_Summary_2_Global_Code_Checks_custom;
	&ent-Shared_Health_Summary_2_IMMUNISATIONS_7_1_4;
	&ent-Shared_Health_Summary_2_Medications_MEDICATIONORDERS_7_1_2;
	&ent-Shared_Health_Summary_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_3;
	&ent-Shared_Health_Summary_2_SharedHealthSummary_7_1;
	&ent-Shared_Health_Summary_ANZSCO_Checks_Revision1;
	&ent-Shared_Health_Summary_ClinicalDocument_5_1;
	&ent-Shared_Health_Summary_ClinicalDocument_5_1_custom;
	&ent-Shared_Health_Summary_Custodian_5_1_2;
	&ent-Shared_Health_Summary_Custodian_5_1_2_custom;
	&ent-Shared_Health_Summary_DataType_Global_Checks;
	&ent-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1;
	&ent-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1_custom;
	&ent-Shared_Health_Summary_DVA_File_Number_Checks;
	&ent-Shared_Health_Summary_Entity_Identifier_Checks;
	&ent-Shared_Health_Summary_Global_Checks;
	&ent-Shared_Health_Summary_Global_Checks_Exceptions_Option_04;
	&ent-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part1;
	&ent-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part2;
	&ent-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part3;
	&ent-Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part1;
	&ent-Shared_Health_Summary_IHI_Common_Conformance_Requirements_Part2;
	&ent-Shared_Health_Summary_LegalAuthenticator_5_1_1;
	&ent-Shared_Health_Summary_LegalAuthenticator_5_1_1_custom;
	&ent-Shared_Health_Summary_mediaType_Additional_Checks;
	&ent-Shared_Health_Summary_Participation_Period;
	&ent-Shared_Health_Summary_SharedHealthSummary_6_1;
	&ent-Shared_Health_Summary_SUBJECTOFCARE_6_1_2;
	&ent-Shared_Health_Summary_SUBJECTOFCARE_6_1_2_custom;
	&ent-Shared_Health_Summary_Xml_Stylesheet_Exclusion;


</schema>
