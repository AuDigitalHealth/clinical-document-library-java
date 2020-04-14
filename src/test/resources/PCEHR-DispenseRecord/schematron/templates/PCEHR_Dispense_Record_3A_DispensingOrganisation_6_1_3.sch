<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 2:42:14 PM

                  Product            : PCEHR Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.3
                  IG Guide Title     : Dispensing Organisation
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_3A_DispensingOrganisation_6_1_3-errors"
        id="p-PCEHR_Dispense_Record_3A_DispensingOrganisation_6_1_3-errors"
        see="#p-PCEHR_Dispense_Record_3A_DispensingOrganisation_6_1_3-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/ext:coverage2[ext:entitlement/ext:participant/@typeCode = 'HLD']">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COVBY'"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain the value 'COVBY'.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:entitlement) > 1"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'entitlement' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/ext:coverage2/ext:entitlement[ext:participant/@typeCode = 'HLD']">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participant) > 1"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'participant' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:id"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Number" -
                The 'id' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:id) > 1"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Number" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:code"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:effectiveTime) > 1"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Validity Duration" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="ext:participant[@typeCode = 'HLD']">

            <assert test="
                count(/cda:ClinicalDocument//ext:participant[@typeCode = 'HLD']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16210']/ext:coverage2/ext:entitlement/ext:participant[@typeCode='HLD'])"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16210']/coverage2/entitlement/participant[@typeCode = 'HLD']' path -
                1 or more tags are missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:participantRole"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'participantRole' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participantRole) > 1"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'participantRole' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'HLD']/ext:participantRole">

            <assert test="@classCode"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SDLOC'"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain the value 'SDLOC'.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:id"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'id' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:id) > 1"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'HLD']/ext:participantRole/ext:id">

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
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/ext:coverage2/ext:entitlement[ext:participant/@typeCode = 'HLD']/ext:code">

            <assert test="@code"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('\TEMPLATE\VALDN\CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[(@code = current()/@code)]"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'code' attribute shall be as per NCTIS: Admin Codes - Entitlement Type.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101.104.16047'"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16047'.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS ENTITLEMENT TYPE VALUES&quot;"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Entitlement Type Values'.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) = '' or
                not(@displayName) or normalize-space(@displayName) = '' or
                document('\TEMPLATE\VALDN\CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'code' and 'displayName' attributes shall match as per NCTIS: Admin Codes - Entitlement Type.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
