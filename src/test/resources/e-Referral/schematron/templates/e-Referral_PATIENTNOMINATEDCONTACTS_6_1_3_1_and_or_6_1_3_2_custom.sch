<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_PATIENTNOMINATEDCONTACTS_6_1_3_1_and_or_6_1_3_2_custom-errors"
        id="p-e-Referral_PATIENTNOMINATEDCONTACTS_6_1_3_1_and_or_6_1_3_2_custom-errors"
        see="#p-e-Referral_PATIENTNOMINATEDCONTACTS_6_1_3_1_and_or_6_1_3_2_custom-errors">

        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP']/cda:associatedEntity">

            <assert test="(cda:associatedPerson) or (cda:scopingOrganization)">Error: e-Referral -
                6.1.3.1 PATIENT NOMINATED CONTACTS PERSON and/or 6.1.3.2 PATIENT NOMINATED CONTACTS
                ORGANISATION - "Patient Nominated Contacts - Person / Participant" and/or "Patient
                Nominated Contacts - Organisation / Participant" - The 'associatedPerson' tag or the
                'scopingOrganization' is missing. Refer to section 6.1.3.1 and/or section 6.1.3.2 of
                the e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>

    </pattern>

</schema>
