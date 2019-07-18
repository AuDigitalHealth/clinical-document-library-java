<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2016-07-20 3:41:38 PM

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

    <pattern name="p-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors"
        id="p-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors"
        see="#p-Diagnostic_Imaging_Report_3A_IMAGINGEXAMINATIONRESULT_7_1_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']">

            <assert test="cda:entry[cda:observation/@classCode = 'OBS']"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'entry' tag is missing for ' Examination Result Name (Imaging Examination Result Name)'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entry) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'entry' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry[cda:observation/@classCode = 'OBS']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:code"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'code' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:methodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Modality (Imaging Modality)" -
                The 'methodCode' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:methodCode) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Modality (Imaging Modality)" -
                The 'methodCode' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.17009']) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'entryRelationship' tag shall appear only once for ' Anatomical Region'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '308552006']"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'entryRelationship' tag is missing for ' Overall Result Status (Imaging Examination Result Status)'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '308552006']) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'entryRelationship' tag shall appear only once for ' Overall Result Status (Imaging Examination Result Status)'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '105.16633']) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'entryRelationship' tag shall appear only once for ' Examination Procedure'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:entryRelationship[cda:act/cda:code/@code = '105.16633']"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'entryRelationship' tag is missing for ' Examination Procedure'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '103.16589']"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'entryRelationship' tag is missing for ' Observation DateTime'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16589']) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'entryRelationship' tag shall appear only once for ' Observation DateTime'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:id">

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
                "IMAGING EXAMINATION RESULT / Examination Result Name (Imaging Examination Result Name)" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:methodCode">

            <assert test="not(@nullFlavor)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Modality (Imaging Modality)" -
                The 'methodCode' tag 'nullFlavor' attribute shall not be present.
                Refer to "025075 - Diagnostic Imaging Report information which must be present and not null" of the eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '103.17009']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SUBJ'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SUBJ'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.17009']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'id' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.17009']/cda:id">

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
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.17009']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.17009']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation/cda:code[@code='103.17009'])"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16945']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/observation/code[@code = '103.17009']' path -
                1 or more tags are missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Anatomical Region'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'code' tag 'displayName' attribute shall contain the value 'Anatomical Region'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.17009']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS: Admin Codes - Anatomical Region']/code[(@code = current()/@code)]"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag 'code' attribute shall be as per NCTIS: Admin Codes - Anatomical Region.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@code and normalize-space(@code) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @codeSystem and normalize-space(@codeSystem) != '' and @codeSystem != '1.2.36.1.2001.1001.101.104.17008'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.17008'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS: Admin Codes - Anatomical Region']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per NCTIS: Admin Codes - Anatomical Region.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '308552006']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:id">

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
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation/cda:code[@code = '308552006']">

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'report status'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'code' tag 'displayName' attribute shall contain the value 'report status'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'HL7 : Result Status']/code[(@code = current()/@code)]"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag 'code' attribute shall be as per HL7 : Result Status.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.12.123'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.12.123'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'HL7 : Result Status']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status)" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per HL7 : Result Status.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:act/cda:code/@code = '105.16633']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'REFR'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'REFR'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '105.16633']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'text' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '105.16633']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '105.16633']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act/cda:code[@code='105.16633'])"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16945']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act/code[@code = '105.16633']' path -
                1 or more tags are missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Examination Procedure'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'code' tag 'displayName' attribute shall contain the value 'Examination Procedure'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '105.16633']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@nullFlavor)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Examination Procedure" -
                The 'text' tag 'nullFlavor' attribute shall not be present.
                Refer to "025075 - Diagnostic Imaging Report information which must be present and not null" of the eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16589']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16589']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:effectiveTime"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16589']">

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Imaging Examination Result DateTime'"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'code' tag 'displayName' attribute shall contain the value 'Imaging Examination Result DateTime'.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING EXAMINATION RESULT -
                "IMAGING EXAMINATION RESULT / Observation DateTime" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
