<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 24/02/2015 1:04:47 PM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.3.1
                  IG Guide Title     : PROBLEM/DIAGNOSIS
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_3A_PROBLEM_DIAGNOSIS_7_1_3_1-errors"
        id="p-Shared_Health_Summary_3A_PROBLEM_DIAGNOSIS_7_1_3_1-errors"
        see="#p-Shared_Health_Summary_3A_PROBLEM_DIAGNOSIS_7_1_3_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry[cda:observation/cda:code/@code = '282291009']">

            <report test="count(cda:observation) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:id"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Problem/Diagnosis Instance Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Problem/Diagnosis Instance Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Detailed Clinical Model Identifier" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:value"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Problem/Diagnosis Identification" -
                The 'value' tag is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:value) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Problem/Diagnosis Identification" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:effectiveTime) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Onset" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.15510']) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'entryRelationship' tag shall appear only once for ' Date of Resolution/ Remission'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16545']) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'entryRelationship' tag shall appear only once for ' Comment (Problem/Diagnosis Comment)'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:id">

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
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Problem/Diagnosis Instance Identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="cda:code[@code = '282291009']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '282291009']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:observation/cda:code[@code='282291009'])"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Detailed Clinical Model Identifier" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16117']/entry/observation/code[@code = '282291009']' path -
                1 or more tags are missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Detailed Clinical Model Identifier" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Detailed Clinical Model Identifier" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Detailed Clinical Model Identifier" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Diagnosis interpretation'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Detailed Clinical Model Identifier" -
                The 'code' tag 'displayName' attribute shall contain the value 'Diagnosis interpretation'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Detailed Clinical Model Identifier" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Problem/Diagnosis Identification" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Problem/Diagnosis Identification" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:effectiveTime">

            <report test="count(cda:low) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Onset" -
                The 'low' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:low"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Onset" -
                The 'low' tag is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:entryRelationship[cda:observation/cda:code/@code = '103.15510']">

            <assert test="@typeCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SUBJ'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SUBJ'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:entryRelationship/cda:observation[cda:code/@code = '103.15510']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:value) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:value"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'value' tag is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:code[@code = '103.15510']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.15510']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:observation[cda:code/@code='282291009']/cda:entryRelationship/cda:observation/cda:code[@code='103.15510'])"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16117']/entry/observation[code/@code = '282291009']/entryRelationship/observation/code[@code = '103.15510']' path -
                1 or more tags are missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Date of Resolution/Remission'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'code' tag 'displayName' attribute shall contain the value 'Date of Resolution/Remission'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:entryRelationship/cda:observation[cda:code/@code = '103.15510']/cda:value">

            <assert test="@xsi:type"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'value' tag 'xsi:type' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@xsi:type) or normalize-space(@xsi:type) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'IVL_TS' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS')"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Date of Resolution/ Remission" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'IVL_TS'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:entryRelationship[cda:act/cda:code/@code = '103.16545']">

            <assert test="@typeCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:act) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:entryRelationship/cda:act[cda:code/@code = '103.16545']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:text"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'text' tag is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:text) > 1"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16545']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16545']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:observation[cda:code/@code='282291009']/cda:entryRelationship/cda:act/cda:code[@code='103.16545'])"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16117']/entry/observation[code/@code = '282291009']/entryRelationship/act/code[@code = '103.16545']' path -
                1 or more tags are missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Problem/Diagnosis Comment'"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Problem/Diagnosis Comment'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:entryRelationship/cda:act[cda:code/@code = '103.16545']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Shared Health Summary - 7.1.3.1 PROBLEM/DIAGNOSIS -
                "PROBLEM/DIAGNOSIS / Comment (Problem/Diagnosis Comment)" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


    </pattern>

</schema>
