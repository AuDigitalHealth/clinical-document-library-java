<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_Common_Participant_Checks-errors"
        id="p-e-Referral_Common_Participant_Checks-errors"
        see="#p-e-Referral_Common_Participant_Checks-errors">

        <rule context="/cda:ClinicalDocument/cda:participant">

            <assert test="@typeCode">Error: e-Referral - 6.1.3.1 Patient Nominated Contacts Person
                OR 6.1.3.2 Patient Nominated Contacts Organisation OR 7.1.1.1.1 REFEREE PERSON OR
                7.1.1.1.2 REFEREE ORGANISATION OR 7.1.1.2.1 USUAL GP PERSON OR 7.1.1.2.2 USUAL GP
                ORGANISATION - The 'participant' tag 'typeCode' attribute is missing. Refer to
                section 6.1.3.1 OR 6.1.3.2 OR 7.1.1.1.1 OR 7.1.1.1.2 OR 7.1.1.2.1 OR 7.1.1.2.2 of
                the e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''">Error: e-Referral -
                6.1.3.1 Patient Nominated Contacts Person OR 6.1.3.2 Patient Nominated Contacts
                Organisation OR 7.1.1.1.1 REFEREE PERSON OR 7.1.1.1.2 REFEREE ORGANISATION OR
                7.1.1.2.1 USUAL GP PERSON OR 7.1.1.2.2 USUAL GP ORGANISATION - The 'participant' tag
                'typeCode' attribute shall contain a value. Refer to section 6.1.3.1 OR 6.1.3.2 OR
                7.1.1.1.1 OR 7.1.1.1.2 OR 7.1.1.2.1 OR 7.1.1.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert
                test="not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'PART' or @typeCode = 'IRCP' or @typeCode = 'REFT'"
                >Error: e-Referral - 6.1.3.1 Patient Nominated Contacts Person OR 6.1.3.2 Patient
                Nominated Contacts Organisation OR 7.1.1.1.1 REFEREE PERSON OR 7.1.1.1.2 REFEREE
                ORGANISATION OR 7.1.1.2.1 USUAL GP PERSON OR 7.1.1.2.2 USUAL GP ORGANISATION - The
                'participant' tag 'typeCode' attribute shall contain the value 'PART' or 'IRCP' or
                'REFT'. Refer to section 6.1.3.1 OR 6.1.3.2 OR 7.1.1.1.1 OR 7.1.1.1.2 OR 7.1.1.2.1
                OR 7.1.1.2.2 of the e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:associatedEntity">Error: e-Referral - 6.1.3.1 Patient Nominated
                Contacts Person OR 6.1.3.2 Patient Nominated Contacts Organisation OR 7.1.1.1.1
                REFEREE PERSON OR 7.1.1.1.2 REFEREE ORGANISATION OR 7.1.1.2.1 USUAL GP PERSON OR
                7.1.1.2.2 USUAL GP ORGANISATION - The 'associatedEntity' tag is missing. Refer to
                section 6.1.3.1 OR 6.1.3.2 OR 7.1.1.1.1 OR 7.1.1.1.2 OR 7.1.1.2.1 OR 7.1.1.2.2 of
                the e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>

    </pattern>

</schema>
