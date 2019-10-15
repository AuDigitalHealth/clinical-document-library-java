<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
<!ENTITY ent-e-Referral_Author                                                       SYSTEM 'templates/e-Referral_Author.ent'>
<!ENTITY ent-e-Referral_Clinical_Document                                            SYSTEM 'templates/e-Referral_Clinical_Document.ent'>
<!ENTITY ent-e-Referral_Custodian                                                    SYSTEM 'templates/e-Referral_Custodian.ent'>
<!ENTITY ent-e-Referral_DataType_Global_Checks                                       SYSTEM 'templates/e-Referral_DataType_Global_Checks.ent'>
<!ENTITY ent-e-Referral_e-Referral                                                   SYSTEM 'templates/e-Referral_e-Referral.ent'>
<!ENTITY ent-e-Referral_Entity_Identifier_Checks                                     SYSTEM 'templates/e-Referral_Entity_Identifier_Checks.ent'>
<!ENTITY ent-e-Referral_Global_Checks                                                SYSTEM 'templates/e-Referral_Global_Checks.ent'>
<!ENTITY ent-e-Referral_Global_Code_Checks                                           SYSTEM 'templates/e-Referral_Global_Code_Checks.ent'>
<!ENTITY ent-e-Referral_HPI-I_Enforced                                               SYSTEM 'templates/e-Referral_HPI-I_Enforced.ent'>
<!ENTITY ent-e-Referral_IHI_Common_Conformance_Requirements                          SYSTEM 'templates/e-Referral_IHI_Common_Conformance_Requirements.ent'>
<!ENTITY ent-e-Referral_Information_Recipient                                        SYSTEM 'templates/e-Referral_Information_Recipient.ent'>
<!ENTITY ent-e-Referral_Legal_Authenticator                                          SYSTEM 'templates/e-Referral_Legal_Authenticator.ent'>
<!ENTITY ent-e-Referral_Patient_Nominated_Contacts_Organisation                      SYSTEM 'templates/e-Referral_Patient_Nominated_Contacts_Organisation.ent'>
<!ENTITY ent-e-Referral_Patient_Nominated_Contacts_Person                            SYSTEM 'templates/e-Referral_Patient_Nominated_Contacts_Person.ent'>
<!ENTITY ent-e-Referral_Referee                                                      SYSTEM 'templates/e-Referral_Referee.ent'>
<!ENTITY ent-e-Referral_Referee_Person                                               SYSTEM 'templates/e-Referral_Referee_Person.ent'>
<!ENTITY ent-e-Referral_Referee_Organisation                                         SYSTEM 'templates/e-Referral_Referee_Organisation.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Address                                      SYSTEM 'templates/e-Referral_Subject_Of_Care_Address.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Administrative_Gender_Code                   SYSTEM 'templates/e-Referral_Subject_Of_Care_Administrative_Gender_Code.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Birth_Order                                  SYSTEM 'templates/e-Referral_Subject_Of_Care_Birth_Order.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Country_Of_Birth                             SYSTEM 'templates/e-Referral_Subject_Of_Care_Country_Of_Birth.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Date_Of_Birth                                SYSTEM 'templates/e-Referral_Subject_Of_Care_Date_Of_Birth.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Date_Of_Death                                SYSTEM 'templates/e-Referral_Subject_Of_Care_Date_Of_Death.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Electronic_Communication_Detail              SYSTEM 'templates/e-Referral_Subject_Of_Care_Electronic_Communication_Detail.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Entity_Identifier_Participant                SYSTEM 'templates/e-Referral_Subject_Of_Care_Entity_Identifier_Participant.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_id                                           SYSTEM 'templates/e-Referral_Subject_Of_Care_id.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Indigenous_Status                            SYSTEM 'templates/e-Referral_Subject_Of_Care_Indigenous_Status.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Participant                                  SYSTEM 'templates/e-Referral_Subject_Of_Care_Participant.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Patient_Role                                 SYSTEM 'templates/e-Referral_Subject_Of_Care_Patient_Role.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_Person_Name                                  SYSTEM 'templates/e-Referral_Subject_Of_Care_Person_Name.ent'>
<!ENTITY ent-e-Referral_Subject_Of_Care_State_Of_Birth                               SYSTEM 'templates/e-Referral_Subject_Of_Care_State_Of_Birth.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Address                                             SYSTEM 'templates/e-Referral_Usual_GP_Address.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Department_Unit                                     SYSTEM 'templates/e-Referral_Usual_GP_Department_Unit.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Electronic_Communication_Details                    SYSTEM 'templates/e-Referral_Usual_GP_Electronic_Communication_Details.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Employer_Organisation                               SYSTEM 'templates/e-Referral_Usual_GP_Employer_Organisation.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Employment_Detail                                   SYSTEM 'templates/e-Referral_Usual_GP_Employment_Detail.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Entity_Identifier_Employer_Organisation             SYSTEM 'templates/e-Referral_Usual_GP_Entity_Identifier_Employer_Organisation.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Entity_Identifier_Participant                       SYSTEM 'templates/e-Referral_Usual_GP_Entity_Identifier_Participant.ent'>
<!ENTITY ent-e-Referral_Usual_GP_id                                                  SYSTEM 'templates/e-Referral_Usual_GP_id.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Organisation_Name                                   SYSTEM 'templates/e-Referral_Usual_GP_Organisation_Name.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Organisation_Name_Usage                             SYSTEM 'templates/e-Referral_Usual_GP_Organisation_Name_Usage.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Organisation_Role                                   SYSTEM 'templates/e-Referral_Usual_GP_Organisation_Role.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Participant                                         SYSTEM 'templates/e-Referral_Usual_GP_Participant.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Participation_Type                                  SYSTEM 'templates/e-Referral_Usual_GP_Participation_Type.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Person_Name                                         SYSTEM 'templates/e-Referral_Usual_GP_Person_Name.ent'>
<!ENTITY ent-e-Referral_Usual_GP_Role                                                SYSTEM 'templates/e-Referral_Usual_GP_Role.ent'>

