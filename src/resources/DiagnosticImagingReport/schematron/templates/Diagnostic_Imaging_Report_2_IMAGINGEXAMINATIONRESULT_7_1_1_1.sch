<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 29/07/2016 10:45:23 AM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.1
                  IG Guide Title     : IMAGING EXAMINATION RESULT
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_2_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors"
        id="p-Diagnostic_Imaging_Report_2_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors"
        see="#p-Diagnostic_Imaging_Report_2_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']">

            <assert test="cda:component[cda:section/cda:code/@code = '102.16145']"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'component' tag is missing for 'IMAGING EXAMINATION RESULT'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component[cda:section/cda:code/@code = '102.16145']">

            <report test="count(cda:section) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'section' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']">

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Imaging Examination Result Instance Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Imaging Examination Result Instance Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Detailed Clinical Model Identifier" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:title) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'title' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="cda:title and normalize-space(cda:title) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'title' tag shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                cda:title and normalize-space(cda:title) != '' and
                cda:title != 'Imaging Examination Result'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'title' tag shall contain the value 'Imaging Examination Result'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:text) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="cda:title and not(cda:text)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'title' tag shall not exist if the 'text' tag is missing.
                Refer to section "026616 - Omission of the imaging examination result section title" of eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and section 7.1.1.1 of the 
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:id">

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
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Imaging Examination Result Instance Identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section/cda:code[@code = '102.16145']">

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Detailed Clinical Model Identifier" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Detailed Clinical Model Identifier" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Detailed Clinical Model Identifier" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Imaging Examination Result'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Detailed Clinical Model Identifier" -
                The 'code' tag 'displayName' attribute shall contain the value 'Imaging Examination Result'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
