<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 14/04/2015 11:53:38 AM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.1
                  IG Guide Title     : SUBJECT OF CARE
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1-errors"
        id="p-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1-errors"
        see="#p-Diagnostic_Imaging_Report_3A_SUBJECTOFCARE_6_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']">

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.16233']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'entry' tag shall appear only once for ' Date of Birth is Calculated From Age'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '102.16234']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'entry' tag shall appear only once for ' Date of Birth Accuracy Indicator'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.20109']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'entry' tag shall appear only once for ' Age'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.16279']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'entry' tag shall appear only once for ' Age Accuracy Indicator'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.16249']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'entry' tag shall appear only once for ' Birth Plurality'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '102.16252']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'entry' tag shall appear only once for ' Date of Death Accuracy Indicator'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.10243']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'entry' tag shall appear only once for ' Source of Death Notification'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.10245']) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'entry' tag shall appear only once for ' Mother s Original Family Name'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.16233']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16233']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.16233']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16233']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='103.16233'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.16233']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Date of Birth is Calculated From Age'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'code' tag 'displayName' attribute shall contain the value 'Date of Birth is Calculated From Age'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16233']/cda:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16233']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'BL' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'BL')"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'BL'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '102.16234']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16234']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '102.16234']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16234']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='102.16234'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '102.16234']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Date of Birth Accuracy Indicator'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'code' tag 'displayName' attribute shall contain the value 'Date of Birth Accuracy Indicator'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16234']/cda:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16234']/cda:value">

            <assert test="@code"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'value' tag 'code' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Date_Accuracy_Indicator']/code[(@code = current()/@code)]"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'value' tag 'code' attribute shall be as per AS 5017-2006 Health Care Client Identifier Date Accuracy Indicator.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'CS' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'CS')"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'CS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.20109']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.20109']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.20109']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.20109']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='103.20109'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.20109']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Age'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'code' tag 'displayName' attribute shall contain the value 'Age'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.20109']/cda:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.20109']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'PQ' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'PQ')"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'PQ'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.16279']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16279']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.16279']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16279']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='103.16279'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.16279']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Age Accuracy Indicator'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'code' tag 'displayName' attribute shall contain the value 'Age Accuracy Indicator'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16279']/cda:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16279']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'BL' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'BL')"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'BL'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.16249']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16249']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.16249']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16249']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='103.16249'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.16249']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Birth Plurality'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'code' tag 'displayName' attribute shall contain the value 'Birth Plurality'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16249']/cda:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16249']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'INT' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'INT')"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'INT'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '102.16252']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16252']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '102.16252']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16252']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='102.16252'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '102.16252']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Date of Death Accuracy Indicator'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'code' tag 'displayName' attribute shall contain the value 'Date of Death Accuracy Indicator'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16252']/cda:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16252']/cda:value">

            <assert test="@code"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'value' tag 'code' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Date_Accuracy_Indicator']/code[(@code = current()/@code)]"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'value' tag 'code' attribute shall be as per AS 5017-2006 Health Care Client Identifier Date Accuracy Indicator.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'CS' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'CS')"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'CS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.10243']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.10243']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.10243']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.10243']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='103.10243'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.10243']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Source of Death Notification'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'code' tag 'displayName' attribute shall contain the value 'Source of Death Notification'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.10243']/cda:value">

            <assert test="@code"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'code' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Source_of_Death_Notification']/code[(@code = current()/@code)]"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'code' attribute shall be as per AS 5017-2006: Health Care Client Source of Death Notification.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.13.64'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.13.64'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="
                @codeSystemName and normalize-space(@codeSystemName) != '' and @codeSystemName != 'AS 5017-2006 Health Care Client Source of Death Notification'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'codeSystemName' attribute shall contain the value 'AS 5017-2006 Health Care Client Source of Death Notification'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'codeSystemName' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'AS_5017-2006_Health_Care_Client_Source_of_Death_Notification']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per AS 5017-2006: Health Care Client Source of Death Notification.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.10245']">

            <report test="count(cda:observation) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'observation' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.10245']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'value' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'value' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.10245']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.10245']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[@code='103.10245'])"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.10245']' path -
                1 or more tags are missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;MOTHER'S ORIGINAL FAMILY NAME&quot;"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'code' tag 'displayName' attribute shall contain the value 'Mother's Original Family Name'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.10245']/cda:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.10245']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'PN' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'PN')"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Mother s Original Family Name" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'PN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2[ext:entitlement/ext:participant/@typeCode = 'BEN']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COVBY'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain the value 'COVBY'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:entitlement) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'entitlement' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement[ext:participant/@typeCode = 'BEN']">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participant) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'participant' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'BEN']">

            <assert test="ext:participantRole"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'participantRole' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participantRole) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'participantRole' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'BEN']/ext:participantRole">

            <assert test="@classCode"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'PAT'"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain the value 'PAT'.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:id"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:id) > 1"
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'BEN']/ext:participantRole/ext:id">

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
                >Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Entitlement" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>
