<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 2:42:15 PM

                  Product            : PCEHR Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1
                  IG Guide Title     : Dispense Item (MEDICATION ACTION)
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_3A_DispenseItem_MEDICATIONACTION_7_1_1-errors"
        id="p-PCEHR_Dispense_Record_3A_DispenseItem_MEDICATIONACTION_7_1_1-errors"
        see="#p-PCEHR_Dispense_Record_3A_DispenseItem_MEDICATIONACTION_7_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']">

            <assert test="cda:entry[cda:substanceAdministration/@classCode = 'SBADM']"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'entry' tag is missing for 'Dispense Item'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entry) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'entry' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry[cda:substanceAdministration/@classCode = 'SBADM']">

            <report test="count(cda:substanceAdministration) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'substanceAdministration' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'substanceAdministration' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:entryRelationship[cda:supply/@classCode = 'SPLY']"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'entryRelationship' tag is missing for 'Dispense Item'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:supply/@classCode = 'SPLY']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'entryRelationship' tag shall appear only once for 'Dispense Item'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:statusCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'statusCode' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:statusCode) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'statusCode' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:consumable"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'consumable' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:consumable) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'consumable' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16769.171.1.1']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag shall appear only once for ' Therapeutic Good Strength (Additional Therapeutic Good Detail)'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16272']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'entryRelationship' tag shall appear only once for ' Formula'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16044']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag shall appear only once for ' Comment (Medication Instruction Comment)'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:repeatNumber) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Maximum Number of Repeats (Number of Repeats)" -
                The 'repeatNumber' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:supply/@classCode = 'SPLY']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:supply) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'supply' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:sequenceNumber) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Number of this Dispense" -
                The 'sequenceNumber' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']">

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'supply' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'supply' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'supply' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:independentInd"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'independentInd' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:independentInd) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'independentInd' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Dispense Item Identifier (Medication Action Instance Identifier)" -
                The 'id' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Dispense Item Identifier (Medication Action Instance Identifier)" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:effectiveTime"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / DateTime of Dispense Event (Medication Action DateTime)" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / DateTime of Dispense Event (Medication Action DateTime)" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:product"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Identification" -
                The 'product' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:product) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Identification" -
                The 'product' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16109']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'entryRelationship' tag shall appear only once for ' Label Instruction (Medication Action Instructions)'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '246205007']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag shall appear only once for ' Quantity Description'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16064']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'entryRelationship' tag shall appear only once for ' Brand Substitution Occurred'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16786']) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'entryRelationship' tag shall appear only once for ' Unique Pharmacy Prescription Number (Administrative System Identifier)'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:independentInd">

            <assert test="@value"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'independentInd' tag 'value' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'independentInd' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@value) or normalize-space(@value) = '' or @value = 'false'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'independentInd' tag 'value' attribute shall contain the value 'false'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:statusCode">

            <assert test="@code"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'statusCode' tag 'code' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'statusCode' tag 'code' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable">

            <report test="count(cda:manufacturedProduct) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'manufacturedProduct' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:manufacturedProduct"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'manufacturedProduct' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct">

            <report test="count(cda:manufacturedMaterial) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'manufacturedMaterial' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:manufacturedMaterial"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item" -
                The 'manufacturedMaterial' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:effectiveTime">

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / DateTime of Dispense Event (Medication Action DateTime)" -
                The 'effectiveTime' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial">

            <assert test="cda:code"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Identification" -
                The 'code' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Identification" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:name) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'name' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:desc) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Additional Dispensed Item Description (Additional Therapeutic Good Detail)" -
                The 'desc' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:formCode) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Ingredients and Form (CHEMICAL DESCRIPTION OF MEDICATION) / Form" -
                The 'formCode' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16769.171.1.1']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16769.171.1.1']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:text"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16769.171.1.1']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16769.171.1.1']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '103.16769.171.1.1'])"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16769.171.1.1']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;THERAPEUTIC GOOD STRENGTH&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Generic Name (Additional Therapeutic Good Detail)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Therapeutic Good Strength'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Therapeutic Good Strength (Additional Therapeutic Good Detail)" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship[cda:act/cda:code/@code = '103.16109']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship/cda:act[cda:code/@code = '103.16109']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:text"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.16109']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16109']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply[@classCode='SPLY']/cda:entryRelationship/cda:act/cda:code[@code = '103.16109'])"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply[@classCode = 'SPLY']/entryRelationship/act/code[@code = '103.16109']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;LABEL INSTRUCTION&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Label Instruction'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship/cda:act[cda:code/@code = '103.16109']/cda:text">

            <assert test="@xsi:type"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'text' tag 'xsi:type' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@xsi:type) or normalize-space(@xsi:type) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or @xsi:type = 'ST'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Label Instruction (Medication Action Instructions)" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16272']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16272']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.16272']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16272']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '103.16272'])"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16272']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;FORMULA&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'code' tag 'displayName' attribute shall contain the value 'Formula'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Formula" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship[cda:act/cda:code/@code = '246205007']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship/cda:act[cda:code/@code = '246205007']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '246205007']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '246205007']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply[@classCode='SPLY']/cda:entryRelationship/cda:act/cda:code[@code = '246205007'])"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply[@classCode = 'SPLY']/entryRelationship/act/code[@code = '246205007']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;SNOMED CT-AU&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;QUANTITY&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'code' tag 'displayName' attribute shall contain the value 'Quantity'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Quantity Dispensed (AMOUNT OF MEDICATION) / Quantity Description" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16044']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16044']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16044']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16044']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '103.16044'])"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16044']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;ADDITIONAL COMMENTS&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Additional Comments'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Comment (Medication Instruction Comment)" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16064']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:observation) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16064']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:value"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'value' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:value) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '103.16064']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16064']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply[@classCode='SPLY']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16064'])"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply[@classCode = 'SPLY']/entryRelationship/observation/code[@code = '103.16064']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;BRAND SUBSTITUTION OCCURRED&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'code' tag 'displayName' attribute shall contain the value 'Brand substitution occurred'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16064']/cda:value">

            <assert test="@xsi:type"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'value' tag 'xsi:type' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@xsi:type) or normalize-space(@xsi:type) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or @xsi:type = 'BL'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Brand Substitution Occurred" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'BL'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:supply/@classCode = 'SPLY']/cda:sequenceNumber">

            <assert test="@value"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Number of this Dispense" -
                The 'sequenceNumber' tag 'value' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Number of this Dispense" -
                The 'sequenceNumber' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:repeatNumber">

            <assert test="cda:high"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:high) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:repeatNumber/cda:high">

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag 'value' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@value"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Maximum Number of Repeats (Number of Repeats)" -
                The 'high' tag 'value' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct">

            <report test="count(cda:manufacturerOrganization) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'manufacturerOrganization' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturerOrganization">

            <report test="count(cda:id) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturerOrganization/cda:id">

            <assert test="@root"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@assigningAuthorityName) or normalize-space(@assigningAuthorityName) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'assigningAuthorityName' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@assigningAuthorityName) or normalize-space(@assigningAuthorityName) = '' or @assigningAuthorityName = 'Australian PBS Manufacturer Code'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / PBS Manufacturer Code (Administrative Manufacturer Code)" -
                The 'id' tag 'assigningAuthorityName' attribute shall contain the value 'Australian PBS Manufacturer Code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship[cda:act/cda:code/@code = '103.16786']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:act) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:entryRelationship/cda:act[cda:code/@code = '103.16786']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:text"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16786']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16786']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply[@classCode='SPLY']/cda:entryRelationship/cda:act/cda:code[@code = '103.16786'])"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply[@classCode = 'SPLY']/entryRelationship/act/code[@code = '103.16786']' path -
                1 or more tags are missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;UNIQUE PHARMACY PRESCRIPTION NUMBER&quot;"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Unique Pharmacy Prescription Number'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: PCEHR Dispense Record - 7.1.1 Dispense Item (MEDICATION ACTION) -
                "Dispense Item / Unique Pharmacy Prescription Number (Administrative System Identifier)" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
