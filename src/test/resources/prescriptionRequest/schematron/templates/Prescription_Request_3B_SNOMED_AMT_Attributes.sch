<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns = "http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>
    
    <!-- Prescription Request Clinical Document: 3B AMT Attributes -->
    
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
    
    
    <pattern name  =  "p-Prescription_Request_3B_SNOMED_AMT_Attributes-errors"
        id  =  "p-Prescription_Request_3B_SNOMED_AMT_Attributes-errors"
        see = "#p-Prescription_Request_3B_SNOMED_AMT_Attributes-errors"> 
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code">          
            
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: Prescription Request - AMT attributes - The 'originalText' tag shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>
            
            
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'code' attribute is missing.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'code' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'codeSystem' attribute is missing.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'codeSystem' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>            
            
            
            <!-- @codeSystemVersion - 0..1 -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>
            
            
            <!-- @codeSystemName - 0..1 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'codeSystemName' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_vATS 4888.4-2013.</report>
            
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'displayName' attribute is missing.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: Prescription Request - AMT attributes - The 'code' tag 'displayName' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation">        
            
            <!--cda:originalText - 0..1 - if cda:translation is not present -->                                
            <!-- cda:originalText - 1..1 - if cda:translation is     present  - covered in above rule context -->            
            
            
            <assert test="../cda:originalText"
                >Error: Prescription Request - AMT attributes - The 'originalText' tag is missing.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'code' attribute is missing.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'code' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'codeSystem' attribute is missing.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'codeSystem' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            
            <!-- @codeSystemVersion - 0..1 -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'codeSystemNameVersion' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>      
            
            <!-- @codeSystemName - 0..1 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'codeSystemName' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>
            
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'displayName' attribute is missing.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: Prescription Request - AMT attributes - The 'translation' tag 'displayName' attribute shall contain a value.
                Refer to sections AMT: Prescription Request Item of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>  
        
    </pattern>
    
</schema>