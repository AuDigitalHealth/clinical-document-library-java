<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-Service_Referral_1B_CDA_Narrative                                                                                      	SYSTEM 'templates/Service_Referral_1B_CDA_Narrative.ent'>
<!ENTITY ent-Service_Referral_1B_CDA_Narrative_Nested_Sections                                                                      	SYSTEM 'templates/Service_Referral_1B_CDA_Narrative_Nested_Sections.ent'>
<!ENTITY ent-Service_Referral_2_AdministrativeObservations_4                                                                        	SYSTEM 'templates/Service_Referral_2_AdministrativeObservations_4.ent'>
<!ENTITY ent-Service_Referral_2_ADVERSEREACTIONS_7_1_3                                                                              	SYSTEM 'templates/Service_Referral_2_ADVERSEREACTIONS_7_1_3.ent'>
<!ENTITY ent-Service_Referral_2_CURRENTSERVICES_7_1_2                                                                               	SYSTEM 'templates/Service_Referral_2_CURRENTSERVICES_7_1_2.ent'>
<!ENTITY ent-Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6                                                                      	SYSTEM 'templates/Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6.ent'>
<!ENTITY ent-Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6_custom                                                               	SYSTEM 'templates/Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6_custom.ent'>
<!ENTITY ent-Service_Referral_2_Global_Optional_Code_Checks_custom                                                                  	SYSTEM 'templates/Service_Referral_2_Global_Optional_Code_Checks_custom.ent'>
<!ENTITY ent-Service_Referral_2_IMAGINGEXAMINATIONRESULT_7_1_6_2                                                                    	SYSTEM 'templates/Service_Referral_2_IMAGINGEXAMINATIONRESULT_7_1_6_2.ent'>
<!ENTITY ent-Service_Referral_2_Medications_MEDICATIONORDERS_7_1_4                                                                  	SYSTEM 'templates/Service_Referral_2_Medications_MEDICATIONORDERS_7_1_4.ent'>
<!ENTITY ent-Service_Referral_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5                                                   	SYSTEM 'templates/Service_Referral_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5.ent'>
<!ENTITY ent-Service_Referral_2_PATHOLOGYTESTRESULT_7_1_6_1                                                                         	SYSTEM 'templates/Service_Referral_2_PATHOLOGYTESTRESULT_7_1_6_1.ent'>
<!ENTITY ent-Service_Referral_2_SERVICEREFERRALDETAIL_7_1_1                                                                         	SYSTEM 'templates/Service_Referral_2_SERVICEREFERRALDETAIL_7_1_1.ent'>
<!ENTITY ent-Service_Referral_2_ServiceReferral_7_1                                                                                 	SYSTEM 'templates/Service_Referral_2_ServiceReferral_7_1.ent'>
<!ENTITY ent-Service_Referral_3A_ADVERSEREACTIONS_7_1_3_custom                                                                      	SYSTEM 'templates/Service_Referral_3A_ADVERSEREACTIONS_7_1_3_custom.ent'>
<!ENTITY ent-Service_Referral_3A_ADVERSEREACTION_7_1_3_2                                                                            	SYSTEM 'templates/Service_Referral_3A_ADVERSEREACTION_7_1_3_2.ent'>
<!ENTITY ent-Service_Referral_3A_ADVERSEREACTION_7_1_3_2_custom                                                                     	SYSTEM 'templates/Service_Referral_3A_ADVERSEREACTION_7_1_3_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1                                                            	SYSTEM 'templates/Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1.ent'>
<!ENTITY ent-Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1_custom                                                     	SYSTEM 'templates/Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_6_2_2                                                                	SYSTEM 'templates/Service_Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_6_2_2.ent'>
<!ENTITY ent-Service_Referral_3A_EXCLUSIONSTATEMENT-ADVERSEREACTIONS_7_1_3_1                                                        	SYSTEM 'templates/Service_Referral_3A_EXCLUSIONSTATEMENT-ADVERSEREACTIONS_7_1_3_1.ent'>
<!ENTITY ent-Service_Referral_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_4_1                                                             	SYSTEM 'templates/Service_Referral_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_4_1.ent'>
<!ENTITY ent-Service_Referral_3A_Global_Optional_Code_Checks_custom                                                                 	SYSTEM 'templates/Service_Referral_3A_Global_Optional_Code_Checks_custom.ent'>
<!ENTITY ent-Service_Referral_3A_ImagingExaminationResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_2_1_1                     	SYSTEM 'templates/Service_Referral_3A_ImagingExaminationResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_2_1_1.ent'>
<!ENTITY ent-Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2                                                                   	SYSTEM 'templates/Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2.ent'>
<!ENTITY ent-Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2_custom                                                            	SYSTEM 'templates/Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_IndividualPathologyTestResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_1_2_1                	SYSTEM 'templates/Service_Referral_3A_IndividualPathologyTestResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_1_2_1.ent'>
<!ENTITY ent-Service_Referral_3A_InterpreterRequiredAlert_COMMUNICATIONALERT_7_1_1_3                                                	SYSTEM 'templates/Service_Referral_3A_InterpreterRequiredAlert_COMMUNICATIONALERT_7_1_1_3.ent'>
<!ENTITY ent-Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2                                                      	SYSTEM 'templates/Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2.ent'>
<!ENTITY ent-Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2_custom                                               	SYSTEM 'templates/Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part1                                                               	SYSTEM 'templates/Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part1.ent'>
<!ENTITY ent-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part2                                                               	SYSTEM 'templates/Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part2.ent'>
<!ENTITY ent-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part3                                                               	SYSTEM 'templates/Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part3.ent'>
<!ENTITY ent-Service_Referral_3A_Medications_MEDICATIONORDERS_7_1_4_custom                                                          	SYSTEM 'templates/Service_Referral_3A_Medications_MEDICATIONORDERS_7_1_4_custom.ent'>
<!ENTITY ent-Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4                                                                          	SYSTEM 'templates/Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4.ent'>
<!ENTITY ent-Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4_custom                                                                   	SYSTEM 'templates/Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4_custom.ent'>
<!ENTITY ent-Service_Referral_3A_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5_custom                                           	SYSTEM 'templates/Service_Referral_3A_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5_custom.ent'>
<!ENTITY ent-Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1                                                                        	SYSTEM 'templates/Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1.ent'>
<!ENTITY ent-Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1_custom                                                                 	SYSTEM 'templates/Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3                                            	SYSTEM 'templates/Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3.ent'>
<!ENTITY ent-Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3_custom                                     	SYSTEM 'templates/Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3_custom.ent'>
<!ENTITY ent-Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1                                                                          	SYSTEM 'templates/Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1.ent'>
<!ENTITY ent-Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1_custom                                                                   	SYSTEM 'templates/Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_PROCEDURE_7_1_5_2                                                                                  	SYSTEM 'templates/Service_Referral_3A_PROCEDURE_7_1_5_2.ent'>
<!ENTITY ent-Service_Referral_3A_PROCEDURE_7_1_5_2_custom                                                                           	SYSTEM 'templates/Service_Referral_3A_PROCEDURE_7_1_5_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2                                                                            	SYSTEM 'templates/Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2.ent'>
<!ENTITY ent-Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2_custom                                                                     	SYSTEM 'templates/Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1                                                                           	SYSTEM 'templates/Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1.ent'>
<!ENTITY ent-Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1_custom                                                                    	SYSTEM 'templates/Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_ResultGroupSpecimenDetail_SPECIMEN_7_1_6_1_2_2                                                     	SYSTEM 'templates/Service_Referral_3A_ResultGroupSpecimenDetail_SPECIMEN_7_1_6_1_2_2.ent'>
<!ENTITY ent-Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1                                                	SYSTEM 'templates/Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1.ent'>
<!ENTITY ent-Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1_custom                                         	SYSTEM 'templates/Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2                                                     	SYSTEM 'templates/Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2.ent'>
<!ENTITY ent-Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2_custom                                              	SYSTEM 'templates/Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2                                                        	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2_custom                                                 	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2                                                        	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2_custom                                                 	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1                                                               	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1_custom                                                        	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1                                                               	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1_custom                                                        	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDER_7_1_1_1_1_custom                                                                   	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDER_7_1_1_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1                                                                          	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1_custom                                                                   	SYSTEM 'templates/Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SERVICE_PROVIDER_7_1_6_3_1_custom                                                                  	SYSTEM 'templates/Service_Referral_3A_SERVICE_PROVIDER_7_1_6_3_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_SUBJECTOFCARE_6_1_1                                                                                	SYSTEM 'templates/Service_Referral_3A_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Service_Referral_3A_SUBJECTOFCARE_6_1_1_custom                                                                         	SYSTEM 'templates/Service_Referral_3A_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1                                                              	SYSTEM 'templates/Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1.ent'>
<!ENTITY ent-Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1_custom                                                       	SYSTEM 'templates/Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_3A_UNCATEGORISEDMEDICALHISTORYITEM_7_1_5_3                                                            	SYSTEM 'templates/Service_Referral_3A_UNCATEGORISEDMEDICALHISTORYITEM_7_1_5_3.ent'>
<!ENTITY ent-Service_Referral_3B_SNoMED_AMT_Attributes                                                                              	SYSTEM 'templates/Service_Referral_3B_SNoMED_AMT_Attributes.ent'>
<!ENTITY ent-Service_Referral_ANZSCO_Checks_Revision1                                                                               	SYSTEM 'templates/Service_Referral_ANZSCO_Checks_Revision1.ent'>
<!ENTITY ent-Service_Referral_ClinicalDocument_5_1                                                                                  	SYSTEM 'templates/Service_Referral_ClinicalDocument_5_1.ent'>
<!ENTITY ent-Service_Referral_ClinicalDocument_5_1_custom                                                                           	SYSTEM 'templates/Service_Referral_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-Service_Referral_CommonSectionsEntitlement_6_1_2and_or6_1_4_1and_or6_1_5_1and_or7_1_1_1_1_1and_or7_1_6_3_1_1           	SYSTEM 'templates/Service_Referral_CommonSectionsEntitlement_6_1_2and_or6_1_4_1and_or6_1_5_1and_or7_1_1_1_1_1and_or7_1_6_3_1_1.ent'>
<!ENTITY ent-Service_Referral_Custodian_5_1_3                                                                                       	SYSTEM 'templates/Service_Referral_Custodian_5_1_3.ent'>
<!ENTITY ent-Service_Referral_Custodian_5_1_3_custom                                                                                	SYSTEM 'templates/Service_Referral_Custodian_5_1_3_custom.ent'>
<!ENTITY ent-Service_Referral_DataType_Global_Checks                                                                                	SYSTEM 'templates/Service_Referral_DataType_Global_Checks.ent'>
<!ENTITY ent-Service_Referral_DOCUMENTAUTHOR_6_1_2                                                                                  	SYSTEM 'templates/Service_Referral_DOCUMENTAUTHOR_6_1_2.ent'>
<!ENTITY ent-Service_Referral_DOCUMENTAUTHOR_6_1_2_custom                                                                           	SYSTEM 'templates/Service_Referral_DOCUMENTAUTHOR_6_1_2_custom.ent'>
<!ENTITY ent-Service_Referral_DVA_File_Number_Checks                                                                                	SYSTEM 'templates/Service_Referral_DVA_File_Number_Checks.ent'>
<!ENTITY ent-Service_Referral_Employment_8_8_custom                                                                                 	SYSTEM 'templates/Service_Referral_Employment_8_8_custom.ent'>
<!ENTITY ent-Service_Referral_Entity_Identifier_Checks                                                                              	SYSTEM 'templates/Service_Referral_Entity_Identifier_Checks.ent'>
<!ENTITY ent-Service_Referral_Global_Checks                                                                                         	SYSTEM 'templates/Service_Referral_Global_Checks.ent'>
<!ENTITY ent-Service_Referral_Global_Checks_Exceptions_Option_04                                                                    	SYSTEM 'templates/Service_Referral_Global_Checks_Exceptions_Option_04.ent'>
<!ENTITY ent-Service_Referral_InformationRecipient_5_1_2                                                                            	SYSTEM 'templates/Service_Referral_InformationRecipient_5_1_2.ent'>
<!ENTITY ent-Service_Referral_InformationRecipient_5_1_2_custom                                                                     	SYSTEM 'templates/Service_Referral_InformationRecipient_5_1_2_custom.ent'>
<!ENTITY ent-Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2                                                               	SYSTEM 'templates/Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2.ent'>
<!ENTITY ent-Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2_custom                                                        	SYSTEM 'templates/Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2_custom.ent'>
<!ENTITY ent-Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1                                                                      	SYSTEM 'templates/Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1.ent'>
<!ENTITY ent-Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1_custom                                                               	SYSTEM 'templates/Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1_custom.ent'>
<!ENTITY ent-Service_Referral_LegalAuthenticator_5_1_1                                                                              	SYSTEM 'templates/Service_Referral_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-Service_Referral_LegalAuthenticator_5_1_1_custom                                                                       	SYSTEM 'templates/Service_Referral_LegalAuthenticator_5_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_Local_Identifier_Healthcare_Consumer_Part0                                                            	SYSTEM 'templates/Service_Referral_Local_Identifier_Healthcare_Consumer_Part0.ent'>
<!ENTITY ent-Service_Referral_Local_Identifier_Healthcare_Consumer_Part1                                                            	SYSTEM 'templates/Service_Referral_Local_Identifier_Healthcare_Consumer_Part1.ent'>
<!ENTITY ent-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Author                                                	SYSTEM 'templates/Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Author.ent'>
<!ENTITY ent-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_LA                                                    	SYSTEM 'templates/Service_Referral_Local_Identifier_Healthcare_Provider_Individual_LA.ent'>
<!ENTITY ent-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Part1                                                 	SYSTEM 'templates/Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Part1.ent'>
<!ENTITY ent-Service_Referral_mediaType_Packaging_Checks_P2P_Part1                                                                  	SYSTEM 'templates/Service_Referral_mediaType_Packaging_Checks_P2P_Part1.ent'>
<!ENTITY ent-Service_Referral_Participation_Period                                                                                  	SYSTEM 'templates/Service_Referral_Participation_Period.ent'>
<!ENTITY ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2           	SYSTEM 'templates/Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2.ent'>
<!ENTITY ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2_custom    	SYSTEM 'templates/Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2_custom.ent'>
<!ENTITY ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2                        	SYSTEM 'templates/Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2.ent'>
<!ENTITY ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2_custom                 	SYSTEM 'templates/Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2_custom.ent'>
<!ENTITY ent-Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3                                                      	SYSTEM 'templates/Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3.ent'>
<!ENTITY ent-Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3_custom                                               	SYSTEM 'templates/Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3_custom.ent'>
<!ENTITY ent-Service_Referral_PATIENTNOMINATEDCONTACT_6_1_3_custom                                                                  	SYSTEM 'templates/Service_Referral_PATIENTNOMINATEDCONTACT_6_1_3_custom.ent'>
<!ENTITY ent-Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2                                                           	SYSTEM 'templates/Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2.ent'>
<!ENTITY ent-Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2_custom                                                    	SYSTEM 'templates/Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2_custom.ent'>
<!ENTITY ent-Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1                                                                  	SYSTEM 'templates/Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1.ent'>
<!ENTITY ent-Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1_custom                                                           	SYSTEM 'templates/Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1_custom.ent'>
<!ENTITY ent-Service_Referral_PRIMARY_CARE_PROVIDER_6_1_4_custom                                                                    	SYSTEM 'templates/Service_Referral_PRIMARY_CARE_PROVIDER_6_1_4_custom.ent'>
<!ENTITY ent-Service_Referral_SUBJECTOFCARE_6_1_1                                                                                   	SYSTEM 'templates/Service_Referral_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Service_Referral_SUBJECTOFCARE_6_1_1_custom                                                                            	SYSTEM 'templates/Service_Referral_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Service_Referral_targetSiteCode_272741003                                                                              	SYSTEM 'templates/Service_Referral_targetSiteCode_272741003.ent'>
<!ENTITY ent-Service_Referral_Xml_Stylesheet_Exclusion                                                                              	SYSTEM 'templates/Service_Referral_Xml_Stylesheet_Exclusion.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 3B conformance to Service Referral CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-Service_Referral_1B_CDA_Narrative-errors"/>
	<active pattern = "p-Service_Referral_1B_CDA_Narrative_Nested_Sections-errors"/>
	<active pattern = "p-Service_Referral_2_AdministrativeObservations_4-errors"/>
	<active pattern = "p-Service_Referral_2_ADVERSEREACTIONS_7_1_3-errors"/>
	<active pattern = "p-Service_Referral_2_CURRENTSERVICES_7_1_2-errors"/>
	<active pattern = "p-Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6-errors"/>
	<active pattern = "p-Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6_custom-errors"/>
	<active pattern = "p-Service_Referral_2_Global_Optional_Code_Checks_custom-errors"/>
	<active pattern = "p-Service_Referral_2_IMAGINGEXAMINATIONRESULT_7_1_6_2-errors"/>
	<active pattern = "p-Service_Referral_2_Medications_MEDICATIONORDERS_7_1_4-errors"/>
	<active pattern = "p-Service_Referral_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5-errors"/>
	<active pattern = "p-Service_Referral_2_PATHOLOGYTESTRESULT_7_1_6_1-errors"/>
	<active pattern = "p-Service_Referral_2_SERVICEREFERRALDETAIL_7_1_1-errors"/>
	<active pattern = "p-Service_Referral_2_ServiceReferral_7_1-errors"/>
	<active pattern = "p-Service_Referral_3A_ADVERSEREACTIONS_7_1_3_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_ADVERSEREACTION_7_1_3_2-errors"/>
	<active pattern = "p-Service_Referral_3A_ADVERSEREACTION_7_1_3_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1-errors"/>
	<active pattern = "p-Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_6_2_2-errors"/>
	<active pattern = "p-Service_Referral_3A_EXCLUSIONSTATEMENT-ADVERSEREACTIONS_7_1_3_1-errors"/>
	<active pattern = "p-Service_Referral_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_4_1-errors"/>
	<active pattern = "p-Service_Referral_3A_Global_Optional_Code_Checks_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_ImagingExaminationResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_2_1_1-errors"/>
	<active pattern = "p-Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2-errors"/>
	<active pattern = "p-Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_IndividualPathologyTestResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_1_2_1-errors"/>
	<active pattern = "p-Service_Referral_3A_InterpreterRequiredAlert_COMMUNICATIONALERT_7_1_1_3-errors"/>
	<active pattern = "p-Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2-errors"/>
	<active pattern = "p-Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part1-errors"/>
	<active pattern = "p-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part2-errors"/>
	<active pattern = "p-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part3-errors"/>
	<active pattern = "p-Service_Referral_3A_Medications_MEDICATIONORDERS_7_1_4_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4-errors"/>
	<active pattern = "p-Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1-errors"/>
	<active pattern = "p-Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3-errors"/>
	<active pattern = "p-Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1-errors"/>
	<active pattern = "p-Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_PROCEDURE_7_1_5_2-errors"/>
	<active pattern = "p-Service_Referral_3A_PROCEDURE_7_1_5_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2-errors"/>
	<active pattern = "p-Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1-errors"/>
	<active pattern = "p-Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_ResultGroupSpecimenDetail_SPECIMEN_7_1_6_1_2_2-errors"/>
	<active pattern = "p-Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1-errors"/>
	<active pattern = "p-Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2-errors"/>
	<active pattern = "p-Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDER_7_1_1_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SERVICE_PROVIDER_7_1_6_3_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Service_Referral_3A_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1-errors"/>
	<active pattern = "p-Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_3A_UNCATEGORISEDMEDICALHISTORYITEM_7_1_5_3-errors"/>
	<active pattern = "p-Service_Referral_3B_SNoMED_AMT_Attributes-errors"/>
	<active pattern = "p-Service_Referral_ANZSCO_Checks_Revision1-errors"/>
	<active pattern = "p-Service_Referral_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-Service_Referral_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-Service_Referral_CommonSectionsEntitlement_6_1_2and_or6_1_4_1and_or6_1_5_1and_or7_1_1_1_1_1and_or7_1_6_3_1_1-errors"/>
	<active pattern = "p-Service_Referral_Custodian_5_1_3-errors"/>
	<active pattern = "p-Service_Referral_Custodian_5_1_3_custom-errors"/>
	<active pattern = "p-Service_Referral_DataType_Global_Checks-errors"/>
	<active pattern = "p-Service_Referral_DOCUMENTAUTHOR_6_1_2-errors"/>
	<active pattern = "p-Service_Referral_DOCUMENTAUTHOR_6_1_2_custom-errors"/>
	<active pattern = "p-Service_Referral_DVA_File_Number_Checks-errors"/>
	<active pattern = "p-Service_Referral_Employment_8_8_custom-errors"/>
	<active pattern = "p-Service_Referral_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-Service_Referral_Global_Checks-errors"/>
	<active pattern = "p-Service_Referral_Global_Checks_Exceptions_Option_04-errors"/>
	<active pattern = "p-Service_Referral_InformationRecipient_5_1_2-errors"/>
	<active pattern = "p-Service_Referral_InformationRecipient_5_1_2_custom-errors"/>
	<active pattern = "p-Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2-errors"/>
	<active pattern = "p-Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2_custom-errors"/>
	<active pattern = "p-Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1-errors"/>
	<active pattern = "p-Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1_custom-errors"/>
	<active pattern = "p-Service_Referral_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-Service_Referral_LegalAuthenticator_5_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_Local_Identifier_Healthcare_Consumer_Part0-errors"/>
	<active pattern = "p-Service_Referral_Local_Identifier_Healthcare_Consumer_Part1-errors"/>
	<active pattern = "p-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Author-errors"/>
	<active pattern = "p-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_LA-errors"/>
	<active pattern = "p-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Part1-errors"/>
	<active pattern = "p-Service_Referral_mediaType_Packaging_Checks_P2P_Part1-errors"/>
	<active pattern = "p-Service_Referral_Participation_Period-errors"/>
	<active pattern = "p-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2-errors"/>
	<active pattern = "p-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2_custom-errors"/>
	<active pattern = "p-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2-errors"/>
	<active pattern = "p-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2_custom-errors"/>
	<active pattern = "p-Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3-errors"/>
	<active pattern = "p-Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3_custom-errors"/>
	<active pattern = "p-Service_Referral_PATIENTNOMINATEDCONTACT_6_1_3_custom-errors"/>
	<active pattern = "p-Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2-errors"/>
	<active pattern = "p-Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2_custom-errors"/>
	<active pattern = "p-Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1-errors"/>
	<active pattern = "p-Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1_custom-errors"/>
	<active pattern = "p-Service_Referral_PRIMARY_CARE_PROVIDER_6_1_4_custom-errors"/>
	<active pattern = "p-Service_Referral_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Service_Referral_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Service_Referral_targetSiteCode_272741003-errors"/>
	<active pattern = "p-Service_Referral_Xml_Stylesheet_Exclusion-errors"/>


