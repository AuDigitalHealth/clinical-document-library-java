<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 03-10-2013 18:40:34

                  Product            : Prescription Request
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.4
                  IG Guide Title     : Dispensing Organization
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_DispensingOrganization_7_4-errors"
        id="p-Prescription_Request_DispensingOrganization_7_4-errors"
        see="#p-Prescription_Request_DispensingOrganization_7_4-errors">


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter">

            <assert test="cda:location[cda:healthCareFacility/cda:code/@code = 'PHARM']"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation" -
                The 'location' tag is missing for 'Dispensing Organisation'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:location[cda:healthCareFacility/cda:code/@code = 'PHARM']) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation" -
                The 'location' tag shall appear only once for 'Dispensing Organisation'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location[cda:healthCareFacility/cda:code/@code = 'PHARM']">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation" -
                The 'location' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'LOC'"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation" -
                The 'location' tag 'typeCode' attribute shall contain the value 'LOC'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:healthCareFacility) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participation Type" -
                The 'healthCareFacility' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code/@code = 'PHARM']">

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participation Type" -
                The 'id' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:serviceProviderOrganization"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant" -
                The 'serviceProviderOrganization' tag is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:serviceProviderOrganization) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant" -
                The 'serviceProviderOrganization' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code/@code = 'PHARM']/cda:id">

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
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participation Type" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:code[@code = 'PHARM']">

            <assert test="@codeSystem"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.1.11.17660'"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.1.11.17660'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'HL7 ServiceDeliveryLocationRoleType'"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'HL7 ServiceDeliveryLocationRoleType'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Pharmacy'"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'code' tag 'displayName' attribute shall contain the value 'Pharmacy'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Role" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code/@code = 'PHARM']/cda:serviceProviderOrganization">

            <assert test="cda:asOrganizationPartOf"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant" -
                The 'asOrganizationPartOf' tag is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant" -
                The 'asOrganizationPartOf' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:name) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Person or Organisation or Device / Organisation / Department/Unit" -
                The 'name' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code/@code = 'PHARM']/cda:serviceProviderOrganization/cda:asOrganizationPartOf">

            <assert test="cda:wholeOrganization"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant" -
                The 'wholeOrganization' tag is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:wholeOrganization) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant" -
                The 'wholeOrganization' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code/@code = 'PHARM']/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <assert test="ext:asEntityIdentifier"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(ext:asEntityIdentifier) or ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag for 'HPI-O' is missing.
                "The value of one Entity Identifier SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:asEntityIdentifier) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:addr"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:addr) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Address" -
                The 'addr' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:telecom"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:name"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag is missing.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:name) > 1"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag shall appear only once.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code/@code = 'PHARM']/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:addr">

            <report test="@use and normalize-space(@use) = ''"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Address" -
                The 'addr' tag 'use' attribute shall contain a value.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @use and normalize-space(@use) != '' and @use != 'WP'"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Address" -
                The 'addr' tag 'use' attribute shall contain the value 'WP'.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code/@code = 'PHARM']/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

            <report test="@use and normalize-space(@use) = ''"
                >Error: Prescription Request - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag 'use' attribute shall contain a value.
                Refer to section 7.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


    </pattern>

</schema>
