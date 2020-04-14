<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part2-errors"
        id="p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part2-errors"
        see="#p-Diagnostic_Imaging_Report_HPI-I_Common_Conformance_Requirements_Part2-errors">


        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')] |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')] |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')] | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1005.41.') or (@root = '1.2.36.1.2001.1005.41')]">

            <assert test="not(@root) or (starts-with(@root, '1.2.36.1.2001.1005.41.800362'))">Error:
                Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document Author and
                6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:id' tag 'root'
                attribute SHALL be the OID 1.2.36.1.2001.1005.41 followed by the national healthcare
                identifier of the organisation that maintains the local identifier. Refer to "023876
                - Local identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and not(string-length(@root) &gt;= 38)"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:id' tag
                'root' attribute SHALL be the OID 1.2.36.1.2001.1005.41 followed by the national
                healthcare identifier of the organisation that maintains the local identifier. Refer
                to "023876 - Local identifier details for a person in an Entity Identifier element"
                of the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier
                for Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and (string-length(@root) &gt;= 38) and contains(substring(@root, 23, 16), '.')"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:id' tag
                'root' attribute SHALL be the OID 1.2.36.1.2001.1005.41 followed by the national
                healthcare identifier of the organisation that maintains the local identifier. Refer
                to "023876 - Local identifier details for a person in an Entity Identifier element"
                of the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier
                for Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (substring(@root, string-length(@root), 1) = '.')">Error:
                Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document Author and
                6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:id' tag 'root'
                attribute SHALL be the OID 1.2.36.1.2001.1005.41 followed by the national healthcare
                identifier of the organisation that maintains the local identifier and SHALL NOT end
                with a dot (.). Refer to "023876 - Local identifier details for a person in an
                Entity Identifier element" of the Clinical_Documents_Common_Conformance_Profile_v1.6
                and "023436 - Identifier for Document Author and 023553 - Identifier for reporting
                radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and (string-length(@root) &gt; 38) and substring(@root, 39, 1) != '.'"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:id' tag
                'root' attribute SHALL be the OID 1.2.36.1.2001.1005.41 followed by the national
                healthcare identifier of the organisation that maintains the local identifier. Refer
                to "023876 - Local identifier details for a person in an Entity Identifier element"
                of the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier
                for Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (number(translate(@root, '0123456789.', '00000000000')) != 0)"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:id' tag
                'root' attribute SHALL be a valid OID. Refer to "023876 - Local identifier details
                for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 6.1.2 Document Author or section 6.1.4 REQUESTER or section 7.1.1.2
                REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and not(
                (
                number(substring(string(2 * 8), 1, 1)) + number(substring(string(2 * 8), 2, 1)) +
                0 +
                2 * 0 +
                3 +
                number(substring(string(2 * 6), 1, 1)) + number(substring(string(2 * 6), 2, 1)) +
                number(substring(substring-after(@root, '80036'), 1, 1)) +
                number(substring(string(2 * substring(substring-after(@root, '80036'), 2, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 2, 1))), 1)) +
                number(substring(string(number(substring(substring-after(@root, '80036'), 2, 1)) div 5), 1, 1)) +
                number(substring(substring-after(@root, '80036'), 3, 1)) +
                number(substring(string(2 * substring(substring-after(@root, '80036'), 4, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 4, 1))), 1)) +
                number(substring(string(number(substring(substring-after(@root, '80036'), 4, 1)) div 5), 1, 1)) +
                number(substring(substring-after(@root, '80036'), 5, 1)) +
                number(substring(string(2 * substring(substring-after(@root, '80036'), 6, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 6, 1))), 1)) +
                number(substring(string(number(substring(substring-after(@root, '80036'), 6, 1)) div 5), 1, 1)) +
                number(substring(substring-after(@root, '80036'), 7, 1)) +
                number(substring(string(2 * substring(substring-after(@root, '80036'), 8, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 8, 1))), 1)) +
                number(substring(string(number(substring(substring-after(@root, '80036'), 8, 1)) div 5), 1, 1)) +
                number(substring(substring-after(@root, '80036'), 9, 1)) +
                number(substring(string(2 * substring(substring-after(@root, '80036'),10, 1)), string-length(string(2 * substring(substring-after(@root, '80036'),10, 1))), 1)) +
                number(substring(string(number(substring(substring-after(@root, '80036'),10, 1)) div 5), 1, 1)) +
                number(substring(substring-after(@root, '80036'), 11, 1))
                ) mod 10 = 0)"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:id' tag
                'root' attribute having the OID 1.2.36.1.2001.1005.41 followed by the national
                healthcare identifier of the organisation that maintains the local identifier SHALL
                have a valid Luhn check digit. Refer to "023876 - Local identifier details for a
                person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:code |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:code |
            /cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:code | 
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:code">

            <assert test="@code">Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and
                6.1.2 Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The
                'ext:code' tag 'code' attribute is missing. Refer to "023876 - Local identifier
                details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem">Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator
                and 6.1.2 Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST -
                The 'ext:code' tag 'codeSystem' attribute is missing. Refer to "023876 - Local
                identifier details for a person in an Entity Identifier element" of the
                Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="not(@codeSystem) or normalize-space(@codeSystem) = '' or (@codeSystem='2.16.840.1.113883.12.203')"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:code' tag
                'codeSystem' attribute shall contain the value '2.16.840.1.113883.12.203'. Refer to
                "023876 - Local identifier details for a person in an Entity Identifier element" of
                the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName">Error: Diagnostic Imaging Report - 5.1.1 Legal
                Authenticator and 6.1.2 Document Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING
                RADIOLOGIST - The 'ext:code' tag 'codeSystemName' attribute is missing. Refer to
                "023876 - Local identifier details for a person in an Entity Identifier element" of
                the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="not(@codeSystemName) or normalize-space(@codeSystemName) = '' or (@codeSystemName='Identifier Type (HL7)')"
                >Error: Diagnostic Imaging Report - 5.1.1 Legal Authenticator and 6.1.2 Document
                Author and 6.1.4 REQUESTER and 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:code' tag
                'codeSystemName' attribute shall contain the value 'Identifier Type (HL7)'. Refer to
                "023876 - Local identifier details for a person in an Entity Identifier element" of
                the Clinical_Documents_Common_Conformance_Profile_v1.6 and "023436 - Identifier for
                Document Author and 023553 - Identifier for reporting radiologist" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 5.1.1 Legal Authenticator or section 6.1.2 Document Author or section 6.1.4
                REQUESTER or section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>
