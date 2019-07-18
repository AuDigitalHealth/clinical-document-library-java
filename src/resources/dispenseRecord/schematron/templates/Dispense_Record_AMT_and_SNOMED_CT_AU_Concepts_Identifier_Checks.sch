<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <pattern name="p-Dispense_Record_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks-errors"
        id="p-Dispense_Record_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks-errors"
        see="#p-Dispense_Record_AMT_and_SNOMED_CT_AU_Concepts_Identifier_Checks-errors">        

        <rule
            context="*[(@codeSystem='2.16.840.1.113883.6.96') or (@codeSystem='1.2.36.1.2001.1004.100')]">

            <!-- BEGIN AMT Australian Medicines Terminology and SNOMED CT-AU related ConceptId (Concept Identifier) @code related checks -->

            <!-- 
                - Shall Not have a leading or trailing space
                - Shall Not begin with 0
                - Shall be equal to or greater than 100001 (6 digits, 10^6 + 1)
                - Shall be less than or equal to - 999999999999999999 (18 digits, 10^18 - 1)
                - Shall be an integer
                - Shall be positive number
                - Shall have only numbers 0-9                 
                - 2nd last and 3rd last digit Shall be either 1 or 0
                - If the concept id is either xxxxxxxxxxxx10x or xxxxxxxxxxxx11x then the string length shall be minimum 11 digits.
            -->

            <report test="starts-with(@code, '0')">Error: Dispense Record - Global Clinical Document
                check for "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall not start with a '0'. Check all
                such 'code' attributes to find the incorrect attribute(s). Refer to section 8.1 of
                the Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</report>

            <assert test="string-length(@code) &gt;= 6">Error: Dispense Record - Global Clinical
                Document check for "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall have 6 or more digits. Check all
                such 'code' attributes to find the incorrect attribute(s). Refer to section 8.1 of
                the Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert test="number(@code) &gt;= 100001">Error: Dispense Record - Global Clinical
                Document check for "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall be greater than or equal to the
                number '100001'. Check all such 'code' attributes to find the incorrect
                attribute(s). Refer to section 8.1 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert test="string-length(@code) &lt;= 18">Error: Dispense Record - Global Clinical
                Document check for "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall have a maximum of 18 digits.
                Check all such 'code' attributes to find the incorrect attribute(s). Refer to
                section 8.1 of the Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert test="number(@code) &lt;= 999999999999999999">Error: Dispense Record - Global
                Clinical Document check for "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall be less than or equal to the
                number '999999999999999999'. Check all such 'code' attributes to find the incorrect
                attribute(s). Refer to section 8.1 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert test="normalize-space(@code) = @code">Error: Dispense Record - Global Clinical
                Document check for "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall not have leading or trailing
                spaces. Check all such 'code' attributes to find the incorrect attribute(s). Refer
                to section 8.1 of the Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert test="string-length(normalize-space(@code)) = string-length(@code)">Error: Dispense Record
                 - Global Clinical Document check for
                "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall not have leading or trailing
                spaces. Check all such 'code' attributes to find the incorrect attribute(s). Refer
                to section 8.1 of the Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert test="number(@code) = floor(@code)">Error: Dispense Record - Global Clinical
                Document check for "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall be a positive integer number.
                Check all such 'code' attributes to find the incorrect attribute(s). Refer to
                section 8.1 of the Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert
                test="(substring(@code, (string-length(@code)-2), 2) = '00') or (substring(@code, (string-length(@code)-2), 2) = '01') or (substring(@code, (string-length(@code)-2), 2) = '10') or (substring(@code, (string-length(@code)-2), 2) = '11')"
                >Error: Dispense Record - Global Clinical Document check for
                "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value's both 2nd last and 3rd last digit
                shall be either '0' or '1'. Check all such 'code' attributes to find the incorrect
                attribute(s). Refer to section 8.1 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <assert test="number(@code)">Error: Dispense Record - Global Clinical Document check for
                "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value shall be a number. Check all such
                'code' attributes to find the incorrect attribute(s). Refer to section 8.1 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</assert>

            <report
                test=" (substring(@code, (string-length(@code)-2), 2) = '10') and not(string-length(@code) &gt;= 11)"
                >Error: Dispense Record - Global Clinical Document check for
                "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value having 2nd last and 3rd last digits as
                '0' and '1' respectively shall have 11 or more digits. Check all such 'code'
                attributes to find the incorrect attribute(s). Refer to section 8.1 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</report>

            <report
                test=" (substring(@code, (string-length(@code)-2), 2) = '11') and not(string-length(@code) &gt;= 11)"
                >Error: Dispense Record - Global Clinical Document check for
                "*[(@codeSystem='2.16.840.1.113883.6.96') or
                (@codeSystem='1.2.36.1.2001.1004.100')]/@code" attribute - The ‘code’ attribute
                SNOMED CT-AU or AMT concept identifier value having 2nd last and 3rd last digits as
                '1' and '1' respectively shall have 11 or more digits. Check all such 'code'
                attributes to find the incorrect attribute(s). Refer to section 8.1 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4 and
                AMT_and_SNOMED_CT_AU_Concepts_Identifier_Requirements.</report>

        </rule>

    </pattern>

</schema>
