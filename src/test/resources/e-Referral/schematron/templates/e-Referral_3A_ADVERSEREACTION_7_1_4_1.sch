<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 1/06/2015 3:22:09 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.4.1
                  IG Guide Title     : ADVERSE REACTION
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_ADVERSEREACTION_7_1_4_1-errors"
        id="p-e-Referral_3A_ADVERSEREACTION_7_1_4_1-errors"
        see="#p-e-Referral_3A_ADVERSEREACTION_7_1_4_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry[cda:act/cda:code/@code = '102.15517']">

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'id' tag is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:participant"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participant' tag is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:participant) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participant' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '102.16474']) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'entryRelationship' tag shall appear only once for ' Reaction Event'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:id">

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
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '102.15517']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.15517']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act/cda:code[@code = '102.15517'])"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20113']/entry/act/code[@code = '102.15517']' path -
                1 or more tags are missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Adverse Reaction'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'code' tag 'displayName' attribute shall contain the value 'Adverse Reaction'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participant' tag 'typeCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participant' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'CAGNT'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participant' tag 'typeCode' attribute shall contain the value 'CAGNT'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participant' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:participantRole"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participantRole' tag is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:participantRole) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participantRole' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant/cda:participantRole">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'participantRole' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:playingEntity"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'playingEntity' tag is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:playingEntity) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'playingEntity' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant/cda:participantRole/cda:playingEntity">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'playingEntity' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'code' tag is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant/cda:participantRole/cda:playingEntity/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Substance/Agent" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship[cda:observation/cda:code/@code = '102.16474']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'CAUS'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'CAUS'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:entryRelationship[cda:observation/@classCode = 'OBS']"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag is missing for ' Manifestation'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="cda:code[@code = '102.16474']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16474']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation/cda:code[@code='102.16474'])"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20113']/entry/act[code/@code = '102.15517']/entryRelationship/observation/code[@code = '102.16474']' path -
                1 or more tags are missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Reaction Event'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'code' tag 'displayName' attribute shall contain the value 'Reaction Event'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship[cda:observation/@classCode = 'OBS']">

            <assert test="@inversionInd"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag 'inversionInd' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@inversionInd) or normalize-space(@inversionInd) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@inversionInd) or normalize-space(@inversionInd) = '' or @inversionInd = 'true'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain the value 'true'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'MFST'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'MFST'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'entryRelationship' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship/cda:observation[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'code' tag is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship/cda:observation[@classCode = 'OBS']/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>
