<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:11 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.2
                  IG Guide Title     : Prescriber
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_Prescriber_6_1_2-errors"
        id="p-PCEHR_Prescription_Record_Prescriber_6_1_2-errors"
        see="#p-PCEHR_Prescription_Record_Prescriber_6_1_2-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:author"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber" -
                The 'author' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:author) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber" -
                The 'author' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author">

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'AUT'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:assignedAuthor"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor">

            <assert test="cda:code"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedPerson"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:name"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:asQualifications) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag 'classCode' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'EMP'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag 'classCode' attribute shall contain the value 'EMP'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:jobCode"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Employment Detail / Occupation" -
                The 'jobCode' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'QUAL'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:code"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>
