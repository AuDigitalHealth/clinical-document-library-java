<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_HPI-I_Common_Conformance_Requirements_Part3-errors"
        id="p-e-Referral_HPI-I_Common_Conformance_Requirements_Part3-errors"
        see="#p-e-Referral_HPI-I_Common_Conformance_Requirements_Part3-errors">

        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] |
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'PART']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] |
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REFT']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]">

            <assert test="ext:code">Error: e-Referral - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The
                'ext:code' tag is missing. Refer to "023876 - Local identifier details for a person
                in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                and  "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'PART']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REFT']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |  
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id">

            <assert test="@extension">Error: e-Referral - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The
                'ext:id' tag 'extension' attribute is missing. Refer to "023876 - Local identifier
                details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@assigningAuthorityName">Error: e-Referral - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) -
                The 'ext:id' tag 'assigningAuthorityName' attribute is missing. Refer to "023876 -
                Local identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>
