<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    
    
    <!-- Pathology_Report Clinical Document:  1A Global Code Checks -->
    
    <!-- Context: ClinicalDocument -->
    
    <pattern name="p-Pathology_Report_Global_Code_Checks_custom-errors"
        id="p-Pathology_Report_Global_Code_Checks_custom-errors"
        see="#p-Pathology_Report_Global_Code_Checks_custom-errors">
        
        <!--  5.1 :: ClinicalDocument -->
        
        <rule context="/cda:ClinicalDocument/cda:code[@displayName ='Pathology Report']">
            
            <assert test="@code = '100.32001'"
                >Error: Pathology Report - Pathology Report / Document Type - The 'code' tag 'code' attribute shall be '100.32001'. 
                Refer to section '5.1 ClinicalDocument' of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        <!--   4 Administrative Observations and 7.1.1 Pathology -->
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[not(cda:entry/cda:observationMedia/@ID = 'LOGO')]">
            
            <assert test="cda:code[@code]">Error: Pathology Report - 4 Administrative Observations and/or 7.1.1
                Pathology / Section Type - The 'code' tag with 'code'
                attribute is missing. Refer to section 4 Administrative
                Observations and section 7.1.1 Pathology of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
    </pattern>
    
</schema>
