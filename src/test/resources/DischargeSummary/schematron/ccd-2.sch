<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [
 <!ENTITY ent-e-Discharge_Summary_Author                                                        SYSTEM 'templates/e-Discharge_Summary_Author.ent'>
 <!ENTITY ent-e-Discharge_Summary_Clinical_Document                                             SYSTEM 'templates/e-Discharge_Summary_Clinical_Document.ent'>
 <!ENTITY ent-e-Discharge_Summary_Custodian                                                     SYSTEM 'templates/e-Discharge_Summary_Custodian.ent'>
 <!ENTITY ent-e-Discharge_Summary_Encounter                                                     SYSTEM 'templates/e-Discharge_Summary_Encounter.ent'>
 <!ENTITY ent-e-Discharge_Summary_Facility                                                      SYSTEM 'templates/e-Discharge_Summary_Facility.ent'>
 <!ENTITY ent-e-Discharge_Summary_DataType_Global_Checks                                        SYSTEM 'templates/e-Discharge_Summary_DataType_Global_Checks.ent'>
 <!ENTITY ent-e-Discharge_Summary_e-Discharge_Summary                                           SYSTEM 'templates/e-Discharge_Summary_e-Discharge_Summary.ent'>
 <!ENTITY ent-e-Discharge_Summary_Entity_Identifier_Checks                                      SYSTEM 'templates/e-Discharge_Summary_Entity_Identifier_Checks.ent'>
 <!ENTITY ent-e-Discharge_Summary_Global_Checks                                                 SYSTEM 'templates/e-Discharge_Summary_Global_Checks.ent'>
 <!ENTITY ent-e-Discharge_Summary_Global_Code_Checks                                            SYSTEM 'templates/e-Discharge_Summary_Global_Code_Checks.ent'>
 <!ENTITY ent-e-Discharge_Summary_HPI-I_Enforced                                                SYSTEM 'templates/e-Discharge_Summary_HPI-I_Enforced.ent'>
 <!ENTITY ent-e-Discharge_Summary_IHI_Common_Conformance_Requirements                           SYSTEM 'templates/e-Discharge_Summary_IHI_Common_Conformance_Requirements.ent'>
 <!ENTITY ent-e-Discharge_Summary_Information_Recipient                                         SYSTEM 'templates/e-Discharge_Summary_Information_Recipient.ent'>
 <!ENTITY ent-e-Discharge_Summary_Legal_Authenticator                                           SYSTEM 'templates/e-Discharge_Summary_Legal_Authenticator.ent'>
 <!ENTITY ent-e-Discharge_Summary_Nominated_Primary_Healthcare_Provider                         SYSTEM 'templates/e-Discharge_Summary_Nominated_Primary_Healthcare_Provider.ent'>
 <!ENTITY ent-e-Discharge_Summary_Nominated_Primary_Healthcare_Provider_Organisation            SYSTEM 'templates/e-Discharge_Summary_Nominated_Primary_Healthcare_Provider_Organisation.ent'>
 <!ENTITY ent-e-Discharge_Summary_Other_Participant                                             SYSTEM 'templates/e-Discharge_Summary_Other_Participant.ent'>
 <!ENTITY ent-e-Discharge_Summary_Responsible_Health_Professional                               SYSTEM 'templates/e-Discharge_Summary_Responsible_Health_Professional.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Address                                       SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Address.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Administrative_Gender_Code                    SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Administrative_Gender_Code.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Birth_Order                                   SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Birth_Order.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Country_Of_Birth                              SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Country_Of_Birth.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Date_Of_Birth                                 SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Date_Of_Birth.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Date_Of_Death                                 SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Date_Of_Death.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Entity_Identifier_Participant                 SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Entity_Identifier_Participant.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_id                                            SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_id.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Indigenous_Status                             SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Indigenous_Status.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Participant                                   SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Participant.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Patient_Role                                  SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Patient_Role.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Person_Name                                   SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Person_Name.ent'>
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_State_Of_Birth                                SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_State_Of_Birth.ent'>


<!ENTITY ent-e-Discharge_Summary_1B_CDA_Narrative                                              SYSTEM 'templates/e-Discharge_Summary_1B_CDA_Narrative.ent'>

<!ENTITY ent-e-Discharge_Summary_2_Administrative_Observations                                  SYSTEM 'templates/e-Discharge_Summary_2_Administrative_Observations.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Adverse_Reactions                                            SYSTEM 'templates/e-Discharge_Summary_2_Adverse_Reactions.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Alerts                                                       SYSTEM 'templates/e-Discharge_Summary_2_Alerts.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Arranged_Services                                            SYSTEM 'templates/e-Discharge_Summary_2_Arranged_Services.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Ceased_Medications                                           SYSTEM 'templates/e-Discharge_Summary_2_Ceased_Medications.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Clinical_Interventions_Performed_This_Visit                  SYSTEM 'templates/e-Discharge_Summary_2_Clinical_Interventions_Performed_This_Visit.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Clinical_Synopsis                                            SYSTEM 'templates/e-Discharge_Summary_2_Clinical_Synopsis.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Common_Sections_Mandatory_Paths                              SYSTEM 'templates/e-Discharge_Summary_2_Common_Sections_Mandatory_Paths.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Current_Medications_On_Discharge                             SYSTEM 'templates/e-Discharge_Summary_2_Current_Medications_On_Discharge.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Diagnostic_Investigations                                    SYSTEM 'templates/e-Discharge_Summary_2_Diagnostic_Investigations.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Event                                                        SYSTEM 'templates/e-Discharge_Summary_2_Event.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Exclusion_Statement_Ceased_Medications                       SYSTEM 'templates/e-Discharge_Summary_2_Exclusion_Statement_Ceased_Medications.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Global_Code_Checks                                           SYSTEM 'templates/e-Discharge_Summary_2_Global_Code_Checks.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Health_Profile                                               SYSTEM 'templates/e-Discharge_Summary_2_Health_Profile.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Imaging_Examination_Result                                   SYSTEM 'templates/e-Discharge_Summary_2_Imaging_Examination_Result.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Medications                                                  SYSTEM 'templates/e-Discharge_Summary_2_Medications.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Plan                                                         SYSTEM 'templates/e-Discharge_Summary_2_Plan.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Other_Test_Result                                            SYSTEM 'templates/e-Discharge_Summary_2_Other_Test_Result.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Pathology_Test_Result                                        SYSTEM 'templates/e-Discharge_Summary_2_Pathology_Test_Result.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Problems_Diagnoses_This_Visit                                SYSTEM 'templates/e-Discharge_Summary_2_Problems_Diagnoses_This_Visit.ent'>
<!ENTITY ent-e-Discharge_Summary_2_Record_of_Recommendations_and_Information_Provided           SYSTEM 'templates/e-Discharge_Summary_2_Record_of_Recommendations_and_Information_Provided.ent'>


 ]>

