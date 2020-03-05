<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <!-- PCEHR_Dispense_Record Clinical Document:  COMMON Conformance Profile - Req no. 3.4.10 Local identifier for a person-->

    <!-- Status: Last Reviewed: 
         Status: Last Updated : 29/08/2013-->


    <pattern name="p-PCEHR_Dispense_Record_HPI-I_Relaxed-errors"
        id="p-PCEHR_Dispense_Record_HPI-I_Relaxed-errors"
        see="#p-PCEHR_Dispense_Record_HPI-I_Relaxed-errors">


        <!-- Author -->

        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <report
                test="count(ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) > 1"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'asEntityIdentifier' tag with
                a HPI-I shall not exist more than once. Refer to 3.4.10 Local identifier for a
                person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2 DISPENSER section of
                the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier">

            <report
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) and (ext:code/@code='EI')"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'asEntityIdentifier' tag shall
                have a National Identifier or a Local Identifier but not both. Refer to 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2
                DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert
                test="(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]) or (ext:code/@code='EI')"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'asEntityIdentifier' tag shall
                either have a National Identifier or a Local Identifier. Refer to 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2
                DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="(ext:code/@code='EI') and not(ext:id/@assigningAuthorityName)">Error:
                PCEHR Dispense Record - 6.1.2 DISPENSER - The 'asEntityIdentifier' tag having a
                Local Identifier shall have 'ext:id/@assigningAuthorityName' attribute. Refer to
                3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and
                section 6.1.2 DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(ext:code/@code='EI') and (ext:id/@assigningAuthorityName) and normalize-space(ext:id/@assigningAuthorityName) = ''"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'ext:id' tag
                '@assigningAuthorityName' attribute shall not be empty. Refer to 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2
                DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(ext:code/@code='EI') and (ext:id/@assigningAuthorityName) and normalize-space(ext:id/@assigningAuthorityName) != '' and (((ext:id/@assigningAuthorityName) = 'IHI') or ((ext:id/@assigningAuthorityName) = 'HPI-I') or ((ext:id/@assigningAuthorityName) = 'HPI-O') or ((ext:id/@assigningAuthorityName) = 'PAI-D') or ((ext:id/@assigningAuthorityName) = 'PAI-O'))"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The
                'ext:id/@assigningAuthorityName' attribute where 'asEntityIdentifier' tag is having
                a Local Identifier shall not have National Identifier values. Refer to 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2
                DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:id">

            <report test="@nullFlavor">Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'id' tag
                'nullFlavor' attribute shall not exist. Refer to section 3.4.10 Local identifier for
                a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2 DISPENSER of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1005.41')) and not(starts-with(@root, '1.2.36.1.2001.1005.41.800362'))"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'id' tag 'root' attribute
                starting with '1.2.36.1.2001.1005.41' shall be followed by the national healthcare
                identifier of the organisation that maintains the local identifier. Refer to section
                3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and
                section 6.1.2 DISPENSER of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and not(string-length(@root) = 38)"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'id' tag 'root' attribute
                starting with '1.2.36.1.2001.1005.41' shall be followed by the 16 digit national
                healthcare identifier of the organisation that maintains the local identifier. Refer
                to section 3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4
                and section 6.1.2 DISPENSER of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and (number(translate(@root, '0123456789.', '00000000000')) != 0)"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'id' tag 'root' attribute
                starting with '1.2.36.1.2001.1005.41' shall be an OID. Refer to section 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2
                DISPENSER of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and (contains(substring-after(@root, '800362'), '.'))"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'id' tag 'root' attribute
                starting with '1.2.36.1.2001.1005.41' shall be followed by the 16 digit national
                healthcare identifier of the organisation that maintains the local identifier. Refer
                to section 3.4.10 Local identifier for a person of COMMON-ConformProfileClinDoc-v1.4
                and section 6.1.2 DISPENSER of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1005.41.800362')) and not(
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
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'id' tag 'root' attribute
                starting with '1.2.36.1.2001.1005.41' shall have a valid Luhn check digit in the OID
                for Health Identifier. Refer to section 3.4.10 Local identifier for a person of
                COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2 DISPENSER of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier/ext:code[@code='EI']">

            <assert test="@codeSystem">Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'code'
                tag 'codeSystem' attribute is missing. Refer to 3.4.10 Local identifier for a person
                of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2 DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''">Error: PCEHR Dispense
                Record - 6.1.2 DISPENSER - The 'code' tag 'codeSystem' attribute shall contain a
                value. Refer to 3.4.10 Local identifier for a person of
                COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2 DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert
                test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.12.203'"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'code' tag 'codeSystem'
                attribute shall contain the '2.16.840.1.113883.12.203' value. Refer to 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2
                DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName">Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The
                'code' tag 'codeSystemName' attribute is missing. Refer to 3.4.10 Local identifier
                for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2 DISPENSER
                section of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''">Error: PCEHR
                Dispense Record - 6.1.2 DISPENSER - The 'code' tag 'codeSystemName' attribute shall
                contain a value. Refer to 3.4.10 Local identifier for a person of
                COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2 DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert
                test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'Identifier Type (HL7)'"
                >Error: PCEHR Dispense Record - 6.1.2 DISPENSER - The 'code' tag 'codeSystemName'
                attribute shall contain the 'Identifier Type (HL7)' value. Refer to 3.4.10 Local
                identifier for a person of COMMON-ConformProfileClinDoc-v1.4 and section 6.1.2
                DISPENSER section of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>
