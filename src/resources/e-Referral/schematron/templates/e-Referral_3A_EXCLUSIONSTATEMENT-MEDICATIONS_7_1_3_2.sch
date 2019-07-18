<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 1/06/2015 3:21:30 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.3.2
                  IG Guide Title     : EXCLUSION STATEMENT - MEDICATIONS
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_3_2-errors"
        id="p-e-Referral_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_3_2-errors"
        see="#p-e-Referral_3A_EXCLUSIONSTATEMENT-MEDICATIONS_7_1_3_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']">

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.16302.2.2.1']) > 1"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'entry' tag shall appear only once for 'Exclusion Statement - Medications'.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry[cda:observation/cda:code/@code = '103.16302.2.2.1']">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'entry' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:observation[cda:code/@code = '103.16302.2.2.1']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag is missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16302.2.2.1']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16302.2.2.1']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']/cda:entry/cda:observation/cda:code[@code='103.16302.2.2.1'])"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16146']/entry/observation/code[@code = '103.16302.2.2.1']' path -
                1 or more tags are missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Global Statement'"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'code' tag 'displayName' attribute shall contain the value 'Global Statement'.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:observation[cda:code/@code = '103.16302.2.2.1']/cda:value">

            <assert test="@code"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'code' attribute is missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS_Global_Statement_Values']/code[(@code = current()/@code)]"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'code' attribute shall be as per NCTIS: Admin Codes - Global Statement Values.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101.104.16299'"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16299'.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Global_Statement_Values']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per NCTIS: Admin Codes - Global Statement Values.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.2 EXCLUSION STATEMENT - MEDICATIONS -
                "Exclusion Statement - Medications" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>
