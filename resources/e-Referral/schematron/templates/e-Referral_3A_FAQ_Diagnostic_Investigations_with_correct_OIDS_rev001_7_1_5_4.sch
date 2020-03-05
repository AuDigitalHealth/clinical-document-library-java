<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2/06/2015 1:39:58 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.4
                  IG Guide Title     : FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4-errors"
        id="p-e-Referral_3A_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4-errors"
        see="#p-e-Referral_3A_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']">

            <assert test="cda:entry[cda:observation/@classCode = 'OBS']"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'entry' tag is missing for ' Name'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entry[cda:observation/@classCode = 'OBS']) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'entry' tag shall appear only once for ' Name'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry[cda:observation/@classCode = 'OBS']">

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '308552006']) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'entryRelationship' tag shall appear only once for ' Report Status'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "	Undifferentiated Pathology and Radiology Results / Report Date" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / id" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Value" -
                The 'value' tag is missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Value" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '308552006']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']">

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag is missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation/cda:code[@code = '308552006']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'report status'"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'code' tag 'displayName' attribute shall contain the value 'report status'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:value">

            <report test="@code and normalize-space(@code) = ''"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Admin_Codes_Result_Status']/code[
                    (@code = current()/@code) ])"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag 'code' and 'code' attribute shall be as per 10.20 NCTIS: Admin Codes - Result Status.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @codeSystem and normalize-space(@codeSystem) != '' and @codeSystem != '1.2.36.1.2001.1001.101.104.16501'"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16501'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Admin_Codes_Result_Status']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per 10.20 NCTIS: Admin Codes - Result Status.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation[@classCode = 'OBS']/cda:value">

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ED' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ED')"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Value" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'ED'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>
