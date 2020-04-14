<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 12/02/2015 9:49:05 AM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.2.1
                  IG Guide Title     : EXCLUSION STATEMENT - MEDICATIONS
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_2_1-errors"
        id="p-Shared_Health_Summary_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_2_1-errors"
        see="#p-Shared_Health_Summary_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_2_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']">

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.16302.120.1.2']) > 1"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'entry' tag shall appear only once for ' Global Statement'.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry[cda:observation/cda:code/@code = '103.16302.120.1.2']">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'entry' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:observation[cda:code/@code = '103.16302.120.1.2']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:id"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'id' tag is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:value"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:value) > 1"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="cda:code[@code = '103.16302.120.1.2']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16302.120.1.2']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']/cda:entry/cda:observation/cda:code[@code='103.16302.120.1.2'])"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16146']/entry/observation/code[@code = '103.16302.120.1.2']' path -
                1 or more tags are missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Global Statement'"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'code' tag 'displayName' attribute shall contain the value 'Global Statement'.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:observation[cda:code/@code = '103.16302.120.1.2']/cda:id">

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
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:observation[cda:code/@code = '103.16302.120.1.2']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="@code"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'code' attribute is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS_Global_Statement_Values']/code[(@code = current()/@code)]"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'code' attribute shall be as per NCTIS: Admin Codes - Global Statement Values.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101.104.16299'"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16299'.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Global_Statement_Values']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per NCTIS: Admin Codes - Global Statement Values.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.2.1 EXCLUSION STATEMENT - MEDICATIONS -
                "EXCLUSION STATEMENT - MEDICATIONS / Global Statement" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.2.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


    </pattern>

</schema>
