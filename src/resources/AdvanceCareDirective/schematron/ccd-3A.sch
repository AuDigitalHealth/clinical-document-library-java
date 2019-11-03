<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [

<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Author                                                         SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Author.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Clinical_Document                                              SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Clinical_Document.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Custodian                                                      SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Custodian.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_DataType_Global_Checks                                         SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_DataType_Global_Checks.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Legal_Authenticator                                            SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Legal_Authenticator.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Global_Checks                                                  SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Global_Checks.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Global_Checks_Address                                          SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Global_Checks_Address.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Address                                        SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Address.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Administrative_Gender_Code                     SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Administrative_Gender_Code.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Birth_Order                                    SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Birth_Order.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Country_Of_Birth                               SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Country_Of_Birth.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Birth                                  SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Birth.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Death                                  SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Death.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Entity_Identifier_Participant                  SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Entity_Identifier_Participant.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Indigenous_Status                              SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Indigenous_Status.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Participant                                    SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Participant.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Patient_Role                                   SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Patient_Role.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Person_Name                                    SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Person_Name.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_State_Of_Birth                                 SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_State_Of_Birth.ent'>

<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_1B_CDA_Narrative                                              SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_1B_CDA_Narrative.ent'>

<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_2_ACD_Custodian_Entries                                        SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_2_ACD_Custodian_Entries.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_2_Administrative_Observations                                  SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_2_Administrative_Observations.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_2_Common_Sections_Mandatory_Paths                              SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_2_Common_Sections_Mandatory_Paths.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_2_Global_Code_Checks                                           SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_2_Global_Code_Checks.ent'>

<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Entry                                         SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Entry.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Organisation                                  SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Organisation.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Person                                        SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Person.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Common_Sections_Mandatory_Paths                             SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Common_Sections_Mandatory_Paths.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Global_Checks                                               SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Global_Checks.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Global_Code_Checks                                          SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Global_Code_Checks.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age                                         SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age_Accuracy_Indicator                      SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age_Accuracy_Indicator.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Birth_Plurality                             SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Birth_Plurality.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator            SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age        SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator            SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator.ent'>
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Entitlement                                 SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Entitlement.ent'>

 ]>

<!--
<!ENTITY ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Electronic_Communication_Detail                SYSTEM 'templates/Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Electronic_Communication_Detail.ent'>
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
                      "http://purl.oclc.org/dsdl/schematron"-->

    <title>Schematron schema for validating 3A conformance to Australian Childhood Immunisation Register CDA documents</title>

    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

           <phase id = "errors">
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Author-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Clinical_Document-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Custodian-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_DataType_Global_Checks-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Legal_Authenticator-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Global_Checks-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Global_Checks_Address-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Address-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Administrative_Gender_Code-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Birth_Order-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Country_Of_Birth-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Birth-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Death-errors"/>
            <!--<active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Electronic_Communication_Detail-errors"/>-->
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Entity_Identifier_Participant-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Indigenous_Status-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Participant-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Patient_Role-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Person_Name-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_State_Of_Birth-errors"/>

                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_1B_CDA_Narrative-errors"/>

                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_2_ACD_Custodian_Entries-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_2_Administrative_Observations-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_2_Common_Sections_Mandatory_Paths-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_2_Global_Code_Checks-errors"/>

                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Entry-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Organisation-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Person-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Common_Sections_Mandatory_Paths-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Global_Checks-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Global_Code_Checks-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age_Accuracy_Indicator-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Birth_Plurality-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator-errors"/>
                <active pattern = "p-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Entitlement-errors"/>

           </phase>

            &ent-Advanced_Care_Directive_Custodian_Record_Author;
            &ent-Advanced_Care_Directive_Custodian_Record_Clinical_Document;
            &ent-Advanced_Care_Directive_Custodian_Record_Custodian;
            &ent-Advanced_Care_Directive_Custodian_Record_DataType_Global_Checks;
            &ent-Advanced_Care_Directive_Custodian_Record_Legal_Authenticator;
            &ent-Advanced_Care_Directive_Custodian_Record_Global_Checks;
            &ent-Advanced_Care_Directive_Custodian_Record_Global_Checks_Address;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Address;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Administrative_Gender_Code;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Birth_Order;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Country_Of_Birth;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Birth;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Date_Of_Death;
        <!--&ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Electronic_Communication_Detail;-->
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Entity_Identifier_Participant;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Indigenous_Status;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Participant;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Patient_Role;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_Person_Name;
            &ent-Advanced_Care_Directive_Custodian_Record_Subject_Of_Care_State_Of_Birth;

            &ent-Advanced_Care_Directive_Custodian_Record_1B_CDA_Narrative;

            &ent-Advanced_Care_Directive_Custodian_Record_2_ACD_Custodian_Entries;
            &ent-Advanced_Care_Directive_Custodian_Record_2_Administrative_Observations;
            &ent-Advanced_Care_Directive_Custodian_Record_2_Common_Sections_Mandatory_Paths;
            &ent-Advanced_Care_Directive_Custodian_Record_2_Global_Code_Checks;

            &ent-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Entry;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Organisation;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_ACD_Custodian_Person;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Common_Sections_Mandatory_Paths;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Global_Checks;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Global_Code_Checks;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Age_Accuracy_Indicator;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Birth_Plurality;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Accuracy_Indicator;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Birth_Is_Calculated_From_Age;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Date_Of_Death_Accuracy_Indicator;
            &ent-Advanced_Care_Directive_Custodian_Record_3A_Subject_Of_Care_Entitlement;

</schema>
