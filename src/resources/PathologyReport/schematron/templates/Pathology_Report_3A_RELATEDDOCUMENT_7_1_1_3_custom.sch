<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom-errors"
        id="p-Pathology_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom-errors"
        see="#p-Pathology_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom-errors">

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:entry/cda:act[cda:code/@code = '102.16971']/cda:entryRelationship/cda:observation[cda:code/@code = '103.20104']/cda:value">

            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - "RELATEDDOCUMENT / DOCUMENT
                DETAILS / Report Status (Document Status)" - The 'value' tag 'xsi:type' attribute
                shall contain the value 'CD' or 'CE'. Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:entry/cda:act[cda:code/@code = '102.16971']/cda:effectiveTime/cda:low">


            <assert test="not(@value)  or normalize-space(@value) = '' or string-length(@value) > 8"
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - "RELATED DOCUMENT / DOCUMENT
                DETAILS / Report Date (Effective Period)" The 'low' tag 'value' attribute shall
                include both a time and a date. Refer to section 5.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <!-- The following is a special requirement of the common conformance profile and also is partly given in the IG -->
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:entry/cda:act[cda:code/@code = '102.16971']/cda:reference/cda:externalDocument[cda:code/@code = '11526-1']/cda:text/cda:reference">

            <assert
                test="not(@value) or (normalize-space(@value) = '') or (substring(@value, ((string-length(@value)) - 3), 4)='.pdf')"
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - "RELATED DOCUMENT / Test
                Result Representation (Document Target)" - The 'reference' tag 'value' attribute
                shall end with a value '.pdf'. Refer to "023473 CDA document has a PDF packaged attachment" of the eHealth_Pathology_Report_My_Health_Record_Conformance_Profile_v1.1 and section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report
                test="(@value) and not(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:text//cda:linkHtml/@href)
                "
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - "RELATED DOCUMENT / Test
                Result Representation (Document Target)" check for "linkHtml" tag - The
                '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code
                = '101.20018']/cda:text//cda:linkHtml' tag 'href' attribute shall be present. Refer
                to section 7.1.1.3 of the Pathology_Report_CDA_Implementation_Guide_v1.0. </report>

            <assert
                test="not(@value) or (@value = /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:text//cda:linkHtml/@href)
                "
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - "RELATED DOCUMENT / Test
                Result Representation (Document Target)" check for "linkHtml" tag - The 'reference'
                tag '@value' attribute value shall be same as
                '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code
                = '101.20018']/cda:text//cda:linkHtml' tag 'href' attribute value. Refer to section
                7.1.1.3 of the Pathology_Report_CDA_Implementation_Guide_v1.0. </assert>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:entry/cda:act[cda:code/@code = '102.16971']/cda:reference/cda:externalDocument[cda:code/@code = '11526-1']/cda:id[starts-with(@root, '1.2.36.1.2001.1005.54')]">

            <assert test="not(@root) or (starts-with(@root, '1.2.36.1.2001.1005.54.800362'))">Error:
                Pathology Report - 7.1.1.3 RELATED DOCUMENT - RELATEDDOCUMENT / DOCUMENT DETAILS /
                Report Identifier (Document Identifier) - There SHALL be one 'id' tag 'root'
                attribute if it starts with OID 1.2.36.1.2001.1005.54 followed by HPI-O based Report
                Identifier. Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@extension">Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT -
                RELATEDDOCUMENT / DOCUMENT DETAILS / Report Identifier (Document Identifier) - The
                'id' tag 'extension' attribute is missing for the presence of HPI-O based Report
                Identifier. Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>


            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.54.800362')) and not(string-length(@root) &gt;= 38)"
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - RELATEDDOCUMENT / DOCUMENT
                DETAILS / Report Identifier (Document Identifier) - The 'id' tag 'root' attribute
                SHALL be the OID 1.2.36.1.2001.1005.54 followed by HPI-O based Report Identifier.
                Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.54.800362')) and (string-length(@root) &gt;= 38) and contains(substring(@root, 23, 16), '.')"
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - RELATEDDOCUMENT / DOCUMENT
                DETAILS / Report Identifier (Document Identifier) - The 'id' tag 'root' attribute
                SHALL be the OID 1.2.36.1.2001.1005.54 followed by HPI-O based Report Identifier.
                Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (substring(@root, string-length(@root), 1) = '.')">Error:
                Pathology Report - 7.1.1.3 RELATED DOCUMENT - RELATEDDOCUMENT / DOCUMENT DETAILS /
                Report Identifier (Document Identifier) - The 'id' tag 'root' attribute SHALL be the
                OID 1.2.36.1.2001.1005.54 followed by HPI-O based Report Identifier. Refer to
                section 7.1.1.3 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.54.800362')) and (string-length(@root) &gt; 38) and substring(@root, 39, 1) != '.'"
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - RELATEDDOCUMENT / DOCUMENT
                DETAILS / Report Identifier (Document Identifier) - The 'id' tag 'root' attribute
                SHALL be the OID 1.2.36.1.2001.1005.54 followed by HPI-O based Report Identifier.
                Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(@root) and (number(translate(@root, '0123456789.', '00000000000')) != 0)"
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - RELATEDDOCUMENT / DOCUMENT
                DETAILS / Report Identifier (Document Identifier) - The 'id' tag 'root' attribute
                SHALL be a valid OID. Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(@root) and (starts-with(@root, '1.2.36.1.2001.1005.54.800362')) and not(
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
                >Error: Pathology Report - 7.1.1.3 RELATED DOCUMENT - RELATEDDOCUMENT / DOCUMENT
                DETAILS / Report Identifier (Document Identifier) - The 'id' tag 'root' attribute
                SHALL be the OID 1.2.36.1.2001.1005.54 followed by HPI-O based Report Identifier
                which SHALL have a valid Luhn check digit. Refer to section 7.1.1.3 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>


        </rule>



    </pattern>

</schema>