</phase>


	&ent-Service_Referral_1B_CDA_Narrative;
	&ent-Service_Referral_1B_CDA_Narrative_Nested_Sections;
	&ent-Service_Referral_2_AdministrativeObservations_4;
	&ent-Service_Referral_2_ADVERSEREACTIONS_7_1_3;
	&ent-Service_Referral_2_CURRENTSERVICES_7_1_2;
	&ent-Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6;
	&ent-Service_Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_6_custom;
	&ent-Service_Referral_2_Global_Optional_Code_Checks_custom;
	&ent-Service_Referral_2_IMAGINGEXAMINATIONRESULT_7_1_6_2;
	&ent-Service_Referral_2_Medications_MEDICATIONORDERS_7_1_4;
	&ent-Service_Referral_2_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5;
	&ent-Service_Referral_2_PATHOLOGYTESTRESULT_7_1_6_1;
	&ent-Service_Referral_2_SERVICEREFERRALDETAIL_7_1_1;
	&ent-Service_Referral_2_ServiceReferral_7_1;
	&ent-Service_Referral_3A_ADVERSEREACTIONS_7_1_3_custom;
	&ent-Service_Referral_3A_ADVERSEREACTION_7_1_3_2;
	&ent-Service_Referral_3A_ADVERSEREACTION_7_1_3_2_custom;
	&ent-Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1;
	&ent-Service_Referral_3A_CurrentService_REQUESTEDSERVICE_7_1_2_1_custom;
	&ent-Service_Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_6_2_2;
	&ent-Service_Referral_3A_EXCLUSIONSTATEMENT-ADVERSEREACTIONS_7_1_3_1;
	&ent-Service_Referral_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_4_1;
	&ent-Service_Referral_3A_Global_Optional_Code_Checks_custom;
	&ent-Service_Referral_3A_ImagingExaminationResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_2_1_1;
	&ent-Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2;
	&ent-Service_Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_6_2_custom;
	&ent-Service_Referral_3A_IndividualPathologyTestResultValueReferenceRanges_REFERENCERANGEDETAILS_7_1_6_1_2_1;
	&ent-Service_Referral_3A_InterpreterRequiredAlert_COMMUNICATIONALERT_7_1_1_3;
	&ent-Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2;
	&ent-Service_Referral_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_4_2_custom;
	&ent-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part1;
	&ent-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part2;
	&ent-Service_Referral_3A_mediaType_Packaging_Checks_P2P_Part3;
	&ent-Service_Referral_3A_Medications_MEDICATIONORDERS_7_1_4_custom;
	&ent-Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4;
	&ent-Service_Referral_3A_OTHERALERTS_ALERT_7_1_1_4_custom;
	&ent-Service_Referral_3A_PastandCurrentMedicalHistory_MEDICALHISTORY_7_1_5_custom;
	&ent-Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1;
	&ent-Service_Referral_3A_PATHOLOGYTESTRESULT_7_1_6_1_custom;
	&ent-Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3;
	&ent-Service_Referral_3A_PendingDiagnosticInvestigation_REQUESTEDSERVICE_7_1_6_3_custom;
	&ent-Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1;
	&ent-Service_Referral_3A_PROBLEM_DIAGNOSIS_7_1_5_1_custom;
	&ent-Service_Referral_3A_PROCEDURE_7_1_5_2;
	&ent-Service_Referral_3A_PROCEDURE_7_1_5_2_custom;
	&ent-Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2;
	&ent-Service_Referral_3A_RELATEDDOCUMENT_7_1_1_2_custom;
	&ent-Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1;
	&ent-Service_Referral_3A_REQUESTEDSERVICE_7_1_1_1_custom;
	&ent-Service_Referral_3A_ResultGroupSpecimenDetail_SPECIMEN_7_1_6_1_2_2;
	&ent-Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1;
	&ent-Service_Referral_3A_ResultGroup_IMAGINGEXAMINATIONRESULTGROUP_7_1_6_2_1_custom;
	&ent-Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2;
	&ent-Service_Referral_3A_ResultGroup_PATHOLOGYTESTRESULTGROUP_7_1_6_1_2_custom;
	&ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2;
	&ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_1_1_1_2_custom;
	&ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2;
	&ent-Service_Referral_3A_SERVICEPROVIDERasanORGANISATION_7_1_6_3_1_2_custom;
	&ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1;
	&ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_1_1_1_1_custom;
	&ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1;
	&ent-Service_Referral_3A_SERVICEPROVIDERasaPERSON_7_1_6_3_1_1_custom;
	&ent-Service_Referral_3A_SERVICEPROVIDER_7_1_1_1_1_custom;
	&ent-Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1;
	&ent-Service_Referral_3A_SERVICEPROVIDER_7_1_2_1_1_custom;
	&ent-Service_Referral_3A_SERVICE_PROVIDER_7_1_6_3_1_custom;
	&ent-Service_Referral_3A_SUBJECTOFCARE_6_1_1;
	&ent-Service_Referral_3A_SUBJECTOFCARE_6_1_1_custom;
	&ent-Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1;
	&ent-Service_Referral_3A_TestSpecimenDetail_SPECIMEN_7_1_6_1_1_custom;
	&ent-Service_Referral_3A_UNCATEGORISEDMEDICALHISTORYITEM_7_1_5_3;
	&ent-Service_Referral_3B_SNoMED_AMT_Attributes;
	&ent-Service_Referral_ANZSCO_Checks_Revision1;
	&ent-Service_Referral_ClinicalDocument_5_1;
	&ent-Service_Referral_ClinicalDocument_5_1_custom;
	&ent-Service_Referral_CommonSectionsEntitlement_6_1_2and_or6_1_4_1and_or6_1_5_1and_or7_1_1_1_1_1and_or7_1_6_3_1_1;
	&ent-Service_Referral_Custodian_5_1_3;
	&ent-Service_Referral_Custodian_5_1_3_custom;
	&ent-Service_Referral_DataType_Global_Checks;
	&ent-Service_Referral_DOCUMENTAUTHOR_6_1_2;
	&ent-Service_Referral_DOCUMENTAUTHOR_6_1_2_custom;
	&ent-Service_Referral_DVA_File_Number_Checks;
	&ent-Service_Referral_Employment_8_8_custom;
	&ent-Service_Referral_Entity_Identifier_Checks;
	&ent-Service_Referral_Global_Checks;
	&ent-Service_Referral_Global_Checks_Exceptions_Option_04;
	&ent-Service_Referral_InformationRecipient_5_1_2;
	&ent-Service_Referral_InformationRecipient_5_1_2_custom;
	&ent-Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2;
	&ent-Service_Referral_INTERESTEDPARTYasanORGANISATION_6_1_5_2_custom;
	&ent-Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1;
	&ent-Service_Referral_INTERESTEDPARTYasaPERSON_6_1_5_1_custom;
	&ent-Service_Referral_LegalAuthenticator_5_1_1;
	&ent-Service_Referral_LegalAuthenticator_5_1_1_custom;
	&ent-Service_Referral_Local_Identifier_Healthcare_Consumer_Part0;
	&ent-Service_Referral_Local_Identifier_Healthcare_Consumer_Part1;
	&ent-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Author;
	&ent-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_LA;
	&ent-Service_Referral_Local_Identifier_Healthcare_Provider_Individual_Part1;
	&ent-Service_Referral_mediaType_Packaging_Checks_P2P_Part1;
	&ent-Service_Referral_Participation_Period;
	&ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2;
	&ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-HealthcareProvider_NotaHealthcareProvider_6_1_3_1or6_1_3_2_custom;
	&ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2;
	&ent-Service_Referral_PATIENTNOMINATEDCONTACTasaPERSON-NotaHealthcareorHumanServicesProvider_6_1_3_2_custom;
	&ent-Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3;
	&ent-Service_Referral_PATIENTNOMINATEDCONTACTSasanORGANISATION_6_1_3_3_custom;
	&ent-Service_Referral_PATIENTNOMINATEDCONTACT_6_1_3_custom;
	&ent-Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2;
	&ent-Service_Referral_PRIMARYCAREPROVIDERasanORGANISATION_6_1_4_2_custom;
	&ent-Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1;
	&ent-Service_Referral_PRIMARYCAREPROVIDERasaPERSON_6_1_4_1_custom;
	&ent-Service_Referral_PRIMARY_CARE_PROVIDER_6_1_4_custom;
	&ent-Service_Referral_SUBJECTOFCARE_6_1_1;
	&ent-Service_Referral_SUBJECTOFCARE_6_1_1_custom;
	&ent-Service_Referral_targetSiteCode_272741003;
	&ent-Service_Referral_Xml_Stylesheet_Exclusion;


</schema>
