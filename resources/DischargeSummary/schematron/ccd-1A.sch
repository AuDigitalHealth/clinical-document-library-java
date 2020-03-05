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

    <title>Schematron schema for validating 1A conformance to e-Discharge Summary CDA documents</title>

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
		   
</schema>
