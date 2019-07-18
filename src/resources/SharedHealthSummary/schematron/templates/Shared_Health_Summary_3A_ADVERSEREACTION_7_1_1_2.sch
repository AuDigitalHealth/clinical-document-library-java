<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 12/02/2015 9:49:04 AM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.2
                  IG Guide Title     : ADVERSE REACTION
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_3A_ADVERSEREACTION_7_1_1_2-errors"
        id="p-Shared_Health_Summary_3A_ADVERSEREACTION_7_1_1_2-errors"
        see="#p-Shared_Health_Summary_3A_ADVERSEREACTION_7_1_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry[cda:act/cda:code/@code = '102.15517']">

            <report test="count(cda:act) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:id"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Adverse Reaction Instance Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Adverse Reaction Instance Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Detailed Clinical Model Identifier" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:participant"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participant' tag is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:participant) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participant' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '102.16474']) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'entryRelationship' tag shall appear only once for ' REACTION EVENT'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

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
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Adverse Reaction Instance Identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="cda:code[@code = '102.15517']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.15517']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20113']/cda:entry/cda:act/cda:code[@code='102.15517'])"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Detailed Clinical Model Identifier" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20113']/entry/act/code[@code = '102.15517']' path -
                1 or more tags are missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Detailed Clinical Model Identifier" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Detailed Clinical Model Identifier" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Detailed Clinical Model Identifier" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Adverse Reaction'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Detailed Clinical Model Identifier" -
                The 'code' tag 'displayName' attribute shall contain the value 'Adverse Reaction'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Detailed Clinical Model Identifier" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant">

            <assert test="@typeCode"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participant' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participant' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'CAGNT'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participant' tag 'typeCode' attribute shall contain the value 'CAGNT'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participant' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:participantRole"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participantRole' tag is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:participantRole) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participantRole' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant/cda:participantRole">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'participantRole' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:playingEntity"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'playingEntity' tag is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:playingEntity) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'playingEntity' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant/cda:participantRole/cda:playingEntity">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'playingEntity' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:code"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'code' tag is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant/cda:participantRole/cda:playingEntity/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / Substance/Agent" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship[cda:observation/cda:code/@code = '102.16474']">

            <assert test="@typeCode"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'CAUS'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'CAUS'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:entryRelationship[cda:observation/@classCode = 'OBS']"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'entryRelationship' tag is missing for ' Manifestation'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:value) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Reaction Type" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="cda:code[@code = '102.16474']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16474']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20113']/cda:entry/cda:act[cda:code/@code='102.15517']/cda:entryRelationship/cda:observation/cda:code[@code='102.16474'])"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20113']/entry/act[code/@code = '102.15517']/entryRelationship/observation/code[@code = '102.16474']' path -
                1 or more tags are missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Reaction Event'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'code' tag 'displayName' attribute shall contain the value 'Reaction Event'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship[cda:observation/@classCode = 'OBS']">

            <assert test="@inversionInd"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'entryRelationship' tag 'inversionInd' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@inversionInd) or normalize-space(@inversionInd) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@inversionInd) or normalize-space(@inversionInd) = '' or @inversionInd = 'true'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'entryRelationship' tag 'inversionInd' attribute shall contain the value 'true'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'entryRelationship' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship/cda:observation[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:code"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'code' tag is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:id"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'id' tag is missing.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship/cda:observation[@classCode = 'OBS']/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship/cda:observation[@classCode = 'OBS']/cda:id">

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
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Manifestation" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Reaction Type" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@code and normalize-space(@code) = ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Reaction Type" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Reaction Type" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @codeSystem and normalize-space(@codeSystem) != '' and @codeSystem != '2.16.840.1.113883.6.96'"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Reaction Type" -
                The 'value' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Shared Health Summary - 7.1.1.2 ADVERSE REACTION -
                "ADVERSE REACTION / REACTION EVENT / Reaction Type" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


    </pattern>

</schema>
