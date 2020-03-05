<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2016-07-20 3:41:15 PM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.1.1
                  IG Guide Title     : Examination Details (EXAMINATION REQUEST DETAILS)
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_3A_ExaminationDetails_EXAMINATIONREQUESTDETAILS_7_1_1_1_1-errors"
        id="p-Diagnostic_Imaging_Report_3A_ExaminationDetails_EXAMINATIONREQUESTDETAILS_7_1_1_1_1-errors"
        see="#p-Diagnostic_Imaging_Report_3A_ExaminationDetails_EXAMINATIONREQUESTDETAILS_7_1_1_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']">

            <assert test="cda:entryRelationship[cda:act/cda:code/@code = '102.16511']"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag is missing for 'Examination Details (EXAMINATION REQUEST DETAILS)'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '102.16511']) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag shall appear only once for 'Examination Details (EXAMINATION REQUEST DETAILS)'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:act/cda:code/@code = '102.16511']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SUBJ'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SUBJ'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@inversionInd"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag 'inversionInd' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@inversionInd) or normalize-space(@inversionInd) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@inversionInd) or normalize-space(@inversionInd) = '' or @inversionInd = 'true'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain the value 'true'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '102.16515']"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'entryRelationship' tag is missing for ' IMAGE DETAILS'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'entryRelationship' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act/cda:code[@code = '102.16511']">

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Examination Request Details'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Examination Request Details'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS)" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship[cda:observation/cda:code/@code = '102.16515']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16515']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:effectiveTime"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS / Image DateTime" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS / Image DateTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation/cda:code[@code = '102.16515']">

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Image Details'"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'code' tag 'displayName' attribute shall contain the value 'Image Details'.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16515']/cda:effectiveTime">

            <assert test="not(@nullFlavor)"
                >Error: Diagnostic Imaging Report - 7.1.1.1.1 Examination Details (EXAMINATION REQUEST DETAILS) -
                "Examination Details (EXAMINATION REQUEST DETAILS) / IMAGE DETAILS / Image DateTime" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall not be present.
                Refer to "025075 - Diagnostic Imaging Report information which must be present and not null" of the eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and section 7.1.1.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
