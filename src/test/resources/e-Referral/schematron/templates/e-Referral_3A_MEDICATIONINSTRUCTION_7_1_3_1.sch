<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 21-02-2014 08:58:25

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.3.1
                  IG Guide Title     : MEDICATION INSTRUCTION
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_MEDICATIONINSTRUCTION_7_1_3_1-errors"
        id="p-e-Referral_3A_MEDICATIONINSTRUCTION_7_1_3_1-errors"
        see="#p-e-Referral_3A_MEDICATIONINSTRUCTION_7_1_3_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry[cda:substanceAdministration/@classCode = 'SBADM']">

            <report test="count(cda:substanceAdministration) > 1"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'substanceAdministration' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'substanceAdministration' tag 'moodCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'id' tag is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:consumable"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'consumable' tag is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:consumable) > 1"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'consumable' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Directions" -
                The 'text' tag is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Directions" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

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
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'consumable' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:manufacturedProduct"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'manufacturedProduct' tag is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:manufacturedProduct) > 1"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'manufacturedProduct' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'manufacturedProduct' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:manufacturedMaterial"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'manufacturedMaterial' tag is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:manufacturedMaterial) > 1"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'manufacturedMaterial' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'manufacturedMaterial' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'manufacturedMaterial' tag 'nullFlavor' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'code' tag is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Medicine" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Directions" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction / Directions" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>
