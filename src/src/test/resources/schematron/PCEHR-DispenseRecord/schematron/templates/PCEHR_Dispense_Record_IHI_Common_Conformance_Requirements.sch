<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>



    <!-- Status: Last Reviewed: 
         Status: Last Updated : 20/08/2013-->


    <pattern name="p-PCEHR_Dispense_Record_IHI_Common_Conformance_Requirements-errors"
        id="p-PCEHR_Dispense_Record_IHI_Common_Conformance_Requirements-errors"
        see="#p-PCEHR_Dispense_Record_IHI_Common_Conformance_Requirements-errors">

        <rule context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient">

            <report
                test="count(ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360')]) > 1"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The 'asEntityIdentifier' tag
                with an IHI shall not exist more than once. Refer to section 3.4.10 Local identifier
                for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.1 Subject of Care
                of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:asEntityIdentifier">

            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360')]) and (ext:code/@codeSystem='2.16.840.1.113883.12.203')"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The 'asEntityIdentifier' tag
                shall have a National Identifier or a Local Identifier but not both. Refer to
                section 3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4
                and section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360')]) or (ext:code/@codeSystem='2.16.840.1.113883.12.203')"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The 'asEntityIdentifier' tag
                shall either have a National Identifier or a Local Identifier. Refer to section
                3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and
                section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report
                test="(ext:code/@codeSystem='2.16.840.1.113883.12.203') and not(ext:id/@assigningAuthorityName)"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The 'asEntityIdentifier' tag
                having a Local Identifier shall have 'ext:id/@assigningAuthorityName' attribute.
                Refer to section 3.4.10 Local identifier for a person of
                COMMON-ConformProfileClinDoc-v1.4 and section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(ext:code/@codeSystem='2.16.840.1.113883.12.203') and (ext:id/@assigningAuthorityName) and normalize-space(ext:id/@assigningAuthorityName) = ''"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The 'ext:id' tag
                '@assigningAuthorityName' attribute shall not be empty. Refer to section 3.4.10
                Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.1
                Subject of Care of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(ext:code/@codeSystem='2.16.840.1.113883.12.203') and (ext:id/@assigningAuthorityName) and normalize-space(ext:id/@assigningAuthorityName) != '' and (((ext:id/@assigningAuthorityName) = 'IHI') or ((ext:id/@assigningAuthorityName) = 'HPI-I') or ((ext:id/@assigningAuthorityName) = 'HPI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-D') or ((ext:id/@assigningAuthorityName) = 'PAI-O'))"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The
                'ext:id/@assigningAuthorityName' attribute where 'asEntityIdentifier' tag is having
                a Local Identifier shall not have National Identifier values. Refer to section
                3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and
                section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:asEntityIdentifier/ext:code[@codeSystem='2.16.840.1.113883.12.203']">

            <assert test="@code">Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The 'code'
                tag 'code' attribute is missing. Refer to section 3.4.10 Local identifier for a
                person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@code and normalize-space(@code) = ''">Error: PCEHR Dispense Record -
                6.1.1 Subject of Care - The 'code' tag 'code' attribute shall contain a value. Refer
                to section 3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4
                and section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="@codeSystemName">Error: PCEHR Dispense Record - 6.1.1 Subject of Care -
                The 'code' tag 'codeSystemName' attribute is missing. Refer to section 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.1
                Subject of Care of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''">Error: PCEHR
                Dispense Record - 6.1.1 Subject of Care - The 'code' tag 'codeSystemName' attribute
                shall contain a value. Refer to section 3.4.10 Local identifier for a person of
                COMMON-ConformProfileClinDoc-v1.4 and section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert
                test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'Identifier Type (HL7)'"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care - The 'code' tag
                'codeSystemName' attribute shall contain the 'Identifier Type (HL7)' value. Refer to
                section 3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4
                and section 6.1.1 Subject of Care of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>