<!--
 <!ENTITY ent-e-Discharge_Summary_Subject_Of_Care_Electronic_Communication_Detail               SYSTEM 'templates/e-Discharge_Summary_Subject_Of_Care_Electronic_Communication_Detail.ent'>
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

    <title>Schematron schema for validating 2 conformance to e-Discharge Summary CDA documents</title>

    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

            <phase id = "errors">
                      <active pattern = "p-e-Discharge_Summary_Author-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Clinical_Document-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Custodian-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Encounter-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Facility-errors"/>
                      <active pattern = "p-e-Discharge_Summary_DataType_Global_Checks-errors"/>
                      <active pattern = "p-e-Discharge_Summary_e-Discharge_Summary-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Entity_Identifier_Checks-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Global_Checks-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Global_Code_Checks-errors"/>
                      <active pattern = "p-e-Discharge_Summary_HPI-I_Enforced-errors"/>
                      <active pattern = "p-e-Discharge_Summary_IHI_Common_Conformance_Requirements-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Information_Recipient-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Legal_Authenticator-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Nominated_Primary_Healthcare_Provider-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Nominated_Primary_Healthcare_Provider_Organisation-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Other_Participant-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Responsible_Health_Professional-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Address-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Administrative_Gender_Code-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Birth_Order-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Country_Of_Birth-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Date_Of_Birth-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Date_Of_Death-errors"/>
                  <!--<active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Electronic_Communication_Detail-errors"/>-->
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Entity_Identifier_Participant-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_id-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Indigenous_Status-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Participant-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Patient_Role-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_Person_Name-errors"/>
                      <active pattern = "p-e-Discharge_Summary_Subject_Of_Care_State_Of_Birth-errors"/>
				      
					  
                      <active pattern = "p-e-Discharge_Summary_1B_CDA_Narrative-errors"/>

                      <active pattern = "p-e-Discharge_Summary_2_Administrative_Observations-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Adverse_Reactions-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Alerts-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Arranged_Services-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Ceased_Medications-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Clinical_Interventions_Performed_This_Visit-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Clinical_Synopsis-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Common_Sections_Mandatory_Paths-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Current_Medications_On_Discharge-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Diagnostic_Investigations-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Event-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Exclusion_Statement_Ceased_Medications-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Global_Code_Checks-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Health_Profile-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Imaging_Examination_Result-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Medications-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Plan-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Other_Test_Result-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Pathology_Test_Result-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Problems_Diagnoses_This_Visit-errors"/>
                      <active pattern = "p-e-Discharge_Summary_2_Record_of_Recommendations_and_Information_Provided-errors"/>

           </phase>

           &ent-e-Discharge_Summary_Author;
           &ent-e-Discharge_Summary_Clinical_Document;
           &ent-e-Discharge_Summary_Custodian;
           &ent-e-Discharge_Summary_Encounter;
           &ent-e-Discharge_Summary_Facility;
           &ent-e-Discharge_Summary_DataType_Global_Checks;
           &ent-e-Discharge_Summary_e-Discharge_Summary;
           &ent-e-Discharge_Summary_Entity_Identifier_Checks;
           &ent-e-Discharge_Summary_Global_Checks;
           &ent-e-Discharge_Summary_Global_Code_Checks;
           &ent-e-Discharge_Summary_HPI-I_Enforced;
           &ent-e-Discharge_Summary_IHI_Common_Conformance_Requirements;
           &ent-e-Discharge_Summary_Information_Recipient;
           &ent-e-Discharge_Summary_Legal_Authenticator;
           &ent-e-Discharge_Summary_Nominated_Primary_Healthcare_Provider;
           &ent-e-Discharge_Summary_Nominated_Primary_Healthcare_Provider_Organisation;
           &ent-e-Discharge_Summary_Other_Participant;
           &ent-e-Discharge_Summary_Responsible_Health_Professional;
           &ent-e-Discharge_Summary_Subject_Of_Care_Address;
           &ent-e-Discharge_Summary_Subject_Of_Care_Administrative_Gender_Code;
           &ent-e-Discharge_Summary_Subject_Of_Care_Birth_Order;
           &ent-e-Discharge_Summary_Subject_Of_Care_Country_Of_Birth;
           &ent-e-Discharge_Summary_Subject_Of_Care_Date_Of_Birth;
           &ent-e-Discharge_Summary_Subject_Of_Care_Date_Of_Death;
       <!--&ent-e-Discharge_Summary_Subject_Of_Care_Electronic_Communication_Detail;-->
           &ent-e-Discharge_Summary_Subject_Of_Care_Entity_Identifier_Participant;
           &ent-e-Discharge_Summary_Subject_Of_Care_id;
           &ent-e-Discharge_Summary_Subject_Of_Care_Indigenous_Status;
           &ent-e-Discharge_Summary_Subject_Of_Care_Participant;
           &ent-e-Discharge_Summary_Subject_Of_Care_Patient_Role;
           &ent-e-Discharge_Summary_Subject_Of_Care_Person_Name;
           &ent-e-Discharge_Summary_Subject_Of_Care_State_Of_Birth;
		   
		   
           &ent-e-Discharge_Summary_1B_CDA_Narrative;

           &ent-e-Discharge_Summary_2_Administrative_Observations;
           &ent-e-Discharge_Summary_2_Adverse_Reactions;
           &ent-e-Discharge_Summary_2_Alerts;
           &ent-e-Discharge_Summary_2_Arranged_Services;
           &ent-e-Discharge_Summary_2_Ceased_Medications;
           &ent-e-Discharge_Summary_2_Clinical_Interventions_Performed_This_Visit;
           &ent-e-Discharge_Summary_2_Clinical_Synopsis;
           &ent-e-Discharge_Summary_2_Common_Sections_Mandatory_Paths;
           &ent-e-Discharge_Summary_2_Current_Medications_On_Discharge;
           &ent-e-Discharge_Summary_2_Diagnostic_Investigations;
           &ent-e-Discharge_Summary_2_Event;
           &ent-e-Discharge_Summary_2_Exclusion_Statement_Ceased_Medications;
           &ent-e-Discharge_Summary_2_Global_Code_Checks;
           &ent-e-Discharge_Summary_2_Health_Profile;
           &ent-e-Discharge_Summary_2_Imaging_Examination_Result;
           &ent-e-Discharge_Summary_2_Medications;
           &ent-e-Discharge_Summary_2_Plan;
           &ent-e-Discharge_Summary_2_Other_Test_Result;
           &ent-e-Discharge_Summary_2_Pathology_Test_Result;
           &ent-e-Discharge_Summary_2_Problems_Diagnoses_This_Visit;
           &ent-e-Discharge_Summary_2_Record_of_Recommendations_and_Information_Provided;


</schema>
