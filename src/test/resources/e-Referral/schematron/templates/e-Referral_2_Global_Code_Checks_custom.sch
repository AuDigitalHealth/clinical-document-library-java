<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <pattern name="p-e-Referral_2_Global_Code_Checks_custom-errors"
        id="p-e-Referral_2_Global_Code_Checks_custom-errors" 
        see="#p-e-Referral_2_Global_Code_Checks_custom-errors">


        <!-- Mantis ID 2499 -->
        <!-- Mantis ID 3718 -->
        
        <!-- 4 :: Administrative Observations -->
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Administrative Observations']">
            
           <assert
                test="@code = '102.16080'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '102.16080'. Refer to section '4 Administrative Observations' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
                
        </rule>
          
        <!-- 7.1.1 :: REFERRAL DETAIL -->
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName = 'Referral Detail']">
            
           <assert
                test="@code = '102.16347'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '102.16347'. Refer to section '7.1.1 REFERRAL DETAIL' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
        
        

        <!-- 7.1.2 MEDICAL HISTORY - Medical History -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName = 'Medical History']">

            <assert test="@code = '101.16117'">Error: e-Referral - Global Code Checks -
                The 'code' tag 'code' attribute shall be '101.16117'. Refer to section 7.1.2 Medical
                History of the e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>
        
        
        <!-- 7.1.3 :: MEDICATIONS -->
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName = 'Medications']">
            
           <assert
                test="@code = '101.16146'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '101.16146'. Refer to section '7.1.3 MEDICATIONS' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>
           
        <!-- 7.1.4 :: ADVERSE REACTIONS -->
           
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName = 'Adverse Reactions']">
            
           <assert
                test="@code = '101.20113'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '101.20113'. Refer to section '7.1.4 ADVERSE REACTIONS' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
           
        </rule>
        
        <!-- 7.1.5 :: DIAGNOSTIC INVESTIGATIONS -->
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Diagnostic Investigations']">
            
           <assert
                test="@code = '101.20117'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '101.20117'. Refer to section '7.1.5 DIAGNOSTIC INVESTIGATIONS' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
        
        <!-- 7.1.5.1 :: PATHOLOGY TEST RESULT -->
        
        <rule  context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section/cda:code[@displayName = 'Pathology Test Result']">

            <assert test="@code = '102.16144'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '102.16144'. Refer to section '7.1.5.1 PATHOLOGY TEST RESULT' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
           
        </rule>
        
         <!-- 7.1.5.2 :: Imaging Examination Result -->
        
        <rule  context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section/cda:code[@displayName = 'Imaging Examination Result']">

            <assert test="@code = '102.16145'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '102.16145'. Refer to section '7.1.5.2 Imaging Examination Result' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
   
        </rule>
        
        
        <!-- 7.1.5.3 :: REQUESTED SERVICE -->
        
        <rule  context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section/cda:code[@displayName = 'Requested Service']">

            <assert test="@code = '102.20158'"
                >Error: e-Referral - Global Code Checks - The 'code' tag 'code' attribute shall be
                '102.20158'. Refer to section '7.1.5.3 Requested Service' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
        
        
    </pattern>

</schema>