<!ENTITY ent-e-Referral_1B_CDA_Narrative                                            SYSTEM 'templates/e-Referral_1B_CDA_Narrative.ent'>

<!ENTITY ent-e-Referral_2_Administrative_Observations                                SYSTEM 'templates/e-Referral_2_Administrative_Observations.ent'>
<!ENTITY ent-e-Referral_2_Adverse_Reactions                                          SYSTEM 'templates/e-Referral_2_Adverse_Reactions.ent'>
<!ENTITY ent-e-Referral_2_Common_Sections_Mandatory_Paths                            SYSTEM 'templates/e-Referral_2_Common_Sections_Mandatory_Paths.ent'>
<!ENTITY ent-e-Referral_2_Diagnostic_Investigations                                  SYSTEM 'templates/e-Referral_2_Diagnostic_Investigations.ent'>
<!ENTITY ent-e-Referral_2_Global_Code_Checks                                         SYSTEM 'templates/e-Referral_2_Global_Code_Checks.ent'>
<!ENTITY ent-e-Referral_2_Imaging_Examination_Result                                 SYSTEM 'templates/e-Referral_2_Imaging_Examination_Result.ent'>
<!ENTITY ent-e-Referral_2_Medications                                                SYSTEM 'templates/e-Referral_2_Medications.ent'>
<!ENTITY ent-e-Referral_2_Other_Test_Result                                          SYSTEM 'templates/e-Referral_2_Other_Test_Result.ent'>
<!ENTITY ent-e-Referral_2_Pathology_Test_Result                                      SYSTEM 'templates/e-Referral_2_Pathology_Test_Result.ent'>
<!ENTITY ent-e-Referral_2_Referral_Detail                                            SYSTEM 'templates/e-Referral_2_Referral_Detail.ent'>
<!ENTITY ent-e-Referral_2_Requested_Service                                          SYSTEM 'templates/e-Referral_2_Requested_Service.ent'>

