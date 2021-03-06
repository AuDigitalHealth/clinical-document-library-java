<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2/10/2013 9:48:32 AM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.4
                  IG Guide Title     : Prescriber organisation
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_Prescriberorganisation_7_4-errors"
        id="p-e-Prescription_Prescriberorganisation_7_4-errors"
        see="#p-e-Prescription_Prescriberorganisation_7_4-errors">


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter">

            <assert test="cda:location"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization" -
                The 'location' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:location) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization" -
                The 'location' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization" -
                The 'location' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'LOC'"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization" -
                The 'location' tag 'typeCode' attribute shall contain the value 'LOC'.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:healthCareFacility"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participation Type" -
                The 'healthCareFacility' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:healthCareFacility) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participation Type" -
                The 'healthCareFacility' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility">

            <assert test="cda:id"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participation Type" -
                The 'id' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participation Type" -
                The 'id' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:code"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Role" -
                The 'code' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:serviceProviderOrganization"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant" -
                The 'serviceProviderOrganization' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:serviceProviderOrganization) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant" -
                The 'serviceProviderOrganization' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization">

            <assert test="cda:asOrganizationPartOf"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant" -
                The 'asOrganizationPartOf' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant" -
                The 'asOrganizationPartOf' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <report test="count(cda:name) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Person or Organization or Device / Organization / Department/Unit" -
                The 'name' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:asOrganizationPartOf">

            <assert test="cda:wholeOrganization"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant" -
                The 'wholeOrganization' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:wholeOrganization) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant" -
                The 'wholeOrganization' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <assert test="ext:asEntityIdentifier"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(ext:asEntityIdentifier) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="not(ext:asEntityIdentifier) or ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag for 'HPI-O' is missing.
                "The value of one Entity Identifier SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="cda:addr"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:addr) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Address" -
                The 'addr' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:telecom"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="cda:name"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Person or Organization or Device / Organization / Organization Name" -
                The 'name' tag is missing.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:name) > 1"
                >Error: e-Prescription - 7.4 Prescriber organisation -
                "Prescriber Organization / Participant / Person or Organization or Device / Organization / Organization Name" -
                The 'name' tag shall appear only once.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


    </pattern>

</schema>
