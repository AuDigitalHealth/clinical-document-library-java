<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 03-10-2013 18:40:39

                  Product            : Prescription Request
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.6
                  IG Guide Title     : Prescriber Organization
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_PrescriberOrganization_7_6-errors"
        id="p-Prescription_Request_PrescriberOrganization_7_6-errors"
        see="#p-Prescription_Request_PrescriberOrganization_7_6-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:author/cda:assignedAuthor">

            <assert test="cda:representedOrganization"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation" -
                The 'representedOrganization' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:representedOrganization) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation" -
                The 'representedOrganization' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:author/cda:assignedAuthor/cda:representedOrganization">

            <assert test="cda:id"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participation Type" -
                The 'id' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participation Type" -
                The 'id' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:standardIndustryClassCode"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:standardIndustryClassCode) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:asOrganizationPartOf"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant" -
                The 'asOrganizationPartOf' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant" -
                The 'asOrganizationPartOf' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:name) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Department/Unit" -
                The 'name' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:author/cda:assignedAuthor/cda:representedOrganization/cda:id">

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
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participation Type" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:author/cda:assignedAuthor/cda:representedOrganization/cda:standardIndustryClassCode">

            <assert test="@code"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag 'code' attribute is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag 'code' attribute shall contain a value.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag 'codeSystem' attribute is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag 'codeSystemName' attribute shall contain a value.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Role" -
                The 'standardIndustryClassCode' tag 'displayName' attribute shall contain a value.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:author/cda:assignedAuthor/cda:representedOrganization/cda:asOrganizationPartOf">

            <assert test="cda:wholeOrganization"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant" -
                The 'wholeOrganization' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:wholeOrganization) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant" -
                The 'wholeOrganization' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:author/cda:assignedAuthor/cda:representedOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <assert test="ext:asEntityIdentifier"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:asEntityIdentifier) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="not(ext:asEntityIdentifier) or ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag for 'HPI-O' is missing.
                "The value of one Entity Identifier SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:addr"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:addr) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Address" -
                The 'addr' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:telecom"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:name"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag is missing.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:name) > 1"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag shall appear only once.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:author/cda:assignedAuthor/cda:representedOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

            <report test="@use and normalize-space(@use) = ''"
                >Error: Prescription Request - 7.6 Prescriber Organization -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag 'use' attribute shall contain a value.
                Refer to section 7.6 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


    </pattern>

</schema>
