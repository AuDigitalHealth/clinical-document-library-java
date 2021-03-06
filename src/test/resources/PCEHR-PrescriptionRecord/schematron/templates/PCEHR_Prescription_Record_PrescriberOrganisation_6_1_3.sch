<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_PrescriberOrganisation_6_1_3-errors"
        id="p-PCEHR_Prescription_Record_PrescriberOrganisation_6_1_3-errors"
        see="#p-PCEHR_Prescription_Record_PrescriberOrganisation_6_1_3-errors">


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility">

            <assert test="cda:id"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'id' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:code"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:serviceProviderOrganization"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'serviceProviderOrganization' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:serviceProviderOrganization) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'serviceProviderOrganization' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:id">

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
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter">

            <assert test="cda:location"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation" -
                The 'location' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:location) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation" -
                The 'location' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location">

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation" -
                The 'location' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'LOC'"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation" -
                The 'location' tag 'typeCode' attribute shall contain the value 'LOC'.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:healthCareFacility"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Role" -
                The 'healthCareFacility' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:healthCareFacility) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Role" -
                The 'healthCareFacility' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization">

            <assert test="cda:asOrganizationPartOf"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'asOrganizationPartOf' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'asOrganizationPartOf' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:name) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Department/Unit" -
                The 'name' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:asOrganizationPartOf">

            <assert test="cda:wholeOrganization"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'wholeOrganization' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:wholeOrganization) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant" -
                The 'wholeOrganization' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <assert test="not(ext:asEntityIdentifier) or ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag for 'HPI-O' is missing.
                "The value of one Entity Identifier SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="ext:asEntityIdentifier"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:name"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:name) > 1"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag shall appear only once.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:addr">

            <assert test="@use"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Address" -
                The 'addr' tag 'use' attribute is missing.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@use) or normalize-space(@use) != ''"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Address" -
                The 'addr' tag 'use' attribute shall contain a value.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@use) or normalize-space(@use) = '' or @use = 'WP'"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Address" -
                The 'addr' tag 'use' attribute shall contain the value 'WP'.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

            <report test="@use and normalize-space(@use) = ''"
                >Error: PCEHR Prescription Record - 6.1.3 Prescriber Organisation -
                "Prescriber Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag 'use' attribute shall contain a value.
                Refer to section 6.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>
