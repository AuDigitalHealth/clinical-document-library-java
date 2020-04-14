<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom-errors"
        id="p-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom-errors"
        see="#p-Diagnostic_Imaging_Report_3A_RELATEDDOCUMENT_7_1_1_3_custom-errors">



        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:entryRelationship/cda:observation[cda:code/@code='103.20104']/cda:value">
            
            <assert test="not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: Diagnostic Imaging Report - 7.1.1.3 RELATED DOCUMENT - "RELATEDDOCUMENT /
                DOCUMENT DETAILS / Report Status (Document Status)" - The 'value' tag 'xsi:type'
                attribute shall contain the value 'CD' or 'CE'. Refer to section 7.1.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        
        
        <!-- The following is a special requirement of the common conformance profile and also is partly given in the IG -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:reference/cda:externalDocument[cda:code/@code = '18748-4']/cda:text/cda:reference">
            
            <assert
                test="not(@value) or (normalize-space(@value) = '') or (substring(@value, ((string-length(@value)) - 3), 4)='.pdf')"
                >Error: Diagnostic Imaging Report - 7.1.1.3 RELATED DOCUMENT - "RELATED DOCUMENT /
                Examination Result Representation (Document Target)" - The 'reference' tag 'value'
                attribute shall end with a value '.pdf'. Refer to "023473 - CDA document has a PDF
                packaged attachment" of the
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 and
                "section 7.1.1.3" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>                
            
            <report
                test="(@value) and not(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:text//cda:linkHtml/@href)
                ">Error: Diagnostic Imaging Report - 7.1.1.3 RELATED DOCUMENT - "RELATED DOCUMENT / Examination
                Result Representation (Document Target)" check for "linkHtml" tag - The
                '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code
                = '101.16945']/cda:text//cda:linkHtml' tag 'href' attribute shall be present. Refer
                to section 7.1.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            <assert
                test="not(@value) or (@value = /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:text//cda:linkHtml/@href)
                ">Error: Diagnostic Imaging Report - 7.1.1.3 RELATED DOCUMENT - "RELATED DOCUMENT / Examination
                Result Representation (Document Target)" check for "linkHtml" tag - The 'reference'
                tag '@value' attribute value shall be same as
                '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code
                = '101.16945']/cda:text//cda:linkHtml' tag 'href' attribute value. Refer to section
                7.1.1.3 of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>



    </pattern>

</schema>
