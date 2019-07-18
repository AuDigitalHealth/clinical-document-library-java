<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns = "http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>
    
    <!-- Dispense Record Clinical Document: 3B AMT Attributes -->
    
    <!-- Context: ClinicalDocument -->
    
    <!-- Status: Last Reviewed: 
        Status: Last Updated : 09/07/2013 -->
    
    
    <!-- 
        
        Rules:
        Tag (Mandatory): code      
        Mandatory attributes:   @code, @codeSystem, @displayName
        Mandatory tag:          originalText
        
        Tag (Optional):  translation
        Mandatory attributes:   @code, @codeSystem, @displayName    
        
        
    -->
    
    
    <pattern name  =  "p-Dispense_Record_3B_SNOMED_AMT_Attributes-errors"
        id  =  "p-Dispense_Record_3B_SNOMED_AMT_Attributes-errors"
        see = "#p-Dispense_Record_3B_SNOMED_AMT_Attributes-errors"> 
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code">          
            
            
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: Dispense Record - AMT attributes - The 'originalText' tag shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'code' attribute is missing.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'code' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'codeSystem' attribute is missing.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'codeSystem' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>            
            
            
            <!-- @codeSystemVersion - 0..1 -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            
            <!-- @codeSystemName - 0..1 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'codeSystemName' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'displayName' attribute is missing.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: Dispense Record - AMT attributes - The 'code' tag 'displayName' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
        </rule>
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation">        
            
            <!--cda:originalText - 0..1 - if cda:translation is not present -->                                
            <!-- cda:originalText - 1..1 - if cda:translation is     present  - covered in above rule context -->            
            
            
            <assert test="../cda:originalText"
                >Error: Dispense Record - AMT attributes - The 'originalText' tag is missing.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'code' attribute is missing.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'code' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'codeSystem' attribute is missing.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'codeSystem' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            
            <!-- @codeSystemVersion - 0..1 -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'codeSystemNameVersion' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>      
            
            <!-- @codeSystemName - 0..1 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'codeSystemName' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'displayName' attribute is missing.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: Dispense Record - AMT attributes - The 'translation' tag 'displayName' attribute shall contain a value.
                Refer to sections AMT: 8.2 Dispense Item of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>  
        
    </pattern>
    
</schema>