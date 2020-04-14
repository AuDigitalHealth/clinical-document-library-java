<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 12/02/2015 10:19:06 AM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.3.3
                  IG Guide Title     : PROCEDURE
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_3A_PROCEDURE_7_1_3_3-errors"
        id="p-Shared_Health_Summary_3A_PROCEDURE_7_1_3_3-errors"
        see="#p-Shared_Health_Summary_3A_PROCEDURE_7_1_3_3-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry[cda:procedure/@classCode = 'PROC']">

            <report test="count(cda:procedure) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE" -
                The 'procedure' tag shall appear only once.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode = 'PROC']">

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE" -
                The 'procedure' tag 'moodCode' attribute is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE" -
                The 'procedure' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE" -
                The 'procedure' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:id"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Instance Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Instance Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:code"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Name" -
                The 'code' tag is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Name" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.15595']) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'entryRelationship' tag shall appear only once for ' Procedure Comment'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:effectiveTime) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure DateTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:effectiveTime"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure DateTime" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode = 'PROC']/cda:id">

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
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Instance Identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode = 'PROC']/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Name" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode = 'PROC']/cda:entryRelationship[cda:act/cda:code/@code = '103.15595']">

            <assert test="@typeCode"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:act) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode = 'PROC']/cda:entryRelationship/cda:act[cda:code/@code = '103.15595']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:text"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'text' tag is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:text) > 1"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:code[@code = '103.15595']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.15595']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:procedure[@classCode='PROC']/cda:entryRelationship/cda:act/cda:code[@code='103.15595'])"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16117']/entry/procedure[@classCode = 'PROC']/entryRelationship/act/code[@code = '103.15595']' path -
                1 or more tags are missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Procedure Comment'"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'code' tag 'displayName' attribute shall contain the value 'Procedure Comment'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode = 'PROC']/cda:entryRelationship/cda:act[cda:code/@code = '103.15595']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Shared Health Summary - 7.1.3.3 PROCEDURE -
                "PROCEDURE / Procedure Comment" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.3.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


    </pattern>

</schema>
