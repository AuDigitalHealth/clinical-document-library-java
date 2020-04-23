<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part1-errors"
        id="p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part1-errors"
        see="#p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part1-errors">

        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <report
                test="count(ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) > 1"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The
                'asEntityIdentifier' tag with a HPI-I shall not exist more than once. Refer to
                "023876 - Local identifier details for a person in an Entity Identifier element" of
                the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>




        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier">


            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) and (ext:code/@codeSystem = '2.16.840.1.113883.12.203')"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The
                'asEntityIdentifier' tag shall have a National Identifier or a Local Identifier but
                not both. Refer to "023876 - Local identifier details for a person in an Entity
                Identifier element" of the Clinical_Documents_Common_Conformance_Profile_v1.6 and
                "023436 - Identifier for Document Author and 023553 - Identifier for reporting
                radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360') or starts-with(@root, '1.2.36.1.2001.1005.29.') or (@root = '1.2.36.1.2001.1005.29')])"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The
                'asEntityIdentifier' tag for Legal Authenticator and Document Author and REQUESTER
                and REPORTING RADIOLOGIST shall not have an IHI or the local identifier of the
                consumer. Refer to "023876 - Local identifier details for a person in an Entity
                Identifier element" of the Clinical_Documents_Common_Conformance_Profile_v1.6 and
                "023436 - Identifier for Document Author and 023553 - Identifier for reporting
                radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(ext:code/@codeSystem = '2.16.840.1.113883.12.203') and (ext:id/@assigningAuthorityName) and normalize-space(ext:id/@assigningAuthorityName) != '' and (((ext:id/@assigningAuthorityName) = 'IHI') or ((ext:id/@assigningAuthorityName) = 'HPI-I') 
                or ((ext:id/@assigningAuthorityName) = 'HPI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-D') or ((ext:id/@assigningAuthorityName) = 'PAI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-R'))"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The
                'ext:id/@assigningAuthorityName' attribute where 'asEntityIdentifier' tag is having
                a Local Identifier shall not have National Identifier values. Refer to "023876 Local
                identifier details for a person in an Entity Identifier element of
                Clinical_Documents_Common_Conformance_Profile_v1.6" and "section 5.1.1 Legal
                Authenticator or section 6.1.2 Document Author or section 6.1.4 REQUESTER or section
                7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>




        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:id |            
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:id">

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and 7.1.1.2 REPORTING
                RADIOLOGIST - The 'asEntityIdentifier' tag shall not have a National Identifier
                other than an HPI-I if it starts with "1.2.36.1.2001.1003.0.". Refer to "023876 -
                Local identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 6.1.2 Document Author or section 7.1.1.2 Reporting Radiologist" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and 7.1.1.2 REPORTING
                RADIOLOGIST - The 'asEntityIdentifier' tag shall not have a National Identifier
                other than an HPI-I if it starts with "1.2.36.1.2001.1003.0". Refer to "023876 -
                Local identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 6.1.2 Document Author or section 7.1.1.2 Reporting Radiologist" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@nullFlavor">Error: Diagnostic Imaging Report - 6.1.2 Document Author and
                7.1.1.2 REPORTING RADIOLOGIST - The 'id' tag 'nullFlavor' attribute shall not exist.
                Refer to "023876 - Local identifier details for a person in an Entity Identifier
                element" of the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 -
                Identifier for Document Author and 023553 - Identifier for reporting radiologist" of
                the eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section
                7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier/ext:id">

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator - The
                'asEntityIdentifier' tag shall not have a National Identifier other than an HPI-I.
                Refer to "023876 - Local identifier details for a person in an Entity Identifier
                element" of the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 -
                Identifier for Document Author and 023553 - Identifier for reporting radiologist" of
                the eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator - The
                'asEntityIdentifier' tag shall not have a National Identifier other than an HPI-I.
                Refer to "023876 - Local identifier details for a person in an Entity Identifier
                element" of the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 -
                Identifier for Document Author and 023553 - Identifier for reporting radiologist" of
                the eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]]/ext:code">

            <assert test="not(@code) or normalize-space(@code) = '' or (@code='EI')">Error:
                Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document Author and
                6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:code' tag 'code'
                attribute shall contain the value 'EI'. Refer to "023876 - Local identifier details
                for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>
