<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2/06/2015 9:59:53 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.1.2.1
                  IG Guide Title     : RESULT GROUP SPECIMEN DETAIL
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_RESULTGROUPSPECIMENDETAIL_7_1_5_1_2_1-errors"
        id="p-e-Referral_3A_RESULTGROUPSPECIMENDETAIL_7_1_5_1_2_1-errors"
        see="#p-e-Referral_3A_RESULTGROUPSPECIMENDETAIL_7_1_5_1_2_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer">

            <report test="count(cda:component[cda:observation/cda:code/@code = '102.16156.2.2.2']) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'component' tag shall appear only once for 'Result Group Specimen Detail'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component[cda:observation/cda:code/@code = '102.16156.2.2.2']">

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:methodCode) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection Procedure" -
                The 'methodCode' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:targetSiteCode) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Specific Location / Anatomical Location Name" -
                The 'targetSiteCode' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16171']) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'entryRelationship' tag shall appear only once for ' Sampling Preconditions'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:effectiveTime"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Date- Time" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Date- Time" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16529']) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'entryRelationship' tag shall appear only once for ' Collection Setting'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.11014']) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'entryRelationship' tag shall appear only once for ' DateTime Received'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16187']) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'entryRelationship' tag shall appear only once for ' Parent Specimen Identifier'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '102.16156.2.2.2']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16156.2.2.2']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship[cda:organizer/@classCode='BATTERY']/cda:organizer/cda:component/cda:observation/cda:code[@code='102.16156.2.2.2'])"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16144']/entry/observation[@classCode = 'OBS']/entryRelationship[organizer/@classCode = 'BATTERY']/organizer/component/observation/code[@code = '102.16156.2.2.2']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Result Group Specimen Detail'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'code' tag 'displayName' attribute shall contain the value 'Result Group Specimen Detail'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:specimen/cda:specimenRole/cda:specimenPlayingEntity">

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Specimen Tissue Type" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:quantity) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details / Weight" -
                The 'quantity' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:desc) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details / Description (Object Description)" -
                The 'desc' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(ext:asSpecimenInContainer) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'asSpecimenInContainer' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship[cda:observationMedia/@classCode = 'OBS']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SPRT'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SPRT'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observationMedia) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observationMedia[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'id' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'value' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observationMedia[@classCode = 'OBS']/cda:id">

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
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "ResultGroup SpecimenDetail / Anatomical Site / Anatomical Location Image" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:specimen">

            <assert test="cda:specimenRole"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details (Physical Properties of an Object)" -
                The 'specimenRole' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:specimenRole) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details (Physical Properties of an Object)" -
                The 'specimenRole' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:specimen/cda:specimenRole">

            <assert test="cda:specimenPlayingEntity"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details (Physical Properties of an Object)" -
                The 'specimenPlayingEntity' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:specimenPlayingEntity) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details (Physical Properties of an Object)" -
                The 'specimenPlayingEntity' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Specimen Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:specimen/cda:specimenRole/cda:specimenPlayingEntity/cda:quantity">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details / Weight" -
                The 'quantity' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'PQ' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'PQ')"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details / Weight" -
                The 'quantity' tag 'xsi:type' attribute shall contain the value 'PQ'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:specimen/cda:specimenRole/cda:specimenPlayingEntity/cda:desc">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details / Description (Object Description)" -
                The 'desc' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Physical Details / Description (Object Description)" -
                The 'desc' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16171']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16171']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'value' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16171']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Sampling Preconditions'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'code' tag 'displayName' attribute shall contain the value 'Sampling Preconditions'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16171']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16529']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16529']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'value' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16529']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Collection Setting'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'code' tag 'displayName' attribute shall contain the value 'Collection Setting'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16529']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / Collection Setting" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship[cda:observation/cda:code/@code = '103.11014']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.11014']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'value' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation/cda:code[@code = '103.11014']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'DateTime Received'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'code' tag 'displayName' attribute shall contain the value 'DateTime Received'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.11014']/cda:value">

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'TS' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'TS')"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'TS'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Handling and Processing / DateTime Received" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16187']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16187']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:specimen"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'specimen' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:specimen) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'specimen' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16187']">

            <assert test="@codeSystem "
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'code' tag 'codeSystem ' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystem ) or normalize-space(@codeSystem ) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'code' tag 'codeSystem ' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem ) or normalize-space(@codeSystem ) = '' or @codeSystem  = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'code' tag 'codeSystem ' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName "
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'code' tag 'displayName ' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@displayName ) or normalize-space(@displayName ) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'code' tag 'displayName ' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName ) or normalize-space(@displayName ) = '' or @displayName  = 'Parent Specimen Identifier'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'code' tag 'displayName ' attribute shall contain the value 'Parent Specimen Identifier'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16187']/cda:specimen">

            <assert test="cda:specimenRole"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'specimenRole' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:specimenRole) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'specimenRole' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16187']/cda:specimen/cda:specimenRole">

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:specimen/cda:specimenRole/cda:specimenPlayingEntity/ext:asSpecimenInContainer">

            <assert test="@classCode "
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'asSpecimenInContainer' tag 'classCode ' attribute is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode ) or normalize-space(@classCode ) != ''"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'asSpecimenInContainer' tag 'classCode ' attribute shall contain a value.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode ) or normalize-space(@classCode ) = '' or @classCode  = 'CONT'"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'asSpecimenInContainer' tag 'classCode ' attribute shall contain the value 'CONT'.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="ext:container"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'container' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(ext:container) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'container' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']/cda:organizer/cda:component/cda:observation[cda:code/@code = '102.16156.2.2.2']/cda:specimen/cda:specimenRole/cda:specimenPlayingEntity/ext:asSpecimenInContainer/ext:container">

            <assert test="ext:id"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(ext:id) > 1"
                >Error: e-Referral - 7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL -
                "Result Group Specimen Detail / Identifiers / Container Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.1.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>
