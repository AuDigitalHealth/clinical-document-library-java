<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 03-10-2013 18:40:34

                  Product            : Prescription Request
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

    <pattern name="p-Prescription_Request_Dispenser_7_3-errors"
        id="p-Prescription_Request_Dispenser_7_3-errors"
        see="#p-Prescription_Request_Dispenser_7_3-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:author"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:author) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author">

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:time) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispense Record / Dispense Item / DateTime" -
                The 'time' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:time"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispense Record / Dispense Item / DateTime" -
                The 'time' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:assignedAuthor"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:time">

            <assert test="not(@nullFlavor)"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispense Record / Dispense Item / DateTime" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor">

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:code"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:id"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / id" -
                The 'id' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / id" -
                The 'id' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:assignedPerson"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:addr) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Address" -
                The 'addr' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:code">

            <assert test="@code"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = '2515'"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'code' attribute shall contain the value '2515'.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.13.62'"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.13.62'.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006'"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'codeSystemName' attribute shall contain the value '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006'.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Pharmacists'"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Role" -
                The 'code' tag 'displayName' attribute shall contain the value 'Pharmacists'.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

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
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:asEntityIdentifier) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="not(ext:asEntityIdentifier) or ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag for 'HPI-I' is missing.
                "The value of one Entity Identifier SHALL be an Australian HPI-I." although there could be multiple Entity Identifiers.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:name"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:name) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:asEmployment) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Person or Organisation or Device / Person / Employment Detail / Occupation" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:asQualifications) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment">

            <report test="count(ext:jobCode) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Person or Organisation or Device / Person / Employment Detail / Occupation" -
                The 'jobCode' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <assert test="@classCode"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'QUAL'"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="ext:code"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: Prescription Request - 7.3 Dispenser -
                "Dispenser / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 7.3 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


    </pattern>

</schema>
