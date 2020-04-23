<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2016-07-20 2:03:00 PM

                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.2
                  IG Guide Title     : Document Author
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_DocumentAuthor_6_1_2-errors"
        id="p-Pathology_Report_DocumentAuthor_6_1_2-errors"
        see="#p-Pathology_Report_DocumentAuthor_6_1_2-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:author[cda:assignedAuthor/cda:assignedPerson]"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author" -
                The 'author' tag is missing for 'Document Author'.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:author) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author" -
                The 'author' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author[cda:assignedAuthor/cda:assignedPerson]">

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:time"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participation Period" -
                The 'time' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:time) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participation Period" -
                The 'time' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author[cda:assignedAuthor/cda:assignedPerson]/cda:time">

            <report test="@value and normalize-space(@value) = ''"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participation Period" -
                The 'time' tag 'value' attribute shall contain a value.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@nullFlavor)"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participation Period" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:assignedPerson]">

            <report test="count(cda:code) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:code"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:id"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / id" -
                The 'id' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / id" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:assignedPerson) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:assignedPerson]/cda:id">

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
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:name"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation / Organisation / Organisation Name" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:asEmployment"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation / Organisation / Organisation Name" -
                The 'asEmployment' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asQualifications) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:assignedPerson]/cda:addr">

            <report test="@use and normalize-space(@use) = ''"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Address" -
                The 'addr' tag 'use' attribute shall contain a value.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:assignedPerson]/cda:telecom">

            <report test="@use and normalize-space(@use) = ''"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Electronic Communication Detail" -
                The 'telecom' tag 'use' attribute shall contain a value.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <assert test="@classCode"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'QUAL'"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:code"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:originalText) or normalize-space(cda:originalText) != ''"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Qualifications" -
                The 'originalText' tag shall contain a value.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

            <assert test="not(@nullFlavor)"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation / Organisation / Organisation Name" -
                The 'name' tag 'nullFlavor' attribute shall not be present.
                Refer to "024692 - Pathology Report information which must be present and not null" of the eHealth_Pathology_Report_My_Health_Record_Conformance_Profile_v1.1 and section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
