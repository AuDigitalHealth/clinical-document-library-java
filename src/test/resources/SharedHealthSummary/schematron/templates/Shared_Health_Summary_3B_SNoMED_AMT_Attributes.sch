<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns = "http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>
    
    <!-- Shared Health Summary Clinical Document: 3B SNoMED/AMT Attributes -->
    
    <!-- Context: ClinicalDocument -->    
  
    
    <!-- 
        
        Rules:
        Tag (Mandatory): code      
        Mandatory attributes:   @code, @codeSystem, @displayName
        Mandatory tag:          originalText
        
        Tag (Optional):  translation
        Mandatory attributes:   @code, @codeSystem, @displayName    
        
        
        SNoMED
        7.1.1.2 ADVERSE REACTION
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:participant/cda:participantRole/cda:playingEntity/cda:code
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation/cda:entryRelationship/cda:observation/cda:code
        NOTE:  NEHTA Substance/Agent Values - Can be SNoMED OR AMT.
        
        7.1.3.1 PROBLEM/DIAGNOSIS      
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:value
        
        
        7.1.3.3 PROCEDURE
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure/cda:code
        
        
        AMT
        7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code
        
        7.1.4.1 Administered Immunisation (MEDICATION ACTION)
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16638']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code
        
    -->
    
    
    <pattern name  =  "p-Shared_Health_Summary_3B_SNoMED_AMT_Attributes-errors"
               id  =  "p-Shared_Health_Summary_3B_SNoMED_AMT_Attributes-errors"
               see = "#p-Shared_Health_Summary_3B_SNoMED_AMT_Attributes-errors"> 
        
        
        <!-- CDA:CODE -->
        <!-- The following rule context finds every occurrence of "cda:code" in the XML and executes the corresponding tests. -->
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry[cda:act/cda:code/@code = '102.15517']/cda:act/cda:participant/cda:participantRole/cda:playingEntity/cda:code[not(cda:translation)] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry[cda:act/cda:code/@code = '102.15517']/cda:act/cda:entryRelationship[cda:observation/cda:code/@code = '102.16474']/cda:observation/cda:entryRelationship/cda:observation/cda:code[not(cda:translation)] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:value[not(cda:translation)] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode='PROC']/cda:code[not(cda:translation)] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[not(cda:translation)] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16638']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[not(cda:translation)]">   
             
                   
    
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'originalText' tag shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
           
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'code' attribute is missing.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'code' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'codeSystem' attribute is missing.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'codeSystem' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
                      
                       
            <!-- @codeSystemVersion - 0..1 -->
              <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            <!--End update -->
            
            <!-- @codeSystemName - 0..1 -->     
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'codeSystemName' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
                      
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'displayName' attribute is missing.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'code' tag 'displayName' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
        </rule>
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry[cda:act/cda:code/@code = '102.15517']/cda:act/cda:participant/cda:participantRole/cda:playingEntity/cda:code/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry[cda:act/cda:code/@code = '102.15517']/cda:act/cda:entryRelationship[cda:observation/cda:code/@code = '102.16474']/cda:observation/cda:entryRelationship/cda:observation/cda:code/cda:translation|
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:value/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@classCode='PROC']/cda:code/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16638']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation">
                        
            
            <!-- NOTE: "count(xxxx) > 1" tests are in:  Shared_Health_Summary_Global_Checks.sch -->
            
            <!-- cda:originalText - 1..1 - if cda:translation is     present -->
            <assert test="../cda:originalText"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'originalText' tag is missing.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'code' attribute is missing.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'code' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'codeSystem' attribute is missing.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'codeSystem' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>        
                   
                                    
            <!-- @codeSystemVersion - 0..1 -->
             <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
             <!--End update -->
            
            <!-- @codeSystemName - 0..1 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'codeSystemName' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
                  
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'displayName' attribute is missing.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: Shared Health Summary - SNoMED/AMT attributes - The 'translation' tag 'displayName' attribute shall contain a value.
                Refer to sections SNoMED: '7.1.1.2 ADVERSE REACTION' or '7.1.3.1 PROBLEM/DIAGNOSIS' or 7.1.3.3 PROCEDURE OR 
                AMT: '7.1.2.2 KNOWN MEDICATION (MEDICATION INSTRUCTION)' or '7.1.4.1 Administered Immunisation (MEDICATION ACTION)' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
        </rule>  
        
    </pattern>
    
</schema>