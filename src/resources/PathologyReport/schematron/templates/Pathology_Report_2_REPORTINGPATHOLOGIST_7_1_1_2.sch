<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 4/03/2015 9:33:29 AM

                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.2
                  IG Guide Title     : REPORTING PATHOLOGIST
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_2_REPORTINGPATHOLOGIST_7_1_1_2-errors"
        id="p-Pathology_Report_2_REPORTINGPATHOLOGIST_7_1_1_2-errors"
        see="#p-Pathology_Report_2_REPORTINGPATHOLOGIST_7_1_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']">

            <report test="count(cda:author) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST" -
                The 'author' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:author">

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedAuthor"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:time"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Time" -
                The 'time' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:time) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Time" -
                The 'time' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:author/cda:assignedAuthor">

            <report test="count(cda:code) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:code"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Role" -
                The 'code' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:id"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / id" -
                The 'id' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / id" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedPerson"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:addr"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:telecom"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:author/cda:assignedAuthor/cda:id">

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
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="cda:name"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:asEntityIdentifier"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:asEmployment"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asQualifications) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:author/cda:time">

            <report test="@value and normalize-space(@value) = ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Time" -
                The 'time' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@nullFlavor)"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Time" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <report test="@classCode and normalize-space(@classCode) = ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @classCode and normalize-space(@classCode) != '' and @classCode != 'QUAL'"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:code"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:originalText) or normalize-space(cda:originalText) != ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Qualifications" -
                The 'originalText' tag shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
