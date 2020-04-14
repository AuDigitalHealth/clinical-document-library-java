<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2/06/2015 11:54:28 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.3
                  IG Guide Title     : REQUESTED SERVICE
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_REQUESTEDSERVICE_7_1_5_3-errors"
        id="p-e-Referral_3A_REQUESTEDSERVICE_7_1_5_3-errors"
        see="#p-e-Referral_3A_REQUESTEDSERVICE_7_1_5_3-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']">

            <assert test="cda:entry[cda:act/@classCode = 'ACT']"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'entry' tag is missing for ' Requested Service Description'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entry[cda:act/@classCode = 'ACT']) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'entry' tag shall appear only once for ' Requested Service Description'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry[cda:act/@classCode = 'ACT']">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'entry' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'CDA-Act.moodCode']/code[(@code = current()/@moodCode)]"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'act' tag 'moodCode' attribute shall be as per 10.15 HL7 v3 CDA: Act.moodCode.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'act' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'id' tag is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'code' tag is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / DateTime Service Scheduled" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.10146']) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'entryRelationship' tag shall appear only once for ' Subject of Care Instruction Description'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:entryRelationship[cda:act/cda:code/@code = '103.16635']"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'entryRelationship' tag is missing for ' Requested Service DateTime'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16635']) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'entryRelationship' tag shall appear only once for ' Requested Service DateTime'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:id">

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
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'id' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service Description" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:entryRelationship[cda:act/cda:code/@code = '103.10146']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:entryRelationship/cda:act[cda:code/@code = '103.10146']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'text' tag is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="cda:code[@code = '103.10146']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.10146']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:entryRelationship/cda:act/cda:code[@code = '103.10146'])"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.20158']/entry/act[@classCode = 'ACT']/entryRelationship/act/code[@code = '103.10146']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Subject of Care Instruction Description'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'code' tag 'displayName' attribute shall contain the value 'Subject of Care Instruction Description'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Subject of Care Instruction Description" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:entryRelationship[cda:act/cda:code/@code = '103.16635']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'entryRelationship' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:entryRelationship/cda:act[cda:code/@code = '103.16635']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'act' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:effectiveTime"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:entryRelationship/cda:act/cda:code[@code = '103.16635']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Requested Service DateTime'"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'code' tag 'displayName' attribute shall contain the value 'Requested Service DateTime'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:entryRelationship/cda:act[cda:code/@code = '103.16635']/cda:effectiveTime">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.3 REQUESTED SERVICE -
                "Requested Service / Requested Service DateTime" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>