<!ENTITY ent-e-Referral_3A_Subject_Of_Care_Age                                       SYSTEM 'templates/e-Referral_3A_Subject_Of_Care_Age.ent'>
<!ENTITY ent-e-Referral_3A_Subject_Of_Care_Age_Accuracy_Indicator                    SYSTEM 'templates/e-Referral_3A_Subject_Of_Care_Age_Accuracy_Indicator.ent'>
<!ENTITY ent-e-Referral_3A_Subject_Of_Care_Birth_Plurality                           SYSTEM 'templates/e-Referral_3A_Subject_Of_Care_Birth_Plurality.ent'>
<!ENTITY ent-e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator          SYSTEM 'templates/e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator.ent'>
<!ENTITY ent-e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age      SYSTEM 'templates/e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age.ent'>
<!ENTITY ent-e-Referral_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator          SYSTEM 'templates/e-Referral_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator.ent'>
<!ENTITY ent-e-Referral_3A_Subject_Of_Care_Entitlement                               SYSTEM 'templates/e-Referral_3A_Subject_Of_Care_Entitlement.ent'>

<!ENTITY ent-e-Referral_3A_Adverse_Reactions                                         SYSTEM 'templates/e-Referral_3A_Adverse_Reactions.ent'>
<!ENTITY ent-e-Referral_3A_Common_Sections                                           SYSTEM 'templates/e-Referral_3A_Common_Sections.ent'>
<!ENTITY ent-e-Referral_3A_Common_Sections_Clinical_Information_Provided             SYSTEM 'templates/e-Referral_3A_Common_Sections_Clinical_Information_Provided.ent'>
<!ENTITY ent-e-Referral_3A_Common_Sections_Diagnostic_Investigations                 SYSTEM 'templates/e-Referral_3A_Common_Sections_Diagnostic_Investigations.ent'>
<!ENTITY ent-e-Referral_3A_Common_Sections_Mandatory_Paths                           SYSTEM 'templates/e-Referral_3A_Common_Sections_Mandatory_Paths.ent'>
<!ENTITY ent-e-Referral_3A_Common_Sections_Result_Status                             SYSTEM 'templates/e-Referral_3A_Common_Sections_Result_Status.ent'>
<!ENTITY ent-e-Referral_3A_Common_Sections_Specimen_Detail                           SYSTEM 'templates/e-Referral_3A_Common_Sections_Specimen_Detail.ent'>
<!ENTITY ent-e-Referral_3A_Examination_Request_Details                               SYSTEM 'templates/e-Referral_3A_Examination_Request_Details.ent'>
<!ENTITY ent-e-Referral_3A_Exclusion_Statement_Adverse_Reactions                     SYSTEM 'templates/e-Referral_3A_Exclusion_Statement_Adverse_Reactions.ent'>
<!ENTITY ent-e-Referral_3A_Exclusion_Statement_Procedures                            SYSTEM 'templates/e-Referral_3A_Exclusion_Statement_Procedures.ent'>
<!ENTITY ent-e-Referral_3A_Exclusion_Statement_Problems_and_Diagnoses                SYSTEM 'templates/e-Referral_3A_Exclusion_Statement_Problems_and_Diagnoses.ent'>
<!ENTITY ent-e-Referral_3A_Global_Code_Checks                                        SYSTEM 'templates/e-Referral_3A_Global_Code_Checks.ent'>
<!ENTITY ent-e-Referral_3A_Global_Checks                                             SYSTEM 'templates/e-Referral_3A_Global_Checks.ent'>
<!ENTITY ent-e-Referral_3A_Imaging_Examination_Result                                SYSTEM 'templates/e-Referral_3A_Imaging_Examination_Result.ent'>
<!ENTITY ent-e-Referral_3A_Imaging_Examination_Result_Group                          SYSTEM 'templates/e-Referral_3A_Imaging_Examination_Result_Group.ent'>
<!ENTITY ent-e-Referral_3A_Medical_History                                           SYSTEM 'templates/e-Referral_3A_Medical_History.ent'>
<!ENTITY ent-e-Referral_3A_Medications                                               SYSTEM 'templates/e-Referral_3A_Medications.ent'>
<!ENTITY ent-e-Referral_3A_Other_Test_Result                                         SYSTEM 'templates/e-Referral_3A_Other_Test_Result.ent'>
<!ENTITY ent-e-Referral_3A_Other_Medical_History_Item                                SYSTEM 'templates/e-Referral_3A_Other_Medical_History_Item.ent'>
<!ENTITY ent-e-Referral_3A_Pathology_Test_Result                                     SYSTEM 'templates/e-Referral_3A_Pathology_Test_Result.ent'>
<!ENTITY ent-e-Referral_3A_Pathology_Test_Result_Group_Reference_Range_Guidance      SYSTEM 'templates/e-Referral_3A_Pathology_Test_Result_Group_Reference_Range_Guidance.ent'>
<!ENTITY ent-e-Referral_3A_Problems_and_Diagnosis                                    SYSTEM 'templates/e-Referral_3A_Problems_and_Diagnosis.ent'>
<!ENTITY ent-e-Referral_3A_Procedure                                                 SYSTEM 'templates/e-Referral_3A_Procedure.ent'>
<!ENTITY ent-e-Referral_3A_Referral_Detail                                           SYSTEM 'templates/e-Referral_3A_Referral_Detail.ent'>
<!ENTITY ent-e-Referral_3A_Requested_Service                                         SYSTEM 'templates/e-Referral_3A_Requested_Service.ent'>
<!ENTITY ent-e-Referral_3A_Result_Group_Specimen_Detail                              SYSTEM 'templates/e-Referral_3A_Result_Group_Specimen_Detail.ent'>
<!ENTITY ent-e-Referral_3A_Service_Provider_Person                                   SYSTEM 'templates/e-Referral_3A_Service_Provider_Person.ent'>
<!ENTITY ent-e-Referral_3A_Service_Provider_Organisation                             SYSTEM 'templates/e-Referral_3A_Service_Provider_Organisation.ent'>
<!ENTITY ent-e-Referral_3A_Test_Specimen_Detail                                      SYSTEM 'templates/e-Referral_3A_Test_Specimen_Detail.ent'>
<!ENTITY ent-e-Referral_3A_Test_Specimen_Detail_-_Anatomical_Location_Name           SYSTEM 'templates/e-Referral_3A_Test_Specimen_Detail_-_Anatomical_Location_Name.ent'>

