<?xml version="1.0" encoding="UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">

    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_LOINC_Codes_Checks-errors"
        id="p-Prescription_Request_LOINC_Codes_Checks-errors"
        see="#p-Prescription_Request_LOINC_Codes_Checks-errors">

<!--         
1.	Where codeSystem attribute of a CD or CE data type equal "2.16.840.1.113883.6.1", and a codeSystemName attribute is declared, the codeSystemName shall equal "LOINC". 
2.	Where codeSystem attribute of a CD or CE data type equal "2.16.840.1.113883.6.1", then the following apply:
2.1.	The LOINC code string representation shall have the format of (“mmmmmmmm-n”). 
2.1.1.	The first 8 characters from the left, before the hyphen (“-“) is referred to the LOINC Code ID. 
2.1.2.	The last single character from the left, after the hyphen (“-“) is referred to the LOINC Code Check Digit. 
2.2.	The LOINC Code ID is made up of alphanumeric characters. The LOINC Code ID shall be made up of ASCII characters between the range 48 to 57, 65 to 90, and 95 (underscore (“_”)) e.g. (“0123456789ABCDEFGHIJKLMNOPQRSTUVYWXZ_”);
2.3.	The LOINC Code Check Digit shall be a single numeric character. 
2.3.1.	The check digit shall be between the ASCII character range of 48 to 57; i.e. (“0123456789”);
2.4.	The second last character from the left in the LOINC code shall be a hyphen (“-“) (ASCII 45);
2.5.	The LOINC Code (ID, hyphen and Check Digit) string length shall not exceed 10 characters;
2.6.	If the LOINC Code ID is numeric, with no alpha characters, then the LOINC code shall be validated using the MOD 10 check digit check. Refer to the link below and the accompanying file ‘LOINCManual - Calculating Mod 10 Check Digits.pdf’ and the sample implementation: https://wiki.openmrs.org/display/docs/Check+Digit+Algorithm
-->
        
        <rule context="*[(@codeSystem='2.16.840.1.113883.6.1')]">

            <report test="(@codeSystemName) and (@codeSystemName != 'LOINC')">Error: Prescription
                Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'codeSystemName'
                attribute value shall be 'LOINC'. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>


            <assert test="string-length(@code) &gt;= 3">Error: Prescription Request - Global
                Clinical Document check for LOINC "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code"
                attribute - The 'code' attribute value length shall be minimum 3 characters. Check
                all such 'code' attributes to find the incorrect attribute(s). Refer to section 8.1
                of the Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</assert>


            <assert test="string-length(@code) &lt;= 10">Error: Prescription Request - Global
                Clinical Document check for LOINC "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code"
                attribute - The 'code' attribute value length shall be maximum 10 characters. Check
                all such 'code' attributes to find the incorrect attribute(s). Refer to section 8.1
                of the Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</assert>


            <assert test="(substring(@code, (string-length(@code)-1), 1) = '-')">Error: Prescription
                Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                2nd last character shall be a '-' character. Check all such 'code' attributes to
                find the incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</assert>


            <assert
                test="number(substring(@code, (string-length(@code)), 1)) = floor(substring(@code, (string-length(@code)), 1))"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                last character shall be a numeric digit. Check all such 'code' attributes to find
                the incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</assert>


            <assert test="not(contains(@code, '.'))">Error: Prescription Request - Global Clinical
                Document check for LOINC "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute
                - The 'code' attribute shall not contain a '.' character. Check all such 'code'
                attributes to find the incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</assert>


            <assert
                test="number(translate((substring(@code, 1, (string-length(@code) - 2))), '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_', '0000000000000000000000000000000000000')) = 0"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                shall consist of only following characters '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_'.
                Check all such 'code' attributes to find the incorrect attribute(s). Refer to
                section 8.1 of the Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</assert>


            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 3) 
                and (
                (( (number(translate((substring(@code, 1, 1)), '0123456789', '0246813579'))) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>

            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 4) 
                and (
                ((( (number(substring(@code, 1, 1))) + (number(translate((substring(@code, 2, 1)), '0123456789', '0246813579'))) ) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>


            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 5) 
                and (
                ((( (number(translate((substring(@code, 1, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 2, 1))) + (number(translate((substring(@code, 3, 1)), '0123456789', '0246813579'))) ) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>


            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 6) 
                and (
                ((( (number(substring(@code, 1, 1))) + (number(translate((substring(@code, 2, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 3, 1))) + (number(translate((substring(@code, 4, 1)), '0123456789', '0246813579'))) ) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>


            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 7) 
                and (
                ((( (number(translate((substring(@code, 1, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 2, 1))) + (number(translate((substring(@code, 3, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 4, 1))) + (number(translate((substring(@code, 5, 1)), '0123456789', '0246813579'))) ) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>


            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 8) 
                and (
                ((( (number(substring(@code, 1, 1))) + (number(translate((substring(@code, 2, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 3, 1))) + (number(translate((substring(@code, 4, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 5, 1))) + (number(translate((substring(@code, 6, 1)), '0123456789', '0246813579'))) ) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>


            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 9) 
                and (
                ((( (number(translate((substring(@code, 1, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 2, 1))) + (number(translate((substring(@code, 3, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 4, 1))) + (number(translate((substring(@code, 5, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 6, 1))) + (number(translate((substring(@code, 7, 1)), '0123456789', '0246813579'))) ) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>


            <report
                test="(number(substring(@code, 1, (string-length(@code) - 2))) = floor(substring(@code, 1, (string-length(@code) - 2)))) 
                and (string-length(@code) = 10) 
                and (
                ((( (number(substring(@code, 1, 1))) + (number(translate((substring(@code, 2, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 3, 1))) + (number(translate((substring(@code, 4, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 5, 1))) + (number(translate((substring(@code, 6, 1)), '0123456789', '0246813579'))) + (number(substring(@code, 7, 1))) + (number(translate((substring(@code, 8, 1)), '0123456789', '0246813579'))) ) mod 10) + (substring(@code, (string-length(@code)), 1)))                
                mod 10 != 0)"
                >Error: Prescription Request - Global Clinical Document check for LOINC
                "*[(@codeSystem='2.16.840.1.113883.6.1')]/@code" attribute - The 'code' attribute
                value is not a valid 'LOINC' code. Check all such 'code' attributes to find the
                incorrect attribute(s). Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5 and
                LOINC_Concepts_Identifier_Requirements.</report>

        </rule>

    </pattern>

</schema>
