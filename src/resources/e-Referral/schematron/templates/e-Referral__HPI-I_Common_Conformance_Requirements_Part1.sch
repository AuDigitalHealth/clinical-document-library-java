<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_HPI-I_Common_Conformance_Requirements_Part1-errors"
        id="p-e-Referral_HPI-I_Common_Conformance_Requirements_Part1-errors"
        see="#p-e-Referral_HPI-I_Common_Conformance_Requirements_Part1-errors">



        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson|
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'PART']/cda:associatedEntity/cda:associatedPerson|
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REFT']/cda:associatedEntity/cda:associatedPerson|
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:assignedPerson">

            <report
                test="count(ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) > 1"
                >Error: e-Referral - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The 'asEntityIdentifier' tag
                with a HPI-I shall not exist more than once. Refer to "023876 - Local identifier
                details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier |
             /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier|
             /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'PART']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier|
             /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REFT']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier|
             /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier">
            


            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) and (ext:code/@codeSystem = '2.16.840.1.113883.12.203')"
                >Error: e-Referral - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The 'asEntityIdentifier' tag
                shall have a National Identifier or a Local Identifier but not both. Refer to
                "023876 - Local identifier details for a person in an Entity Identifier element" of
                the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360') or starts-with(@root, '1.2.36.1.2001.1005.29.') or (@root = '1.2.36.1.2001.1005.29')])"
                >Error: e-Referral - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The 'asEntityIdentifier' tag
                for Legal Authenticator and Document Author shall not have an IHI or the local
                identifier of the consumer. Refer to "023876 - Local identifier details for a person
                in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report
                test="(ext:code/@codeSystem = '2.16.840.1.113883.12.203') and (ext:id/@assigningAuthorityName) and normalize-space(ext:id/@assigningAuthorityName) != '' and (((ext:id/@assigningAuthorityName) = 'IHI') or ((ext:id/@assigningAuthorityName) = 'HPI-I') 
                or ((ext:id/@assigningAuthorityName) = 'HPI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-D') or ((ext:id/@assigningAuthorityName) = 'PAI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-R'))"
                >Error: e-Referral - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The
                'ext:id/@assigningAuthorityName' attribute where 'asEntityIdentifier' tag is having
                a Local Identifier shall not have National Identifier values. Refer to "023876 -
                Local identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:id |
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'PART']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier/ext:id|
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REFT']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier/ext:id|
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier/ext:id">
            
            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: e-Referral - 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The 'asEntityIdentifier' tag shall not have a National
                Identifier other than an HPI-I if it starts with "1.2.36.1.2001.1003.0.". Refer to
                "023876 - Local identifier details for a person in an Entity Identifier element" of
                the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: e-Referral - 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The 'asEntityIdentifier' tag shall not have a National
                Identifier other than an HPI-I if it starts with "1.2.36.1.2001.1003.0". Refer to
                "023876 - Local identifier details for a person in an Entity Identifier element" of
                the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@nullFlavor">Error: e-Referral - 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The 'id' tag 'nullFlavor' attribute shall
                not exist. Refer to "023876 - Local identifier details for a person in an Entity
                Identifier element" of the Clinical_Documents_Common_Conformance_Profile_v1.6 and
                "023858 - Document Author Entity Identifier value and/or 023859 - Diagnostic
                Investigations Service Provider Entity Identifier value" of the
                XXXXX and "section 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier/ext:id">


            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: e-Referral - 5.1.1 Legal Authenticator - The 'asEntityIdentifier' tag
                shall not have a National Identifier other than an HPI-I. Refer to "023876 - Local
                identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: e-Referral - 5.1.1 Legal Authenticator - The 'asEntityIdentifier' tag
                shall not have a National Identifier other than an HPI-I. Refer to "023876 - Local
                identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code |
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'PART']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code |
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REFT']/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code ">
            
            <assert test="not(@code) or normalize-space(@code) = '' or (@code='EI')">Error: Event
                Summary - 5.1.1 Legal Authenticator and 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) - The 'ext:code' tag 'code' attribute shall
                contain the value 'EI'. Refer to "023876 - Local identifier details for a person in
                an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023858 - Document Author
                Entity Identifier value and/or 023859 - Diagnostic Investigations Service Provider
                Entity Identifier value" of the XXXXX and
                "section 5.1.1 Legal Authenticator or 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>




    </pattern>

</schema>
