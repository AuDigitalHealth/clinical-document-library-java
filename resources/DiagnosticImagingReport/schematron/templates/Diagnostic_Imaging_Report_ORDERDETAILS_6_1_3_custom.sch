<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3_custom-errors"
        id="p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3_custom-errors"
        see="#p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:inFulfillmentOf/cda:order">

            <assert test="cda:id[starts-with(@root, '1.2.36.1.2001.1005.53.800362')]">Error:
                Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession Number
                (Order Identifier) - There SHALL be atleast one 'id' tag 'root' attribute which
                starts with OID 1.2.36.1.2001.1005.53 followed by HPI-O based Accession Number.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 2">Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS
                - ORDER DETAILS / Accession Number (Order Identifier) and ORDER DETAILS - ORDER
                DETAILS / Requester Order Identifier (Order Identifier) - The 'id' tag shall appear
                only twice. Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(count(cda:id[starts-with(@root, '1.2.36.1.2001.1005.53.')]) + count(cda:id[@root = '1.2.36.1.2001.1005.53'])) > 1"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession
                Number (Order Identifier) - The 'id' tag 'root' attribute having an OID starting
                with 1.2.36.1.2001.1005.53. or equal to 1.2.36.1.2001.1005.53 shall exist only once.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(count(cda:id[starts-with(@root, '1.2.36.1.2001.1005.52.')]) + count(cda:id[@root = '1.2.36.1.2001.1005.52'])) > 1"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester
                Order Identifier (Order Identifier) - The 'id' tag 'root' attribute having an
                OID starting with 1.2.36.1.2001.1005.52. or equal to 1.2.36.1.2001.1005.52 shall
                exist only once. Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report> 
            
        </rule>




        <rule context="/cda:ClinicalDocument/cda:inFulfillmentOf/cda:order/cda:id[starts-with(@root, '1.2.36.1.2001.1005.52.') or (@root = '1.2.36.1.2001.1005.52')]">


            <assert test="not(@root) or (starts-with(@root, '1.2.36.1.2001.1005.52.800362'))">Error:
                Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester Order
                Identifier (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.52 followed by HPI-O based Local Order Identifier. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.52.800362')) and not(string-length(@root) &gt;= 38)"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester
                Order Identifier (Order Identifier) - The 'id' tag 'root' attribute SHALL be the
                OID 1.2.36.1.2001.1005.52 followed by HPI-O based Local Order Identifier. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.52.800362')) and (string-length(@root) &gt;= 38) and contains(substring(@root, 23, 16), '.')"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester
                Order Identifier (Order Identifier) - The 'id' tag 'root' attribute SHALL be the
                OID 1.2.36.1.2001.1005.52 followed by HPI-O based Local Order Identifier. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (substring(@root, string-length(@root), 1) = '.')">Error:
                Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester Order
                Identifier (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.52 followed by HPI-O based Local Order Identifier. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.52.800362')) and (string-length(@root) &gt; 38) and substring(@root, 39, 1) != '.'"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester
                Order Identifier (Order Identifier) - The 'id' tag 'root' attribute SHALL be the
                OID 1.2.36.1.2001.1005.52 followed by HPI-O based Local Order Identifier. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (number(translate(@root, '0123456789.', '00000000000')) != 0)"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester
                Order Identifier (Order Identifier) - The 'id' tag 'root' attribute SHALL be a
                valid OID. Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.52.800362')) and not(
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
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Requester
                Order Identifier (Order Identifier) - The 'id' tag 'root' attribute SHALL be the
                OID 1.2.36.1.2001.1005.52 followed by HPI-O based Local Order Identifier which SHALL have
                a valid Luhn check digit. Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>


        </rule>





        <rule context="/cda:ClinicalDocument/cda:inFulfillmentOf/cda:order/cda:id[starts-with(@root, '1.2.36.1.2001.1005.53.') or (@root = '1.2.36.1.2001.1005.53')]">
            
            <assert test="not(@nullFlavor)">Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                ORDER DETAILS / Accession Number (Order Identifier) - The 'id' tag 'nullFlavor'
                attribute shall not be present. Refer to "025075 - Diagnostic Imaging Report
                information which must be present and not null" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 6.1.2" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@extension">Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER
                DETAILS / Accession Number (Order Identifier) - The 'id' tag 'extension'
                attribute is missing. Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@root) or (starts-with(@root, '1.2.36.1.2001.1005.53.800362'))">Error:
                Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession Number
                (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.53 followed by HPI-O based Accession Number. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.53.800362')) and not(string-length(@root) &gt;= 38)"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession
                Number (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.53 followed by HPI-O based Accession Number. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.53.800362')) and (string-length(@root) &gt;= 38) and contains(substring(@root, 23, 16), '.')"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession
                Number (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.53 followed by HPI-O based Accession Number. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (substring(@root, string-length(@root), 1) = '.')">Error:
                Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession Number
                (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.53 followed by HPI-O based Accession Number. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.53.800362')) and (string-length(@root) &gt; 38) and substring(@root, 39, 1) != '.'"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession
                Number (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.53 followed by HPI-O based Accession Number. Refer to section
                6.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (number(translate(@root, '0123456789.', '00000000000')) != 0)"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession
                Number (Order Identifier) - The 'id' tag 'root' attribute SHALL be a valid OID.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.53.800362')) and not(
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
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS - ORDER DETAILS / Accession
                Number (Order Identifier) - The 'id' tag 'root' attribute SHALL be the OID
                1.2.36.1.2001.1005.53 followed by HPI-O based Accession Number which SHALL have a
                valid Luhn check digit. Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>


        </rule>

    </pattern>

</schema>
