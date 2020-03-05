<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns = "http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>
    
    <!-- e-Referral Clinical Document: 3B SNoMED/AMT Attributes -->
    
    <!-- Context: ClinicalDocument -->
    
    <!-- Status: Last Reviewed: 
        Status: Last Updated : 12/06/2012 -->
    
    
    <!-- 
        
        Rules:
        Tag (Mandatory): code      
        Mandatory attributes:   @code, @codeSystem, @displayName
        Mandatory tag:          originalText
        
        Tag (Optional):  translation
        Mandatory attributes:   @code, @codeSystem, @displayName    
        
        
        SNoMED
        7.1.2.1 PROBLEM/DIAGNOSIS
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:value
        
        7.1.2.2 PROCEDURE
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure/cda:code
        
        7.1.5.1.1 TEST SPECIMEN DETAIL
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:targetSiteCode
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:targetSiteCode/cda:qualifier/cda:value       
        
        7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:code/@code='102.16156.2.2.2']/cda:targetSiteCode
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:observation/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:code/@code='102.16156.2.2.2']/cda:targetSiteCode/cda:qualifier/cda:value      
       
        7.1.5.2 IMAGING EXAMINATION RESULT
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation/cda:targetSiteCode
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation/cda:targetSiteCode/cda:qualifier/cda:value
        
        7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:organizer/cda:component/cda:observation/cda:targetSiteCode
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:organizer/cda:component/cda:observation/cda:targetSiteCode/cda:qualifier/cda:value
       
        AMT
        7.1.3.1 MEDICATION INSTRUCTION
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code

    -->

    
    <pattern name  =  "p-e-Referral_3B_SNoMED_AMT_Attributes-errors"
               id  =  "p-e-Referral_3B_SNoMED_AMT_Attributes-errors"
               see = "#p-e-Referral_3B_SNoMED_AMT_Attributes-errors"> 
   

        

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:value[not(cda:translation)] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:procedure/cda:code[not(cda:translation)] |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:targetSiteCode[not(cda:translation)] |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:targetSiteCode/cda:qualifier/cda:value[not(cda:translation)] |       
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:code/@code='102.16156.2.2.2']/cda:targetSiteCode[not(cda:translation)]|
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:code/@code='102.16156.2.2.2']/cda:targetSiteCode/cda:qualifier/cda:value[not(cda:translation)] |     
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:targetSiteCode[not(cda:translation)]|
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:targetSiteCode/cda:qualifier/cda:value[not(cda:translation)] |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[@classCode='OBS']/cda:targetSiteCode[not(cda:translation)] |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[@classCode='OBS']/cda:targetSiteCode/cda:qualifier/cda:value[not(cda:translation)] |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[not(cda:translation)]">          

            
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'originalText' tag shall contain a value.
                Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'code' attribute is missing.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'code' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'codeSystem' attribute is missing.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'codeSystem' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <!-- Begin RPSA-1848 -->
            <assert test="not(parent::cda:manufacturedMaterial) or (@codeSystem = '1.2.36.1.2001.1004.100')"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'codeSystem' attribute should be '1.2.36.1.2001.1004.100'.
                Refer to sections AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(ancestor::cda:section[cda:code/@code = '101.16117'] or ancestor::cda:section[cda:code/@code='101.20117']) or (@codeSystem = '2.16.840.1.113883.6.96')"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'codeSystem' attribute should be '2.16.840.1.113883.6.96'.
                Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' 
                of the e-Referral_CDA_Implementation_Guide_v2.2.</assert>        
            <!-- End RPSA-1848 -->
            
            <!--Mantis ID - 3630: Made codeSystemVersion attribute optional -->
            
            <!-- @codeSystemVersion - 0..1 -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'codeSystemVersion' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <!--End update -->
            
            <!-- @codeSystemName - 0..1 -->     
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'codeSystemName' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <!-- Begin RPSA-1848 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) != '' and not( @codeSystemName = 'SNOMED CT-AU' or  @codeSystemName = 'Australian Medicines Terminology (AMT)' or @codeSystemName = 'SNOMED CT' or @codeSystemName = 'SNOMED-CT')"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU' or 'Australian Medicines Terminology (AMT)' or 'SNOMED CT' or 'SNOMED-CT'.
                Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            <!-- End RPSA-1848 -->
            
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'displayName' attribute is missing.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'code' tag 'displayName' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:observation[cda:code/@code = '282291009']/cda:value/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure/cda:code/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:targetSiteCode/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:targetSiteCode/cda:qualifier/cda:value/cda:translation |       
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:code/@code='102.16156.2.2.2']/cda:targetSiteCode/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:code/@code='102.16156.2.2.2']/cda:targetSiteCode/cda:qualifier/cda:value/cda:translation |     
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:targetSiteCode/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:targetSiteCode/cda:qualifier/cda:value/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[@classCode='OBS']/cda:targetSiteCode/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer/cda:component/cda:observation[@classCode='OBS']/cda:targetSiteCode/cda:qualifier/cda:value/cda:translation |
                       /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:translation">          
            

        
            
            
            <!-- cda:originalText - 1..1 - if cda:translation is     present -->
            <assert test="../cda:originalText"
                >Error: e-Referral - SNoMED/AMT attributes - The 'originalText' tag is missing.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            
            <!-- @code - 1..1 -->
            <assert test="@code"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'code' attribute is missing.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="normalize-space(@code) != ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'code' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <!-- @codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'codeSystem' attribute is missing.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="normalize-space(@codeSystem) != ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'codeSystem' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <!-- Begin RPSA-1848 -->
            <assert test="not(parent::cda:manufacturedMaterial) or (@codeSystem = '1.2.36.1.2001.1004.100')"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'codeSystem' attribute should be '1.2.36.1.2001.1004.100'.
                Refer to sections AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(ancestor::cda:section[cda:code/@code = '101.16117'] or ancestor::cda:section[cda:code/@code='101.20117']) or (@codeSystem = '2.16.840.1.113883.6.96')"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'codeSystem' attribute should be '2.16.840.1.113883.6.96'.
                Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' 
                of the e-Referral_CDA_Implementation_Guide_v2.2.</assert>        
            <!-- End RPSA-1848 -->
            
            <!--Mantis ID - 3630: Made codeSystemVersion attribute optional -->
            
            <!-- @codeSystemVersion - 0..1 -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'codeSystemVersion' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <!--End update -->
            
            <!-- @codeSystemName - 0..1 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'codeSystemName' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <!-- Begin RPSA-1848 -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) != '' and not( @codeSystemName = 'SNOMED CT-AU' or  @codeSystemName = 'Australian Medicines Terminology (AMT)' or @codeSystemName = 'SNOMED CT' or @codeSystemName = 'SNOMED-CT')"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU' or 'Australian Medicines Terminology (AMT)' or 'SNOMED CT' or 'SNOMED-CT'.
                Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            <!-- End RPSA-1848 -->
            
            <!-- @displayName - 1..1 -->
            <assert test="@displayName"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'displayName' attribute is missing.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="normalize-space(@displayName) != ''"
                >Error: e-Referral - SNoMED/AMT attributes - The 'translation' tag 'displayName' attribute shall contain a value.
               Refer to sections SNoMED: '7.1.2.1 PROBLEM/DIAGNOSIS' OR '7.1.2.2 PROCEDURE' OR '7.1.5.1.1 TEST SPECIMEN DETAIL' OR '7.1.5.1.2.1 RESULT GROUP SPECIMEN DETAIL' OR '7.1.5.2 IMAGING EXAMINATION RESULT' OR '7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP' OR 
                AMT: '7.1.3.1 MEDICATION INSTRUCTION' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>  
        
    </pattern>
    
</schema>