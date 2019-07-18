<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part1-errors"
        id="p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part1-errors"
        see="#p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part1-errors">


        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <report
                test="count(ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) > 1"
                >Error: Shared Health Summary - 5.1.1 Legal Authenticator and 6.1.2 Document Author
                - The 'asEntityIdentifier' tag with a HPI-I shall not exist more than once. Refer to
                023876 Local identifier details for a person in an Entity Identifier element of
                COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1 Legal Authenticator or section
                6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>




        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier">

            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) and (ext:code/@codeSystem = '2.16.840.1.113883.12.203')"
                >Error: Shared Health Summary - 5.1.1 Legal Authenticator and 6.1.2 Document Author
                - The 'asEntityIdentifier' tag shall have a National Identifier or a Local
                Identifier but not both. Refer to 023876 Local identifier details for a person in an
                Entity Identifier element of COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1
                Legal Authenticator or section 6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360') or starts-with(@root, '1.2.36.1.2001.1005.29.') or (@root = '1.2.36.1.2001.1005.29')])"
                >Error: Shared Health Summary - 5.1.1 Legal Authenticator and 6.1.2 Document Author
                - The 'asEntityIdentifier' tag for Legal Authenticator and Document Author shall not
                have an IHI or the local identifier of the consumer. Refer to 023876 Local
                identifier details for a person in an Entity Identifier element of
                COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1 Legal Authenticator or section
                6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report
                test="(ext:code/@codeSystem = '2.16.840.1.113883.12.203') and (ext:id/@assigningAuthorityName) and normalize-space(ext:id/@assigningAuthorityName) != '' and (((ext:id/@assigningAuthorityName) = 'IHI') or ((ext:id/@assigningAuthorityName) = 'HPI-I') 
                or ((ext:id/@assigningAuthorityName) = 'HPI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-D') or ((ext:id/@assigningAuthorityName) = 'PAI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-R'))"
                >Error: Shared Health Summary - 5.1.1 Legal Authenticator and 6.1.2 Document Author
                - The 'ext:id/@assigningAuthorityName' attribute where 'asEntityIdentifier' tag is
                having a Local Identifier shall not have National Identifier values. Refer to 023876
                Local identifier details for a person in an Entity Identifier element of
                COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1 Legal Authenticator or section
                6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>




        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:id">


            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Shared Health Summary - 6.1.2 Document Author - The 'asEntityIdentifier' tag
                shall not have a National Identifier other than an HPI-I if it starts with
                "1.2.36.1.2001.1003.0.". Refer to 3.3.5 Temporary relaxation of inclusion of HPI-I
                of PCEHR Conformance Profile for Shared Health Summary Clinical Documents v1.6 and
                section 6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Shared Health Summary - 6.1.2 Document Author - The 'asEntityIdentifier' tag
                shall not have a National Identifier other than an HPI-I if it starts with
                "1.2.36.1.2001.1003.0". Refer to 3.3.5 Temporary relaxation of inclusion of HPI-I of
                PCEHR Conformance Profile for Shared Health Summary Clinical Documents v1.6 and
                section 6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@nullFlavor">Error: Shared Health Summary - 6.1.2 Document Author - The
                'id' tag 'nullFlavor' attribute shall not exist. Refer to 3.3.5 Temporary relaxation
                of inclusion of HPI-I of PCEHR Conformance Profile for Shared Health Summary
                Clinical Documents v1.6 and section 6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier/ext:id">


            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Shared Health Summary - 5.1.1 Legal Authenticator - The 'asEntityIdentifier'
                tag shall not have a National Identifier other than an HPI-I. Refer to 023876 Local
                identifier details for a person in an Entity Identifier element of
                COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1 Legal Authenticator of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Shared Health Summary - 5.1.1 Legal Authenticator - The 'asEntityIdentifier'
                tag shall not have a National Identifier other than an HPI-I. Refer to 023876 Local
                identifier details for a person in an Entity Identifier element of
                COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1 Legal Authenticator of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>




        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code">

            <assert test="not(@code) or normalize-space(@code) = '' or (@code='EI')">Error: Shared
                Health Summary - 5.1.1 Legal Authenticator and 6.1.2 Document Author - The 'ext:code' tag 'code' attribute
                shall contain the value 'EI'. Refer to 023876 Local identifier details for a person
                in an Entity Identifier element of COMMON-ConformProfileClinDoc-v1.6 and section
                5.1.1 Legal Authenticator or section 6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>
    </pattern>

</schema>
