<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-Diagnostic_Imaging_Report_1B_CDA_Narrative                                             	SYSTEM 'templates/Diagnostic_Imaging_Report_1B_CDA_Narrative.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGINGREPORT_7_1                                	SYSTEM 'templates/Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGINGREPORT_7_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGING_7_1_1                                    	SYSTEM 'templates/Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGING_7_1_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_2_Global_Code_Checks_custom                                  	SYSTEM 'templates/Diagnostic_Imaging_Report_2_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_2_IMAGINGEXAMINATIONRESULT_7_1_1_1                           	SYSTEM 'templates/Diagnostic_Imaging_Report_2_IMAGINGEXAMINATIONRESULT_7_1_1_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2                               	SYSTEM 'templates/Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2_custom                        	SYSTEM 'templates/Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4                 	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4_custom          	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_ExaminationDetails_EXAMINATIONREQUESTDETAILS_7_1_1_1_1    	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_ExaminationDetails_EXAMINATIONREQUESTDETAILS_7_1_1_1_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_Global_Checks                                             	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_Global_Checks.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_Global_Code_Checks_custom                                 	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1                          	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1_custom                   	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3                                   	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom                            	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_RelatedImages_RELATEDINFORMATION_7_1_1_1_2                	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_RelatedImages_RELATEDINFORMATION_7_1_1_1_2.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2                              	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2_custom                       	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1                                       	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1_custom                                	SYSTEM 'templates/Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_AdministrativeObservations_4                                 	SYSTEM 'templates/Diagnostic_Imaging_Report_AdministrativeObservations_4.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_ANZSCO_Checks_Revision1                                      	SYSTEM 'templates/Diagnostic_Imaging_Report_ANZSCO_Checks_Revision1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_ClinicalDocument_5_1                                         	SYSTEM 'templates/Diagnostic_Imaging_Report_ClinicalDocument_5_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_ClinicalDocument_5_1_custom                                  	SYSTEM 'templates/Diagnostic_Imaging_Report_ClinicalDocument_5_1_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_CommonSectionsEmployment_6_1_2_and_or_7_1_1_2_custom         	SYSTEM 'templates/Diagnostic_Imaging_Report_CommonSectionsEmployment_6_1_2_and_or_7_1_1_2_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Custodian_5_1_2                                              	SYSTEM 'templates/Diagnostic_Imaging_Report_Custodian_5_1_2.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Custodian_5_1_2_custom                                       	SYSTEM 'templates/Diagnostic_Imaging_Report_Custodian_5_1_2_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_DataType_Global_Checks                                       	SYSTEM 'templates/Diagnostic_Imaging_Report_DataType_Global_Checks.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_DocumentAuthor_6_1_2                                         	SYSTEM 'templates/Diagnostic_Imaging_Report_DocumentAuthor_6_1_2.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_DocumentAuthor_6_1_2_custom                                  	SYSTEM 'templates/Diagnostic_Imaging_Report_DocumentAuthor_6_1_2_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_DVA_File_Number_Checks                                       	SYSTEM 'templates/Diagnostic_Imaging_Report_DVA_File_Number_Checks.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Entity_Identifier_Checks                                     	SYSTEM 'templates/Diagnostic_Imaging_Report_Entity_Identifier_Checks.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Global_Checks                                                	SYSTEM 'templates/Diagnostic_Imaging_Report_Global_Checks.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Global_Checks_Exceptions_Option_04                           	SYSTEM 'templates/Diagnostic_Imaging_Report_Global_Checks_Exceptions_Option_04.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Global_Code_Checks_custom                                    	SYSTEM 'templates/Diagnostic_Imaging_Report_Global_Code_Checks_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part1                  	SYSTEM 'templates/Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part2                  	SYSTEM 'templates/Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part3                  	SYSTEM 'templates/Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part3.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_HPI-I_Enforced                                               	SYSTEM 'templates/Diagnostic_Imaging_Report_HPI-I_Enforced.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part1                    	SYSTEM 'templates/Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part2                    	SYSTEM 'templates/Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part2.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_LegalAuthenticator_5_1_1                                     	SYSTEM 'templates/Diagnostic_Imaging_Report_LegalAuthenticator_5_1_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3                                           	SYSTEM 'templates/Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3_custom                                    	SYSTEM 'templates/Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Packaging_Requirements                                       	SYSTEM 'templates/Diagnostic_Imaging_Report_Packaging_Requirements.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Participation_Period                                         	SYSTEM 'templates/Diagnostic_Imaging_Report_Participation_Period.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_REQUESTER_6_1_4                                              	SYSTEM 'templates/Diagnostic_Imaging_Report_REQUESTER_6_1_4.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_REQUESTER_6_1_4_custom                                       	SYSTEM 'templates/Diagnostic_Imaging_Report_REQUESTER_6_1_4_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1                                          	SYSTEM 'templates/Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1_custom                                   	SYSTEM 'templates/Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1_custom.ent'>
<!ENTITY ent-Diagnostic_Imaging_Report_Xml_Stylesheet_Exclusion                                     	SYSTEM 'templates/Diagnostic_Imaging_Report_Xml_Stylesheet_Exclusion.ent'>
]>


