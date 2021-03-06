<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:11 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.2
                  IG Guide Title     : Prescriber
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_3A_Prescriber_6_1_2-errors"
        id="p-PCEHR_Prescription_Record_3A_Prescriber_6_1_2-errors"
        see="#p-PCEHR_Prescription_Record_3A_Prescriber_6_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/ext:coverage2[ext:entitlement/ext:participant/@typeCode = 'HLD']">

            <assert test="@typeCode"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COVBY'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain the value 'COVBY'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:entitlement) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'entitlement' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/ext:coverage2/ext:entitlement[ext:participant/@typeCode = 'HLD']">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'entitlement' tag 'classCode' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participant) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'participant' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:id"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Number" -
                The 'id' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:id) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Number" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:code"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:effectiveTime) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Validity Duration" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="ext:participant[@typeCode = 'HLD']">

            <assert test="
                count(/cda:ClinicalDocument//ext:participant[@typeCode = 'HLD']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/ext:coverage2/ext:entitlement/ext:participant[@typeCode='HLD'])"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/coverage2/entitlement/participant[@typeCode = 'HLD']' path -
                1 or more tags are missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participantRole) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'participantRole' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:participantRole"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'participantRole' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'HLD']/ext:participantRole">

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'participantRole' tag 'classCode' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ASSIGNED'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain the value 'ASSIGNED'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:id"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'id' tag is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:id) > 1"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'HLD']/ext:participantRole/ext:id">

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
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/ext:coverage2/ext:entitlement[ext:participant/@typeCode = 'HLD']/ext:code">

            <assert test="@code"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('\TEMPLATE\VALDN\CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[(@code = current()/@code)]"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'code' attribute shall be as per 10.14 NCTIS: Admin Codes - Entitlement Type.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101.104.16047'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16047'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Entitlement Type Values'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Entitlement Type Values'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) = '' or
                not(@displayName) or normalize-space(@displayName) = '' or
                document('\TEMPLATE\VALDN\CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Entitlement / Entitlement Type" -
                The 'code' tag 'code' and 'displayName' attributes shall match as per 10.14 NCTIS: Admin Codes - Entitlement Type.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
