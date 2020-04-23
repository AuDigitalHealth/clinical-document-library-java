<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_HPI-I_Common_Conformance_Requirements_Part3-errors"
        id="p-Pathology_Report_HPI-I_Common_Conformance_Requirements_Part3-errors"
        see="#p-Pathology_Report_HPI-I_Common_Conformance_Requirements_Part3-errors">


        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0') or (@nullFlavor)])] | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]">

            <assert test="ext:code">Error: Pathology Report - 5.1.1 Legal Authenticator and 6.1.2
                Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING PATHOLOGIST - The
                'ext:code' tag is missing. Refer to "023876 - Local identifier details for a person
                in an Entity Identifier element of the
                Clinical_Documents_Common_Conformance_Profile_v1.6" and "023436 - Identifier for
                Document Author and 023648 - Identifier for reporting pathologist of
                eHealth_Pathology_Report_My_Health_Record_Conformance_Profile_v1.1" and "section
                5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING PATHOLOGIST" of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0') or (@nullFlavor)])]/ext:id | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id">

            <assert test="@extension">Error: Pathology Report - 5.1.1 Legal Authenticator and 6.1.2
                Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING PATHOLOGIST - The 'ext:id'
                tag 'extension' attribute is missing. Refer to "023876 - Local identifier details
                for a person in an Entity Identifier element of the
                Clinical_Documents_Common_Conformance_Profile_v1.6" and "023436 - Identifier for
                Document Author and 023648 - Identifier for reporting pathologist of
                eHealth_Pathology_Report_My_Health_Record_Conformance_Profile_v1.1" and "section
                5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING PATHOLOGIST" of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@assigningAuthorityName">Error: Pathology Report - 5.1.1 Legal
                Authenticator and 6.1.2 Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING
                PATHOLOGIST - The 'ext:id' tag 'assigningAuthorityName' attribute is missing. Refer
                to "023876 - Local identifier details for a person in an Entity Identifier element
                of the Clinical_Documents_Common_Conformance_Profile_v1.6" and "023436 - Identifier
                for Document Author and 023648 - Identifier for reporting pathologist of
                eHealth_Pathology_Report_My_Health_Record_Conformance_Profile_v1.1" and "section
                5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING PATHOLOGIST" of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier/ext:id">

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Pathology Report - 6.1.4 REQUESTER - The 'asEntityIdentifier' tag shall not
                have a National Identifier other than an HPI-I if it starts with
                "1.2.36.1.2001.1003.0". Refer to "023876 - Local identifier details for a person in
                an Entity Identifier element of Clinical_Documents_Common_Conformance_Profile_v1.6"
                and "section 6.1.4 REQUESTER" of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0')) and not(starts-with(@root, '1.2.36.1.2001.1003.0.800361'))"
                >Error: Pathology Report - 6.1.4 REQUESTER - The 'asEntityIdentifier' tag shall not
                have a National Identifier other than an HPI-I if it starts with
                "1.2.36.1.2001.1003.0.". Refer to "023876 - Local identifier details for a person in
                an Entity Identifier element of Clinical_Documents_Common_Conformance_Profile_v1.6"
                and "section 6.1.4 REQUESTER" of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>



        </rule>



    </pattern>

</schema>