<schema xmlns = "http://www.ascc.net/xml/schematron"
	xmlns:cda = "urn:hl7-org:v3"
	xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
	xmlns:xs = "http://www.w3.org/2001/XMLSchema"
	xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">


<title>Schematron schema for validating 3A conformance to Diagnostic Imaging Report CDA documents</title>
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


<phase id = "errors">


	<active pattern = "p-Diagnostic_Imaging_Report_1B_CDA_Narrative-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGINGREPORT_7_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGING_7_1_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_2_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_2_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_ExaminationDetails_EXAMINATIONREQUESTDETAILS_7_1_1_1_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_Global_Checks-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_RelatedImages_RELATEDINFORMATION_7_1_1_1_2-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_AdministrativeObservations_4-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_ANZSCO_Checks_Revision1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_ClinicalDocument_5_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_ClinicalDocument_5_1_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_CommonSectionsEmployment_6_1_2_and_or_7_1_1_2_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Custodian_5_1_2-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Custodian_5_1_2_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_DataType_Global_Checks-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_DocumentAuthor_6_1_2-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_DocumentAuthor_6_1_2_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_DVA_File_Number_Checks-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Entity_Identifier_Checks-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Global_Checks-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Global_Checks_Exceptions_Option_04-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Global_Code_Checks_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part3-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_HPI-I_Enforced-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part2-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_LegalAuthenticator_5_1_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Packaging_Requirements-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Participation_Period-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_REQUESTER_6_1_4-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_REQUESTER_6_1_4_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1_custom-errors"/>
	<active pattern = "p-Diagnostic_Imaging_Report_Xml_Stylesheet_Exclusion-errors"/>


</phase>


	&ent-Diagnostic_Imaging_Report_1B_CDA_Narrative;
	&ent-Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGINGREPORT_7_1;
	&ent-Diagnostic_Imaging_Report_2_DIAGNOSTICIMAGING_7_1_1;
	&ent-Diagnostic_Imaging_Report_2_Global_Code_Checks_custom;
	&ent-Diagnostic_Imaging_Report_2_IMAGINGEXAMINATIONRESULT_7_1_1_1;
	&ent-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2;
	&ent-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2_custom;
	&ent-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4;
	&ent-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4_custom;
	&ent-Diagnostic_Imaging_Report_3A_ExaminationDetails_EXAMINATIONREQUESTDETAILS_7_1_1_1_1;
	&ent-Diagnostic_Imaging_Report_3A_Global_Checks;
	&ent-Diagnostic_Imaging_Report_3A_Global_Code_Checks_custom;
	&ent-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1;
	&ent-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1_custom;
	&ent-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3;
	&ent-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom;
	&ent-Diagnostic_Imaging_Report_3A_RelatedImages_RELATEDINFORMATION_7_1_1_1_2;
	&ent-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2;
	&ent-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2_custom;
	&ent-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1;
	&ent-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1_custom;
	&ent-Diagnostic_Imaging_Report_AdministrativeObservations_4;
	&ent-Diagnostic_Imaging_Report_ANZSCO_Checks_Revision1;
	&ent-Diagnostic_Imaging_Report_ClinicalDocument_5_1;
	&ent-Diagnostic_Imaging_Report_ClinicalDocument_5_1_custom;
	&ent-Diagnostic_Imaging_Report_CommonSectionsEmployment_6_1_2_and_or_7_1_1_2_custom;
	&ent-Diagnostic_Imaging_Report_Custodian_5_1_2;
	&ent-Diagnostic_Imaging_Report_Custodian_5_1_2_custom;
	&ent-Diagnostic_Imaging_Report_DataType_Global_Checks;
	&ent-Diagnostic_Imaging_Report_DocumentAuthor_6_1_2;
	&ent-Diagnostic_Imaging_Report_DocumentAuthor_6_1_2_custom;
	&ent-Diagnostic_Imaging_Report_DVA_File_Number_Checks;
	&ent-Diagnostic_Imaging_Report_Entity_Identifier_Checks;
	&ent-Diagnostic_Imaging_Report_Global_Checks;
	&ent-Diagnostic_Imaging_Report_Global_Checks_Exceptions_Option_04;
	&ent-Diagnostic_Imaging_Report_Global_Code_Checks_custom;
	&ent-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part1;
	&ent-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part2;
	&ent-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part3;
	&ent-Diagnostic_Imaging_Report_HPI-I_Enforced;
	&ent-Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part1;
	&ent-Diagnostic_Imaging_Report_IHI_Common_Conformance_Requirements_Part2;
	&ent-Diagnostic_Imaging_Report_LegalAuthenticator_5_1_1;
	&ent-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3;
	&ent-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3_custom;
	&ent-Diagnostic_Imaging_Report_Packaging_Requirements;
	&ent-Diagnostic_Imaging_Report_Participation_Period;
	&ent-Diagnostic_Imaging_Report_REQUESTER_6_1_4;
	&ent-Diagnostic_Imaging_Report_REQUESTER_6_1_4_custom;
	&ent-Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1;
	&ent-Diagnostic_Imaging_Report_SUBJECTOFCARE_6_1_1_custom;
	&ent-Diagnostic_Imaging_Report_Xml_Stylesheet_Exclusion;


</schema>