<!ENTITY ent-e-Referral_3B_SNoMED_AMT_Attributes                                    SYSTEM 'templates/e-Referral_3B_SNoMED_AMT_Attributes.ent'>

]>

<!--Removed as per IG v2.1
    <!ENTITY ent-e-Referral_Usual_GP_Date_of_Birth                                       SYSTEM 'templates/e-Referral_Usual_GP_Date_of_Birth.ent'>
    <!ENTITY ent-e-Referral_Usual_GP_Sex                                                 SYSTEM 'templates/e-Referral_Usual_GP_Sex.ent'>
-->

<schema xmlns     = "http://www.ascc.net/xml/schematron"
        xmlns:cda = "urn:hl7-org:v3"
        xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
        xmlns:xs  = "http://www.w3.org/2001/XMLSchema"
        xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">
    <!--
        To use iso schematron instead of schematron 1.5,
        change the xmlns attribute from
        "http://www.ascc.net/xml/schematron"
        to 1.2.36.1.2001.1001.101.100.16100
        "http://purl.oclc.org/dsdl/schematron" -->

 <title>Schematron schema for validating 3B conformance to e-Referral CDA documents</title>

 <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
 <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
 <ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
 <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

 <phase id = "errors">
  <active pattern = "p-e-Referral_Author-errors"/>
  <active pattern = "p-e-Referral_Clinical_Document-errors"/>
  <active pattern = "p-e-Referral_Custodian-errors"/>
  <active pattern = "p-e-Referral_DataType_Global_Checks-errors"/>
  <active pattern = "p-e-Referral_e-Referral-errors"/>  
  <active pattern = "p-e-Referral_Entity_Identifier_Checks-errors"/>
  <active pattern = "p-e-Referral_Global_Checks-errors"/>
  <active pattern = "p-e-Referral_Global_Code_Checks-errors"/>
  <active pattern = "p-e-Referral_HPI-I_Enforced-errors"/>   
  <active pattern = "p-e-Referral_IHI_Common_Conformance_Requirements-errors"/>  
  <active pattern = "p-e-Referral_Information_Recipient-errors"/>
  <active pattern = "p-e-Referral_Legal_Authenticator-errors"/>
  <active pattern = "p-e-Referral_Patient_Nominated_Contacts_Organisation-errors"/>
  <active pattern = "p-e-Referral_Patient_Nominated_Contacts_Person-errors"/>
  <active pattern = "p-e-Referral_Referee-errors"/>
  <active pattern = "p-e-Referral_Referee_Person-errors"/>
  <active pattern = "p-e-Referral_Referee_Organisation-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Address-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Administrative_Gender_Code-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Birth_Order-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Country_Of_Birth-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Date_Of_Birth-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Date_Of_Death-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Electronic_Communication_Detail-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Entity_Identifier_Participant-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_id-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Indigenous_Status-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Participant-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Patient_Role-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_Person_Name-errors"/>
  <active pattern = "p-e-Referral_Subject_Of_Care_State_Of_Birth-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Address-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Department_Unit-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Electronic_Communication_Details-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Employer_Organisation-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Employment_Detail-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Entity_Identifier_Employer_Organisation-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Entity_Identifier_Participant-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_id-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Organisation_Name-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Organisation_Name_Usage-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Organisation_Role-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Participant-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Participation_Type-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Person_Name-errors"/>
  <active pattern = "p-e-Referral_Usual_GP_Role-errors"/>

  
  <active pattern = "p-e-Referral_1B_CDA_Narrative-errors"/>


     <!--Removed as per IG v2.1
         <active pattern = "p-e-Referral_Usual_GP_Date_of_Birth-errors"/>
         <active pattern = "p-e-Referral_Usual_GP_Sex-errors"/> -->

  <active pattern = "p-e-Referral_2_Administrative_Observations-errors"/>
  <active pattern = "p-e-Referral_2_Adverse_Reactions-errors"/>
  <active pattern = "p-e-Referral_2_Common_Sections_Mandatory_Paths-errors"/>
  <active pattern = "p-e-Referral_2_Diagnostic_Investigations-errors"/>
  <active pattern = "p-e-Referral_2_Global_Code_Checks-errors"/>
  <active pattern = "p-e-Referral_2_Imaging_Examination_Result-errors"/>
  <active pattern = "p-e-Referral_2_Medications-errors"/>
  <active pattern = "p-e-Referral_2_Other_Test_Result-errors"/>
  <active pattern = "p-e-Referral_2_Pathology_Test_Result-errors"/>
  <active pattern = "p-e-Referral_2_Referral_Detail-errors"/>
  <active pattern = "p-e-Referral_2_Requested_Service-errors"/>

  <active pattern = "p-e-Referral_3A_Subject_Of_Care_Age-errors"/>
  <active pattern = "p-e-Referral_3A_Subject_Of_Care_Age_Accuracy_Indicator-errors"/>
  <active pattern = "p-e-Referral_3A_Subject_Of_Care_Birth_Plurality-errors"/>
  <active pattern = "p-e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator-errors"/>
  <active pattern = "p-e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age-errors"/>
  <active pattern = "p-e-Referral_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator-errors"/>
  <active pattern = "p-e-Referral_3A_Subject_Of_Care_Entitlement-errors"/>

  <active pattern = "p-e-Referral_3A_Adverse_Reactions-errors"/>
  <active pattern = "p-e-Referral_3A_Common_Sections-errors"/>
  <active pattern = "p-e-Referral_3A_Common_Sections_Clinical_Information_Provided-errors"/>
  <active pattern = "p-e-Referral_3A_Common_Sections_Diagnostic_Investigations-errors"/>
  <active pattern = "p-e-Referral_3A_Common_Sections_Mandatory_Paths-errors"/>
  <active pattern = "p-e-Referral_3A_Common_Sections_Result_Status-errors"/>
  <active pattern = "p-e-Referral_3A_Common_Sections_Specimen_Detail-errors"/>
  <active pattern = "p-e-Referral_3A_Examination_Request_Details-errors"/>
  <active pattern = "p-e-Referral_3A_Exclusion_Statement_Adverse_Reactions-errors"/>
  <active pattern = "p-e-Referral_3A_Exclusion_Statement_Procedures-errors"/>
  <active pattern = "p-e-Referral_3A_Exclusion_Statement_Problems_and_Diagnoses-errors"/>
  <active pattern = "p-e-Referral_3A_Global_Code_Checks-errors"/>
  <active pattern = "p-e-Referral_3A_Global_Checks-errors"/>
  <active pattern = "p-e-Referral_3A_Imaging_Examination_Result-errors"/>
  <active pattern = "p-e-Referral_3A_Imaging_Examination_Result_Group-errors"/>
  <active pattern = "p-e-Referral_3A_Medical_History-errors"/>
  <active pattern = "p-e-Referral_3A_Medications-errors"/>
  <active pattern = "p-e-Referral_3A_Other_Medical_History_Item-errors"/>
  <active pattern = "p-e-Referral_3A_Other_Test_Result-errors"/>
  <active pattern = "p-e-Referral_3A_Pathology_Test_Result-errors"/>
  <active pattern = "p-e-Referral_3A_Pathology_Test_Result_Group_Reference_Range_Guidance-errors"/>
  <active pattern = "p-e-Referral_3A_Problems_and_Diagnosis-errors"/>
  <active pattern = "p-e-Referral_3A_Procedure-errors"/>
  <active pattern = "p-e-Referral_3A_Referral_Detail-errors"/>
  <active pattern = "p-e-Referral_3A_Requested_Service-errors"/>
  <active pattern = "p-e-Referral_3A_Result_Group_Specimen_Detail-errors"/>
  <active pattern = "p-e-Referral_3A_Service_Provider_Person-errors"/>
  <active pattern = "p-e-Referral_3A_Service_Provider_Organisation-errors"/>
  <active pattern = "p-e-Referral_3A_Test_Specimen_Detail-errors"/>
  <active pattern = "p-e-Referral_3A_Test_Specimen_Detail_-_Anatomical_Location_Name-errors"/>

  <active pattern = "p-e-Referral_3B_SNoMED_AMT_Attributes-errors"/>

 </phase>

 &ent-e-Referral_Author;
 &ent-e-Referral_Clinical_Document;
 &ent-e-Referral_Custodian;
 &ent-e-Referral_DataType_Global_Checks;
 &ent-e-Referral_e-Referral;
 &ent-e-Referral_Entity_Identifier_Checks;
 &ent-e-Referral_Global_Checks;
 &ent-e-Referral_Global_Code_Checks;
 &ent-e-Referral_HPI-I_Enforced;
 &ent-e-Referral_IHI_Common_Conformance_Requirements;
 &ent-e-Referral_Information_Recipient;
 &ent-e-Referral_Legal_Authenticator;
 &ent-e-Referral_Patient_Nominated_Contacts_Organisation;
 &ent-e-Referral_Patient_Nominated_Contacts_Person;
 &ent-e-Referral_Referee;
 &ent-e-Referral_Referee_Person;
 &ent-e-Referral_Referee_Organisation;
 &ent-e-Referral_Subject_Of_Care_Address;
 &ent-e-Referral_Subject_Of_Care_Administrative_Gender_Code;
 &ent-e-Referral_Subject_Of_Care_Birth_Order;
 &ent-e-Referral_Subject_Of_Care_Country_Of_Birth;
 &ent-e-Referral_Subject_Of_Care_Date_Of_Birth;
 &ent-e-Referral_Subject_Of_Care_Date_Of_Death;
 &ent-e-Referral_Subject_Of_Care_Electronic_Communication_Detail;
 &ent-e-Referral_Subject_Of_Care_Entity_Identifier_Participant;
 &ent-e-Referral_Subject_Of_Care_id;
 &ent-e-Referral_Subject_Of_Care_Indigenous_Status;
 &ent-e-Referral_Subject_Of_Care_Participant;
 &ent-e-Referral_Subject_Of_Care_Patient_Role;
 &ent-e-Referral_Subject_Of_Care_Person_Name;
 &ent-e-Referral_Subject_Of_Care_State_Of_Birth;
 &ent-e-Referral_Usual_GP_Address;
 &ent-e-Referral_Usual_GP_Department_Unit;
 &ent-e-Referral_Usual_GP_Electronic_Communication_Details;
 &ent-e-Referral_Usual_GP_Employer_Organisation;
 &ent-e-Referral_Usual_GP_Employment_Detail;
 &ent-e-Referral_Usual_GP_Entity_Identifier_Employer_Organisation;
 &ent-e-Referral_Usual_GP_Entity_Identifier_Participant;
 &ent-e-Referral_Usual_GP_id;
 &ent-e-Referral_Usual_GP_Organisation_Name;
 &ent-e-Referral_Usual_GP_Organisation_Name_Usage;
 &ent-e-Referral_Usual_GP_Organisation_Role;
 &ent-e-Referral_Usual_GP_Participant;
 &ent-e-Referral_Usual_GP_Participation_Type;
 &ent-e-Referral_Usual_GP_Person_Name;
 &ent-e-Referral_Usual_GP_Role;
 
 &ent-e-Referral_1B_CDA_Narrative;


 <!--Removed as per IG v2.1
 &ent-e-Referral_Usual_GP_Date_of_Birth;
 &ent-e-Referral_Usual_GP_Sex;-->

 &ent-e-Referral_2_Administrative_Observations;
 &ent-e-Referral_2_Adverse_Reactions;
 &ent-e-Referral_2_Common_Sections_Mandatory_Paths;
 &ent-e-Referral_2_Diagnostic_Investigations;
 &ent-e-Referral_2_Global_Code_Checks;
 &ent-e-Referral_2_Imaging_Examination_Result;
 &ent-e-Referral_2_Medications;
 &ent-e-Referral_2_Other_Test_Result;
 &ent-e-Referral_2_Pathology_Test_Result;
 &ent-e-Referral_2_Referral_Detail;
 &ent-e-Referral_2_Requested_Service;

 &ent-e-Referral_3A_Subject_Of_Care_Age;
 &ent-e-Referral_3A_Subject_Of_Care_Age_Accuracy_Indicator;
 &ent-e-Referral_3A_Subject_Of_Care_Birth_Plurality;
 &ent-e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator;
 &ent-e-Referral_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age;
 &ent-e-Referral_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator;
 &ent-e-Referral_3A_Subject_Of_Care_Entitlement;

 &ent-e-Referral_3A_Adverse_Reactions;
 &ent-e-Referral_3A_Common_Sections;
 &ent-e-Referral_3A_Common_Sections_Clinical_Information_Provided;
 &ent-e-Referral_3A_Common_Sections_Diagnostic_Investigations;
 &ent-e-Referral_3A_Common_Sections_Mandatory_Paths;
 &ent-e-Referral_3A_Common_Sections_Result_Status;
 &ent-e-Referral_3A_Common_Sections_Specimen_Detail;
 &ent-e-Referral_3A_Examination_Request_Details;
 &ent-e-Referral_3A_Exclusion_Statement_Adverse_Reactions;
 &ent-e-Referral_3A_Exclusion_Statement_Procedures;
 &ent-e-Referral_3A_Exclusion_Statement_Problems_and_Diagnoses;
 &ent-e-Referral_3A_Global_Code_Checks;
 &ent-e-Referral_3A_Global_Checks;
 &ent-e-Referral_3A_Imaging_Examination_Result;
 &ent-e-Referral_3A_Imaging_Examination_Result_Group;
 &ent-e-Referral_3A_Medical_History;
 &ent-e-Referral_3A_Medications;
 &ent-e-Referral_3A_Other_Medical_History_Item;
 &ent-e-Referral_3A_Other_Test_Result;
 &ent-e-Referral_3A_Pathology_Test_Result;
 &ent-e-Referral_3A_Pathology_Test_Result_Group_Reference_Range_Guidance;
 &ent-e-Referral_3A_Problems_and_Diagnosis;
 &ent-e-Referral_3A_Procedure;
 &ent-e-Referral_3A_Referral_Detail;
 &ent-e-Referral_3A_Requested_Service;
 &ent-e-Referral_3A_Result_Group_Specimen_Detail;
 &ent-e-Referral_3A_Service_Provider_Person;
 &ent-e-Referral_3A_Service_Provider_Organisation;
 &ent-e-Referral_3A_Test_Specimen_Detail;
 &ent-e-Referral_3A_Test_Specimen_Detail_-_Anatomical_Location_Name;

 &ent-e-Referral_3B_SNoMED_AMT_Attributes;

</schema>
