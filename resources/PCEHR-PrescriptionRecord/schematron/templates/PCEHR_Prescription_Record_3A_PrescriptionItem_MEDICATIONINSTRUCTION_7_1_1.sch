<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:11 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1
                  IG Guide Title     : Prescription Item (MEDICATION INSTRUCTION)
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_3A_PrescriptionItem_MEDICATIONINSTRUCTION_7_1_1-errors"
        id="p-PCEHR_Prescription_Record_3A_PrescriptionItem_MEDICATIONINSTRUCTION_7_1_1-errors"
        see="#p-PCEHR_Prescription_Record_3A_PrescriptionItem_MEDICATIONINSTRUCTION_7_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']">

            <assert test="cda:entry[cda:substanceAdministration/@classCode = 'SBADM']"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'entry' tag is missing for 'Prescription Item (MEDICATION INSTRUCTION)'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entry[cda:substanceAdministration/@classCode = 'SBADM']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'entry' tag shall appear only once for 'Prescription Item (MEDICATION INSTRUCTION)'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:entry[cda:observation/cda:code/@code = '103.10104']"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'entry' tag is missing for ' DateTime Prescription Expires'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.10104']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'entry' tag shall appear only once for ' DateTime Prescription Expires'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry[cda:substanceAdministration/@classCode = 'SBADM']">

            <report test="count(cda:substanceAdministration) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:statusCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'statusCode' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:statusCode) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'statusCode' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:consumable"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'consumable' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:consumable) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'consumable' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16769.170.1.1']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag shall appear only once for ' Therapeutic Good Strength (Additional Therapeutic Good Detail)'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Directions" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Directions" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16272']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'entryRelationship' tag shall appear only once for ' Formula'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.10141']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag shall appear only once for ' Clinical Indication'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:routeCode) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Administration Details (MEDICATION ADMINISTRATION) Route" -
                The 'routeCode' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Prescription Item Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Prescription Item Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:repeatNumber) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Maximum Number of Repeats (Number of Repeats)" -
                The 'repeatNumber' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16044']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag shall appear only once for ' Comment (Medication Instruction Comment)'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:entryRelationship[cda:supply/@classCode = 'SPLY']"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'entryRelationship' tag is missing for ' DISPENSING'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:supply/@classCode = 'SPLY']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'entryRelationship' tag shall appear only once for ' DISPENSING'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:statusCode">

            <assert test="@code"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'statusCode' tag 'code' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'statusCode' tag 'code' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = 'active'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'statusCode' tag 'code' attribute shall contain the value 'active'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable">

            <assert test="cda:manufacturedProduct"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'manufacturedProduct' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:manufacturedProduct) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'manufacturedProduct' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct">

            <assert test="cda:manufacturedMaterial"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'manufacturedMaterial' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:manufacturedMaterial) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'manufacturedMaterial' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:manufacturerOrganization) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'manufacturerOrganization' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">

            <assert test="cda:code"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'code' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Identification" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:name) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'name' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:formCode) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Ingredients and Form (CHEMICAL DESCRIPTION OF MEDICATION) / Form" -
                The 'formCode' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16769.170.1.1']">

            <assert test="@typeCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16769.170.1.1']">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16769.170.1.1']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16769.170.1.1']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '103.16769.170.1.1'])"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16769.170.1.1']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16272']">

            <assert test="@typeCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16272']">

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'act' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:text"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.16272']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16272']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '103.16272'])"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16272']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;FORMULA&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'code' tag 'displayName' attribute shall contain the value 'Formula'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Formula" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.10141']">

            <assert test="@typeCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'RSON'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'RSON'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.10141']">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'act' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '103.10141']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.10141']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '103.10141'])"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.10141']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;REASON FOR THERAPEUTIC GOOD&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'code' tag 'displayName' attribute shall contain the value 'Reason for Therapeutic Good'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Clinical Indication" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry[cda:observation/cda:code/@code = '103.10104']">

            <report test="count(cda:observation) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:observation[cda:code/@code = '103.10104']">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:id"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'id' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:effectiveTime"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:observation[cda:code/@code = '103.10104']/cda:id">

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
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.10104']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.10104']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:observation/cda:code[@code = '103.10104'])"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/observation/code[@code = '103.10104']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;DATETIME PRESCRIPTION EXPIRES&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'code' tag 'displayName' attribute shall contain the value 'DateTime Prescription Expires'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:observation[cda:code/@code = '103.10104']/cda:effectiveTime">

            <report test="@value and normalize-space(@value) = ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'effectiveTime' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@nullFlavor) or normalize-space(@nullFlavor) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="
                @nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'NA'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DateTime Prescription Expires" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall contain the value 'NA'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:id">

            <assert test="@root"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Prescription Item Identifier" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Prescription Item Identifier" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']">

            <report test="count(ext:subjectOf2) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'subjectOf2' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:effectiveTime) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'supply' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'supply' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'supply' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:independentInd"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'independentInd' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:independentInd) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'independentInd' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:entryRelationship[cda:act/cda:code/@code = '246205007']"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag is missing for ' Quantity Description'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '246205007']) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag shall appear only once for ' Quantity Description'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/ext:subjectOf2">

            <assert test="ext:substitutionPermission"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:substitutionPermission) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/ext:subjectOf2/ext:substitutionPermission">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SUBST'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag 'classCode' attribute shall contain the value 'SUBST'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'substitutionPermission' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:code"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/ext:subjectOf2/ext:substitutionPermission/ext:code">

            <assert test="@code"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = 'TE'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'code' attribute shall contain the value 'TE'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.5.1070'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.5.1070'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;HL7:SUBSTANCEADMINSUBSTITUTION&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'HL7:SubstanceAdminSubstitution'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;THERAPEUTIC&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'displayName' attribute shall contain the value 'Therapeutic'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:repeatNumber">

            <assert test="cda:high"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:high) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:repeatNumber/cda:high">

            <assert test="@value"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag 'value' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:effectiveTime">

            <assert test="@xsi:type"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'effectiveTime' tag 'xsi:type' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@xsi:type) or normalize-space(@xsi:type) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'effectiveTime' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:period"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'period' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:period) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'period' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:effectiveTime/cda:period">

            <assert test="@value"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'period' tag 'value' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'period' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@xsi:type) or normalize-space(@xsi:type) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'period' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@unit) or normalize-space(@unit) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'period' tag 'unit' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16044']">

            <assert test="@typeCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16044']">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16044']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16044']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '103.16044'])"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16044']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;ADDITIONAL COMMENTS&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Additional Comments'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Comment (Medication Instruction Comment)" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:supply/@classCode = 'SPLY']">

            <assert test="@typeCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:supply) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'supply' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:independentInd">

            <assert test="@value"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'independentInd' tag 'value' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'independentInd' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@value) or normalize-space(@value) = '' or @value = 'false'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'independentInd' tag 'value' attribute shall contain the value 'false'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship[cda:act/cda:code/@code = '246205007']">

            <assert test="@typeCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship/cda:act[cda:code/@code = '246205007']">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'INT'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain the value 'INT'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '246205007']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '246205007']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply[@classCode='SPLY']/cda:entryRelationship/cda:act/cda:code[@code = '246205007'])"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply[@classCode = 'SPLY']/entryRelationship/act/code[@code = '246205007']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;SNOMED CT-AU&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;QUANTITY&quot;"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'displayName' attribute shall contain the value 'Quantity'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Quantity to Dispense (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturerOrganization">

            <assert test="cda:id"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturerOrganization/cda:id">

            <assert test="@root"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@assigningAuthorityName) or normalize-space(@assigningAuthorityName) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'assigningAuthorityName' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@assigningAuthorityName) or normalize-space(@assigningAuthorityName) = '' or @assigningAuthorityName = 'Australian PBS Manufacturer Code'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'assigningAuthorityName' attribute shall contain the value 'Australian PBS Manufacturer Code'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
