<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-e-Referral_1B_CDA_Narrative                                                    	SYSTEM 'templates/e-Referral_1B_CDA_Narrative.ent'>
<!ENTITY ent-e-Referral_2_AdministrativeObservations_4                                      	SYSTEM 'templates/e-Referral_2_AdministrativeObservations_4.ent'>
<!ENTITY ent-e-Referral_2_ADVERSEREACTIONS_7_1_4                                            	SYSTEM 'templates/e-Referral_2_ADVERSEREACTIONS_7_1_4.ent'>
<!ENTITY ent-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5                                    	SYSTEM 'templates/e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5.ent'>
<!ENTITY ent-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5_custom                             	SYSTEM 'templates/e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5_custom.ent'>
<!ENTITY ent-e-Referral_2_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4    	SYSTEM 'templates/e-Referral_2_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4.ent'>
<!ENTITY ent-e-Referral_2_Global_Code_Checks_custom                                         	SYSTEM 'templates/e-Referral_2_Global_Code_Checks_custom.ent'>
<!ENTITY ent-e-Referral_2_IMAGINGEXAMINATIONRESULT_7_1_5_2                                  	SYSTEM 'templates/e-Referral_2_IMAGINGEXAMINATIONRESULT_7_1_5_2.ent'>
<!ENTITY ent-e-Referral_2_MEDICALHISTORY_7_1_2                                              	SYSTEM 'templates/e-Referral_2_MEDICALHISTORY_7_1_2.ent'>
<!ENTITY ent-e-Referral_2_MEDICATIONS_7_1_3                                                 	SYSTEM 'templates/e-Referral_2_MEDICATIONS_7_1_3.ent'>
<!ENTITY ent-e-Referral_2_PATHOLOGYTESTRESULT_7_1_5_1                                       	SYSTEM 'templates/e-Referral_2_PATHOLOGYTESTRESULT_7_1_5_1.ent'>
<!ENTITY ent-e-Referral_2_REFERRALDETAIL_7_1_1                                              	SYSTEM 'templates/e-Referral_2_REFERRALDETAIL_7_1_1.ent'>
<!ENTITY ent-e-Referral_2_REQUESTEDSERVICE_7_1_5_3                                          	SYSTEM 'templates/e-Referral_2_REQUESTEDSERVICE_7_1_5_3.ent'>
<!ENTITY ent-e-Referral_ANZSCO_Checks_2006                                                  	SYSTEM 'templates/e-Referral_ANZSCO_Checks_2006.ent'>
<!ENTITY ent-e-Referral_ClinicalDocument_5_1                                                	SYSTEM 'templates/e-Referral_ClinicalDocument_5_1.ent'>
<!ENTITY ent-e-Referral_ClinicalDocument_5_1_custom                                         	SYSTEM 'templates/e-Referral_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-e-Referral_Common_Participant_Checks                                           	SYSTEM 'templates/e-Referral_Common_Participant_Checks.ent'>
<!ENTITY ent-e-Referral_Custodian_5_1_3                                                     	SYSTEM 'templates/e-Referral_Custodian_5_1_3.ent'>
<!ENTITY ent-e-Referral_Custodian_5_1_3_custom                                              	SYSTEM 'templates/e-Referral_Custodian_5_1_3_custom.ent'>
<!ENTITY ent-e-Referral_DataType_Global_Checks                                              	SYSTEM 'templates/e-Referral_DataType_Global_Checks.ent'>
<!ENTITY ent-e-Referral_DOCUMENTAUTHOR_6_1_1                                                	SYSTEM 'templates/e-Referral_DOCUMENTAUTHOR_6_1_1.ent'>
<!ENTITY ent-e-Referral_DOCUMENTAUTHOR_6_1_1_custom                                         	SYSTEM 'templates/e-Referral_DOCUMENTAUTHOR_6_1_1_custom.ent'>
<!ENTITY ent-e-Referral_DVA_File_Number_Checks                                              	SYSTEM 'templates/e-Referral_DVA_File_Number_Checks.ent'>
<!ENTITY ent-e-Referral_e-Referral_7_1                                                      	SYSTEM 'templates/e-Referral_e-Referral_7_1.ent'>
<!ENTITY ent-e-Referral_Entity_Identifier_Checks                                            	SYSTEM 'templates/e-Referral_Entity_Identifier_Checks.ent'>
<!ENTITY ent-e-Referral_Global_Checks                                                       	SYSTEM 'templates/e-Referral_Global_Checks.ent'>
<!ENTITY ent-e-Referral_Global_Checks_Exceptions_Option_05                                  	SYSTEM 'templates/e-Referral_Global_Checks_Exceptions_Option_05.ent'>
<!ENTITY ent-e-Referral_Global_Code_Checks_custom                                           	SYSTEM 'templates/e-Referral_Global_Code_Checks_custom.ent'>
<!ENTITY ent-e-Referral_HPI-I_Enforced                                                      	SYSTEM 'templates/e-Referral_HPI-I_Enforced.ent'>
<!ENTITY ent-e-Referral_IHI_Common_Conformance_Requirements_Part1                           	SYSTEM 'templates/e-Referral_IHI_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-e-Referral_IHI_Common_Conformance_Requirements_Part2                           	SYSTEM 'templates/e-Referral_IHI_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-e-Referral_InformationRecipient_5_1_2                                          	SYSTEM 'templates/e-Referral_InformationRecipient_5_1_2.ent'>
<!ENTITY ent-e-Referral_InformationRecipient_5_1_2_custom                                   	SYSTEM 'templates/e-Referral_InformationRecipient_5_1_2_custom.ent'>
<!ENTITY ent-e-Referral_LegalAuthenticator_5_1_1                                            	SYSTEM 'templates/e-Referral_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-e-Referral_LegalAuthenticator_5_1_1_custom                                     	SYSTEM 'templates/e-Referral_LegalAuthenticator_5_1_1_custom.ent'>
<!ENTITY ent-e-Referral_Packaging_Requirements                                              	SYSTEM 'templates/e-Referral_Packaging_Requirements.ent'>
<!ENTITY ent-e-Referral_PATIENTNOMINATEDCONTACTSORGANISATION_6_1_3_2                        	SYSTEM 'templates/e-Referral_PATIENTNOMINATEDCONTACTSORGANISATION_6_1_3_2.ent'>
<!ENTITY ent-e-Referral_PATIENTNOMINATEDCONTACTSPERSON_6_1_3_1                              	SYSTEM 'templates/e-Referral_PATIENTNOMINATEDCONTACTSPERSON_6_1_3_1.ent'>
<!ENTITY ent-e-Referral_PATIENTNOMINATEDCONTACTS_6_1_3_1_and_or_6_1_3_2_custom              	SYSTEM 'templates/e-Referral_PATIENTNOMINATEDCONTACTS_6_1_3_1_and_or_6_1_3_2_custom.ent'>
<!ENTITY ent-e-Referral_REFEREEORGANISATION_7_1_1_1_2                                       	SYSTEM 'templates/e-Referral_REFEREEORGANISATION_7_1_1_1_2.ent'>
<!ENTITY ent-e-Referral_REFEREEORGANISATION_7_1_1_1_2_custom                                	SYSTEM 'templates/e-Referral_REFEREEORGANISATION_7_1_1_1_2_custom.ent'>
<!ENTITY ent-e-Referral_REFEREEPERSON_7_1_1_1_1                                             	SYSTEM 'templates/e-Referral_REFEREEPERSON_7_1_1_1_1.ent'>
<!ENTITY ent-e-Referral_REFEREEPERSON_7_1_1_1_1_custom                                      	SYSTEM 'templates/e-Referral_REFEREEPERSON_7_1_1_1_1_custom.ent'>
<!ENTITY ent-e-Referral_REFEREE_7_1_1_1_1_and_or_7_1_1_1_2_custom                           	SYSTEM 'templates/e-Referral_REFEREE_7_1_1_1_1_and_or_7_1_1_1_2_custom.ent'>
<!ENTITY ent-e-Referral_SUBJECTOFCARE_6_1_2                                                 	SYSTEM 'templates/e-Referral_SUBJECTOFCARE_6_1_2.ent'>
<!ENTITY ent-e-Referral_SUBJECTOFCARE_6_1_2_custom                                          	SYSTEM 'templates/e-Referral_SUBJECTOFCARE_6_1_2_custom.ent'>
<!ENTITY ent-e-Referral_USUALGPORGANISATION_7_1_1_2_2                                       	SYSTEM 'templates/e-Referral_USUALGPORGANISATION_7_1_1_2_2.ent'>
<!ENTITY ent-e-Referral_USUALGPORGANISATION_7_1_1_2_2_custom                                	SYSTEM 'templates/e-Referral_USUALGPORGANISATION_7_1_1_2_2_custom.ent'>
<!ENTITY ent-e-Referral_USUALGPPERSON_7_1_1_2_1                                             	SYSTEM 'templates/e-Referral_USUALGPPERSON_7_1_1_2_1.ent'>
<!ENTITY ent-e-Referral_USUALGPPERSON_7_1_1_2_1_custom                                      	SYSTEM 'templates/e-Referral_USUALGPPERSON_7_1_1_2_1_custom.ent'>
<!ENTITY ent-e-Referral_USUALGP_7_1_1_2_1_and_or_7_1_1_2_2_custom                           	SYSTEM 'templates/e-Referral_USUALGP_7_1_1_2_1_and_or_7_1_1_2_2_custom.ent'>
<!ENTITY ent-e-Referral__HPI-I_Common_Conformance_Requirements_Part1                        	SYSTEM 'templates/e-Referral__HPI-I_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-e-Referral__HPI-I_Common_Conformance_Requirements_Part2                        	SYSTEM 'templates/e-Referral__HPI-I_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-e-Referral__HPI-I_Common_Conformance_Requirements_Part3                        	SYSTEM 'templates/e-Referral__HPI-I_Common_Conformance_Requirements_Part3.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 2 conformance to e-Referral CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-e-Referral_1B_CDA_Narrative-errors"/>
	<active pattern = "p-e-Referral_2_AdministrativeObservations_4-errors"/>
	<active pattern = "p-e-Referral_2_ADVERSEREACTIONS_7_1_4-errors"/>
	<active pattern = "p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5-errors"/>
	<active pattern = "p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5_custom-errors"/>
	<active pattern = "p-e-Referral_2_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4-errors"/>
	<active pattern = "p-e-Referral_2_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-e-Referral_2_IMAGINGEXAMINATIONRESULT_7_1_5_2-errors"/>
	<active pattern = "p-e-Referral_2_MEDICALHISTORY_7_1_2-errors"/>
	<active pattern = "p-e-Referral_2_MEDICATIONS_7_1_3-errors"/>
	<active pattern = "p-e-Referral_2_PATHOLOGYTESTRESULT_7_1_5_1-errors"/>
	<active pattern = "p-e-Referral_2_REFERRALDETAIL_7_1_1-errors"/>
	<active pattern = "p-e-Referral_2_REQUESTEDSERVICE_7_1_5_3-errors"/>
	<active pattern = "p-e-Referral_ANZSCO_Checks_2006-errors"/>
	<active pattern = "p-e-Referral_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-e-Referral_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-e-Referral_Common_Participant_Checks-errors"/>
	<active pattern = "p-e-Referral_Custodian_5_1_3-errors"/>
	<active pattern = "p-e-Referral_Custodian_5_1_3_custom-errors"/>
	<active pattern = "p-e-Referral_DataType_Global_Checks-errors"/>
	<active pattern = "p-e-Referral_DOCUMENTAUTHOR_6_1_1-errors"/>
	<active pattern = "p-e-Referral_DOCUMENTAUTHOR_6_1_1_custom-errors"/>
	<active pattern = "p-e-Referral_DVA_File_Number_Checks-errors"/>
	<active pattern = "p-e-Referral_e-Referral_7_1-errors"/>
	<active pattern = "p-e-Referral_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-e-Referral_Global_Checks-errors"/>
	<active pattern = "p-e-Referral_Global_Checks_Exceptions_Option_05-errors"/>
	<active pattern = "p-e-Referral_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-e-Referral_HPI-I_Enforced-errors"/>
	<active pattern = "p-e-Referral_IHI_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-e-Referral_IHI_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-e-Referral_InformationRecipient_5_1_2-errors"/>
	<active pattern = "p-e-Referral_InformationRecipient_5_1_2_custom-errors"/>
	<active pattern = "p-e-Referral_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-e-Referral_LegalAuthenticator_5_1_1_custom-errors"/>
	<active pattern = "p-e-Referral_Packaging_Requirements-errors"/>
	<active pattern = "p-e-Referral_PATIENTNOMINATEDCONTACTSORGANISATION_6_1_3_2-errors"/>
	<active pattern = "p-e-Referral_PATIENTNOMINATEDCONTACTSPERSON_6_1_3_1-errors"/>
	<active pattern = "p-e-Referral_PATIENTNOMINATEDCONTACTS_6_1_3_1_and_or_6_1_3_2_custom-errors"/>
	<active pattern = "p-e-Referral_REFEREEORGANISATION_7_1_1_1_2-errors"/>
	<active pattern = "p-e-Referral_REFEREEORGANISATION_7_1_1_1_2_custom-errors"/>
	<active pattern = "p-e-Referral_REFEREEPERSON_7_1_1_1_1-errors"/>
	<active pattern = "p-e-Referral_REFEREEPERSON_7_1_1_1_1_custom-errors"/>
	<active pattern = "p-e-Referral_REFEREE_7_1_1_1_1_and_or_7_1_1_1_2_custom-errors"/>
	<active pattern = "p-e-Referral_SUBJECTOFCARE_6_1_2-errors"/>
	<active pattern = "p-e-Referral_SUBJECTOFCARE_6_1_2_custom-errors"/>
	<active pattern = "p-e-Referral_USUALGPORGANISATION_7_1_1_2_2-errors"/>
	<active pattern = "p-e-Referral_USUALGPORGANISATION_7_1_1_2_2_custom-errors"/>
	<active pattern = "p-e-Referral_USUALGPPERSON_7_1_1_2_1-errors"/>
	<active pattern = "p-e-Referral_USUALGPPERSON_7_1_1_2_1_custom-errors"/>
	<active pattern = "p-e-Referral_USUALGP_7_1_1_2_1_and_or_7_1_1_2_2_custom-errors"/>
	<active pattern = "p-e-Referral__HPI-I_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-e-Referral__HPI-I_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-e-Referral__HPI-I_Common_Conformance_Requirements_Part3-errors"/>


