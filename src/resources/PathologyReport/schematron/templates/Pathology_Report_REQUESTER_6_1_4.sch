<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2016-07-20 2:03:56 PM

                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.4
                  IG Guide Title     : REQUESTER
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_REQUESTER_6_1_4-errors"
        id="p-Pathology_Report_REQUESTER_6_1_4-errors"
        see="#p-Pathology_Report_REQUESTER_6_1_4-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:participant"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER" -
                The 'participant' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:participant) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER" -
                The 'participant' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER" -
                The 'participant' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'REF'"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER" -
                The 'participant' tag 'typeCode' attribute shall contain the value 'REF'.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:associatedEntity) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Role" -
                The 'associatedEntity' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:associatedEntity"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Role" -
                The 'associatedEntity' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:time) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participation Period" -
                The 'time' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:time"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participation Period" -
                The 'time' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity">

            <report test="count(cda:code) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:code"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:id"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / id" -
                The 'id' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / id" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:associatedPerson) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant" -
                The 'associatedPerson' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:id">

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
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson">

            <assert test="cda:name"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(ext:asQualifications) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/cda:name/cda:family">

            <assert test="not(@nullFlavor)"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'family' tag 'nullFlavor' attribute shall not be present.
                Refer to "024692 - Pathology Report information which must be present and not null" of the eHealth_Pathology_Report_My_Health_Record_Conformance_Profile_v1.1 and section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asQualifications">

            <assert test="@classCode"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'QUAL'"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:code"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(ext:code) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:originalText) or normalize-space(cda:originalText) != ''"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Qualifications" -
                The 'originalText' tag shall contain a value.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:time">

            <report test="@value and normalize-space(@value) = ''"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participation Period" -
                The 'time' tag 'value' attribute shall contain a value.
                Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@nullFlavor)"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participation Period" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
