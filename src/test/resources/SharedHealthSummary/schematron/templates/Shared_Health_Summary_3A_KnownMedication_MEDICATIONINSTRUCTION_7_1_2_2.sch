<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 12/02/2015 9:49:05 AM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.2.2
                  IG Guide Title     : Known Medication (MEDICATION INSTRUCTION)
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_2_2-errors"
        id="p-Shared_Health_Summary_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_2_2-errors"
        see="#p-Shared_Health_Summary_3A_KnownMedication_MEDICATIONINSTRUCTION_7_1_2_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry[cda:substanceAdministration/@classCode = 'SBADM']">

            <report test="count(cda:substanceAdministration) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'moodCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:id"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Instance identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Instance identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:consumable"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'consumable' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:consumable) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'consumable' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:text"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Directions" -
                The 'text' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:text) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Directions" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.10141']) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag shall appear only once for ' Clinical Indication'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16044']) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'entryRelationship' tag shall appear only once for ' Medication Instruction Comment'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:id">

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
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Instance identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable">

            <assert test="cda:manufacturedProduct"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'manufacturedProduct' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:manufacturedProduct) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'manufacturedProduct' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct">

            <assert test="cda:manufacturedMaterial"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'manufacturedMaterial' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:manufacturedMaterial) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'manufacturedMaterial' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">

            <assert test="cda:code"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'code' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Therapeutic Good identification" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Directions" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Directions" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.10141']">

            <assert test="@typeCode"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'RSON'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'RSON'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:act) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.10141']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:text"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:text) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:code[@code = '103.10141']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.10141']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='103.10141'])"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16146']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.10141']' path -
                1 or more tags are missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Clinical Indication'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'displayName' attribute shall contain the value 'Clinical Indication'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.10141']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16044']">

            <assert test="@typeCode"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:act) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16044']">

            <assert test="@classCode"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@moodCode"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:text"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'text' tag is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:text) > 1"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16044']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16044']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='103.16044'])"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16146']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16044']' path -
                1 or more tags are missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Additional Comments'"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'code' tag 'displayName' attribute shall contain the value 'Additional Comments'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16044']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Shared Health Summary - 7.1.2.2 Known Medication (MEDICATION INSTRUCTION) -
                "Known Medication (MEDICATION INSTRUCTION) / Medication Instruction Comment" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.2.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


    </pattern>

</schema>
