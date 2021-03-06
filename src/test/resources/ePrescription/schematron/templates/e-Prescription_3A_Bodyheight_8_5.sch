<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 8/08/2013 2:04:02 PM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.5
                  IG Guide Title     : Body height
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_3A_Bodyheight_8_5-errors"
        id="p-e-Prescription_3A_Bodyheight_8_5-errors"
        see="#p-e-Prescription_3A_Bodyheight_8_5-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']">

            <report test="count(cda:entry[cda:observation/cda:code/@code = '50373000']) > 1"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'entry' tag shall appear only once for 'Body Height'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']/cda:entry[cda:observation/cda:code/@code = '50373000']">

            <assert test="@typeCode"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'entry' tag 'typeCode' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'entry' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'DRIV'"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'entry' tag 'typeCode' attribute shall contain the value 'DRIV'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'observation' tag shall appear only once.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']/cda:entry/cda:observation[cda:code/@code = '50373000']">

            <assert test="@classCode"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@moodCode"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag shall appear only once.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <report test="count(cda:id) > 1"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'id' tag shall appear only once.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:id"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'id' tag is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="cda:value"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / Body Height Value" -
                The 'value' tag is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / Body Height Value" -
                The 'value' tag shall appear only once.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:effectiveTime"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / DateTime of Observation" -
                The 'effectiveTime' tag is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / DateTime of Observation" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="cda:code[@code = '50373000']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '50373000']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16280']/cda:entry/cda:observation/cda:code[@code='50373000'])"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16280']/entry/observation/code[@code = '50373000']' path -
                1 or more tags are missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystem"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystemName"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'SNOMED CT-AU'"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@displayName"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Body Height'"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'displayName' attribute shall contain the value 'Body Height'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystemVersion"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'codeSystemVersion' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@codeSystemVersion) or normalize-space(@codeSystemVersion) != ''"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystemVersion) or normalize-space(@codeSystemVersion) = '' or @codeSystemVersion = '20101130'"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'code' tag 'codeSystemVersion' attribute shall contain the value '20101130'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']/cda:entry/cda:observation[cda:code/@code = '50373000']/cda:id">

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
                >Error: e-Prescription - 8.5 Body height -
                "Body Height" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']/cda:entry/cda:observation[cda:code/@code = '50373000']/cda:value">

            <assert test="@xsi:type"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / Body Height Value" -
                The 'value' tag 'xsi:type' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@xsi:type) or normalize-space(@xsi:type) != ''"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / Body Height Value" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'PQ' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'PQ')"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / Body Height Value" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'PQ'.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']/cda:entry/cda:observation[cda:code/@code = '50373000']/cda:effectiveTime">

            <assert test="@value"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / DateTime of Observation" -
                The 'effectiveTime' tag 'value' attribute is missing.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: e-Prescription - 8.5 Body height -
                "Body Height / DateTime of Observation" -
                The 'effectiveTime' tag 'value' attribute shall contain a value.
                Refer to section 8.5 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


    </pattern>

</schema>
