<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 14/04/2015 11:53:40 AM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.2
                  IG Guide Title     : REPORTING RADIOLOGIST
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2-errors"
        id="p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2-errors"
        see="#p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']">

            <report test="count(cda:author) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST" -
                The 'author' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author">

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedAuthor"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:time) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Time" -
                The 'time' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author/cda:assignedAuthor">

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:code"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Role" -
                The 'code' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / id" -
                The 'id' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / id" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedPerson"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author/cda:assignedAuthor/cda:id">

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
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="cda:name"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:asEntityIdentifier"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:asEmployment"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asQualifications) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author/cda:time">

            <report test="@value and normalize-space(@value) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Time" -
                The 'time' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@nullFlavor)"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Time" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <report test="@classCode and normalize-space(@classCode) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @classCode and normalize-space(@classCode) != '' and @classCode != 'QUAL'"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:code"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:originalText) or normalize-space(cda:originalText) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Qualifications" -
                The 'originalText' tag shall contain a value.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
