<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 4/03/2015 9:33:29 AM

                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.2
                  IG Guide Title     : REPORTING PATHOLOGIST
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_3A_REPORTINGPATHOLOGIST_7_1_1_2-errors"
        id="p-Pathology_Report_3A_REPORTINGPATHOLOGIST_7_1_1_2-errors"
        see="#p-Pathology_Report_3A_REPORTINGPATHOLOGIST_7_1_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/ext:coverage2[ext:entitlement/ext:participant/@typeCode = 'HLD']">

            <assert test="@typeCode"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COVBY'"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'coverage2' tag 'typeCode' attribute shall contain the value 'COVBY'.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:entitlement) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'entitlement' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/ext:coverage2/ext:entitlement[ext:participant/@typeCode = 'HLD']">

            <assert test="@classCode"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'entitlement' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'entitlement' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participant) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'participant' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:id"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Number" -
                The 'id' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:id) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Number" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="ext:code"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:effectiveTime) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Validity Duration" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'HLD']">

            <assert test="ext:participantRole"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'participantRole' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:participantRole) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'participantRole' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'HLD']/ext:participantRole">

            <assert test="@classCode"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ASSIGNED'"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'participantRole' tag 'classCode' attribute shall contain the value 'ASSIGNED'.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:id"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'id' tag is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:id) > 1"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/ext:coverage2/ext:entitlement/ext:participant[@typeCode = 'HLD']/ext:participantRole/ext:id">

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
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/ext:coverage2/ext:entitlement[ext:participant/@typeCode = 'HLD']/ext:code">

            <assert test="@code"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[(@code = current()/@code)]"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'code' attribute shall be as per NCTIS: Admin Codes - Entitlement Type.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101.104.16047'"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16047'.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'code' and 'displayName' attributes shall match as per NCTIS: Admin Codes - Entitlement Type.
                Refer to section 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:translation)"
                >Error: Pathology Report - 7.1.1.2 REPORTING PATHOLOGIST -
                "REPORTING PATHOLOGIST / Participant / Entitlement / Entitlement Type" -
                The 'translation' tag shall not be present within 'code'.
                Refer to 7.1.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


    </pattern>

</schema>
