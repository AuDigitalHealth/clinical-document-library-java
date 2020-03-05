<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 30/09/2013 2:25:59 PM

                  Product            : Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.3
                  IG Guide Title     : Dispenser
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Dispense_Record_Dispenser_7_3-errors"
        id="p-Dispense_Record_Dispenser_7_3-errors"
        see="#p-Dispense_Record_Dispenser_7_3-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:author"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:author) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author">

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <report test="count(cda:time) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispense Record / Dispense Item / DateTime" -
                The 'time' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <assert test="cda:time"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispense Record / Dispense Item / DateTime" -
                The 'time' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <assert test="cda:assignedAuthor"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:time">

            <assert test="not(@nullFlavor)"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispense Record / Dispense Item / DateTime" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor">

            <assert test="not(@nullFlavor)"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'assignedAuthor' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <assert test="cda:code"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <assert test="cda:id"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / id" -
                The 'id' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:id) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / id" -
                The 'id' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <assert test="cda:assignedPerson"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <assert test="cda:addr"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:addr) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Address" -
                The 'addr' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <assert test="cda:telecom"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

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
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(ext:asEntityIdentifier) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <assert test="cda:name"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:name) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <report test="count(ext:asQualifications) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <assert test="@classCode"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'QUAL'"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <assert test="ext:code"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(ext:code) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: Dispense Record - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 7.3 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


    </pattern>

</schema>
