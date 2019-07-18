<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part3-errors"
        id="p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part3-errors"
        see="#p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part3-errors">


        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])] |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0') or (@nullFlavor)])] | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]">

            <assert test="ext:code">Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and
                6.1.2 Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The
                'ext:code' tag is missing. Refer to "023876 - Local identifier details for a person
                in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0') or (@nullFlavor)])]/ext:id | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id">

            <assert test="@extension">Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator
                and 6.1.2 Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST -
                The 'ext:id' tag 'extension' attribute is missing. Refer to "023876 - Local
                identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@assigningAuthorityName">Error: Diagnostic Imaging Report - 5.1.1 Legal
                Authenticator and 6.1.2 Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING
                RADIOLOGIST - The 'ext:id' tag 'assigningAuthorityName' attribute is missing. Refer
                to "023876 - Local identifier details for a person in an Entity Identifier element"
                of the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier
                for Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author as a Person
                (Healthcare Provider) or section 6.1.4 REQUESTER or section 7.1.1.2 REPORTING
                RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



    </pattern>

</schema>
