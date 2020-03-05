<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                
                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.1
                  IG Guide Title     : PATHOLOGY TEST RESULT
                 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_3A_PATHOLOGYTESTRESULT_7_1_1_1_custom-errors"
        id="p-Pathology_Report_3A_PATHOLOGYTESTRESULT_7_1_1_1_custom-errors"
        see="#p-Pathology_Report_3A_PATHOLOGYTESTRESULT_7_1_1_1_custom-errors">

        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation">
            
            <assert test="@classCode"
                >Error: Pathology Report - 7.1.1.1 PATHOLOGY TEST RESULT -
                "PATHOLOGY TEST RESULT / Test Result Name (Pathology Test Result Name)" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Pathology Report - 7.1.1.1 PATHOLOGY TEST RESULT -
                "PATHOLOGY TEST RESULT / Test Result Name (Pathology Test Result Name)" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Pathology Report - 7.1.1.1 PATHOLOGY TEST RESULT -
                "PATHOLOGY TEST RESULT / Test Result Name (Pathology Test Result Name)" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            
        </rule>
        
        
        
       <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code='310074003']/cda:value">
            
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: Pathology Report - 7.1.1.1 PATHOLOGY TEST RESULT -
                "Pathology Test Result / Department Code (Diagnostic Service)" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>  
            
                      
        </rule>
        
      
      
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code='308552006']/cda:value">
            
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: Pathology Report - 7.1.1.1 PATHOLOGY TEST RESULT -
                "Pathology Test Result / Overall Test Result Status (Overall Pathology Test Result Status)" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>  
            
            
        </rule>
        
        
        <!-- In reference to the test below for "PATHOLOGY TEST RESULT / Observation DateTime" the IG states the following: 
            "This element will hold the same value as Test Specimen Detail (SPECIMEN) / HANDLING AND PROCESSING / Collection DateTime (entryRelationship[specimen]/observation/effectiveTime)" 
            But as per the issue raised and then the clarification received from the CI team through Jira reference RPSA-2015 we are considering 'will' as SHALL -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16605']/cda:effectiveTime">
            
            <assert
                test="(not(@value) 
                and 
                not(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16156']/cda:effectiveTime/@value)) 
                or 
                (@value = /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16156']/cda:effectiveTime/@value)"
                >Error: Pathology Report - 7.1.1.1 PATHOLOGY TEST RESULT - "PATHOLOGY TEST
                RESULT / Observation DateTime" - The 'effectiveTime' tag 'value' attribute value
                shall contain the same value as 'Test Specimen Detail (SPECIMEN) / HANDLING AND
                PROCESSING / Collection DateTime
                (entryRelationship[specimen]/observation/effectiveTime)'. Refer to section 7.1.1.1
                of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
       
       </rule>
        
      </pattern>

</schema>
