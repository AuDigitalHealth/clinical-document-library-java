<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2/06/2015 10:00:40 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.2.2
                  IG Guide Title     : EXAMINATION REQUEST DETAILS
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_5_2_2-errors"
        id="p-e-Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_5_2_2-errors"
        see="#p-e-Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_5_2_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:act/cda:code/@code = '102.16511']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SUBJ'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SUBJ'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@inversionInd"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'entryRelationship' tag 'inversionInd' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@inversionInd) or normalize-space(@inversionInd) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@inversionInd) or normalize-space(@inversionInd) = '' or @inversionInd = 'true'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain the value 'true'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16513']) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'entryRelationship' tag shall appear only once for ' DICOM Series Identifier'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16514']) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'entryRelationship' tag shall appear only once for ' Report Identifier'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '102.16511']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16511']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act/cda:code[@code = '102.16511'])"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act/code[@code = '102.16511']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Examination Request Details'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'code' tag 'displayName' attribute shall contain the value 'Examination Request Details'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16512']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'REFR'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'REFR'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16512']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'text' tag is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16512']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16512']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation/cda:code[@code='103.16512'])"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act[code/@code = '102.16511']/entryRelationship/observation/code[@code = '103.16512']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Examination Requested Name'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'code' tag 'displayName' attribute shall contain the value 'Examination Requested Name'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16512']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Examination Requested Name" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship[cda:act/cda:code/@code = '103.16513']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SUBJ'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SUBJ'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16513']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16513']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act/cda:code[@code='103.16513'])"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act[code/@code = '102.16511']/entryRelationship/act/code[@code = '103.16513']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'DICOM Study Identifier'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'code' tag 'displayName' attribute shall contain the value 'DICOM Study Identifier'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / DICOM Series Identifier" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16514']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16514']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16514']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16514']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation/cda:code[@code='103.16514'])"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act[code/@code = '102.16511']/entryRelationship/observation/code[@code = '103.16514']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Report Identifier'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'code' tag 'displayName' attribute shall contain the value 'Report Identifier'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Report Identifier" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16515']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16517']) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'entryRelationship' tag shall appear only once for ' DICOM Study Identifier'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image View Name" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16519']) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'entryRelationship' tag shall appear only once for ' Subject Position'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image DateTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observationMedia/@classCode = 'OBS']) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'entryRelationship' tag shall appear only once for ' Image'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16515']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16515']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code='103.16513']/cda:entryRelationship/cda:observation/cda:code[@code='103.16515'])"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act[code/@code = '102.16511']/entryRelationship/act[code/@code = '103.16513']/entryRelationship/observation/code[@code = '103.16515']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Image Details'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'code' tag 'displayName' attribute shall contain the value 'Image Details'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship[cda:act/cda:code/@code = '103.16517']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'REFR'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'REFR'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship/cda:act[cda:code/@code = '103.16517']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16517']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16517']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code='103.16513']/cda:entryRelationship/cda:observation[cda:code/@code='103.16515']/cda:entryRelationship/cda:act/cda:code[@code='103.16517'])"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act[code/@code = '102.16511']/entryRelationship/act[code/@code = '103.16513']/entryRelationship/observation[code/@code = '103.16515']/entryRelationship/act/code[@code = '103.16517']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'DICOM Series Identifier'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'code' tag 'displayName' attribute shall contain the value 'DICOM Series Identifier'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Imaging Examination Result /Examination Request Details / DICOM Study Identifier" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image View Name" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16519']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'REFR'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'REFR'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16519']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'value' tag is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16519']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16519']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code='103.16513']/cda:entryRelationship/cda:observation[cda:code/@code='103.16515']/cda:entryRelationship/cda:observation/cda:code[@code='103.16519'])"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/act[code/@code = '102.16511']/entryRelationship/act[code/@code = '103.16513']/entryRelationship/observation[code/@code = '103.16515']/entryRelationship/observation/code[@code = '103.16519']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Subject Position'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'code' tag 'displayName' attribute shall contain the value 'Subject Position'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16519']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Subject Position" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship[cda:observationMedia/@classCode = 'OBS']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SPRT'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SPRT'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observationMedia) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'observationMedia' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship/cda:observationMedia[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'observationMedia' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'observationMedia' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'observationMedia' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'value' tag is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship/cda:observationMedia[@classCode = 'OBS']/cda:id">

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
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship/cda:observationMedia[@classCode = 'OBS']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ED' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ED')"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'ED'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>
