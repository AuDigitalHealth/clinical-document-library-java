<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 2:42:13 PM

                  Product            : PCEHR Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.2
                  IG Guide Title     : Dispenser
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_Dispenser_6_1_2-errors"
        id="p-PCEHR_Dispense_Record_Dispenser_6_1_2-errors"
        see="#p-PCEHR_Dispense_Record_Dispenser_6_1_2-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:author"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser" -
                The 'author' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:author) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser" -
                The 'author' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedAuthor"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor">

            <assert test="cda:code"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Role" -
                The 'id' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Role" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedPerson"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id">

            <report test="
                contains(@root, '-') and not(
                string-length(@root) = 36 and
                substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and
                substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and
                translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Role" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:name"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asQualifications) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'QUAL'"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:code"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>