</phase>


	&ent-e-Referral_1B_CDA_Narrative;
	&ent-e-Referral_2_AdministrativeObservations_4;
	&ent-e-Referral_2_ADVERSEREACTIONS_7_1_4;
	&ent-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5;
	&ent-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5_custom;
	&ent-e-Referral_2_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4;
	&ent-e-Referral_2_Global_Code_Checks_custom;
	&ent-e-Referral_2_IMAGINGEXAMINATIONRESULT_7_1_5_2;
	&ent-e-Referral_2_MEDICALHISTORY_7_1_2;
	&ent-e-Referral_2_MEDICATIONS_7_1_3;
	&ent-e-Referral_2_PATHOLOGYTESTRESULT_7_1_5_1;
	&ent-e-Referral_2_REFERRALDETAIL_7_1_1;
	&ent-e-Referral_2_REQUESTEDSERVICE_7_1_5_3;
	&ent-e-Referral_ANZSCO_Checks_2006;
	&ent-e-Referral_ClinicalDocument_5_1;
	&ent-e-Referral_ClinicalDocument_5_1_custom;
	&ent-e-Referral_Common_Participant_Checks;
	&ent-e-Referral_Custodian_5_1_3;
	&ent-e-Referral_Custodian_5_1_3_custom;
	&ent-e-Referral_DataType_Global_Checks;
	&ent-e-Referral_DOCUMENTAUTHOR_6_1_1;
	&ent-e-Referral_DOCUMENTAUTHOR_6_1_1_custom;
	&ent-e-Referral_DVA_File_Number_Checks;
	&ent-e-Referral_e-Referral_7_1;
	&ent-e-Referral_Entity_Identifier_Checks;
	&ent-e-Referral_Global_Checks;
	&ent-e-Referral_Global_Checks_Exceptions_Option_05;
	&ent-e-Referral_Global_Code_Checks_custom;
	&ent-e-Referral_HPI-I_Enforced;
	&ent-e-Referral_IHI_Common_Conformance_Requirements_Part1;
	&ent-e-Referral_IHI_Common_Conformance_Requirements_Part2;
	&ent-e-Referral_InformationRecipient_5_1_2;
	&ent-e-Referral_InformationRecipient_5_1_2_custom;
	&ent-e-Referral_LegalAuthenticator_5_1_1;
	&ent-e-Referral_LegalAuthenticator_5_1_1_custom;
	&ent-e-Referral_Packaging_Requirements;
	&ent-e-Referral_PATIENTNOMINATEDCONTACTSORGANISATION_6_1_3_2;
	&ent-e-Referral_PATIENTNOMINATEDCONTACTSPERSON_6_1_3_1;
	&ent-e-Referral_PATIENTNOMINATEDCONTACTS_6_1_3_1_and_or_6_1_3_2_custom;
	&ent-e-Referral_REFEREEORGANISATION_7_1_1_1_2;
	&ent-e-Referral_REFEREEORGANISATION_7_1_1_1_2_custom;
	&ent-e-Referral_REFEREEPERSON_7_1_1_1_1;
	&ent-e-Referral_REFEREEPERSON_7_1_1_1_1_custom;
	&ent-e-Referral_REFEREE_7_1_1_1_1_and_or_7_1_1_1_2_custom;
	&ent-e-Referral_SUBJECTOFCARE_6_1_2;
	&ent-e-Referral_SUBJECTOFCARE_6_1_2_custom;
	&ent-e-Referral_USUALGPORGANISATION_7_1_1_2_2;
	&ent-e-Referral_USUALGPORGANISATION_7_1_1_2_2_custom;
	&ent-e-Referral_USUALGPPERSON_7_1_1_2_1;
	&ent-e-Referral_USUALGPPERSON_7_1_1_2_1_custom;
	&ent-e-Referral_USUALGP_7_1_1_2_1_and_or_7_1_1_2_2_custom;
	&ent-e-Referral__HPI-I_Common_Conformance_Requirements_Part1;
	&ent-e-Referral__HPI-I_Common_Conformance_Requirements_Part2;
	&ent-e-Referral__HPI-I_Common_Conformance_Requirements_Part3;


</schema>
