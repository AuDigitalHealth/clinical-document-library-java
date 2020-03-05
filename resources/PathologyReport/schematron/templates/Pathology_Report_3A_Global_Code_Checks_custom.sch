<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Pathology_Report Clinical Document:  3A Global Code Checks -->

    <!-- Context: ClinicalDocument -->


    <pattern name="p-Pathology_Report_3A_Global_Code_Checks_custom-errors"
        id="p-Pathology_Report_3A_Global_Code_Checks_custom-errors"
        see="#p-Pathology_Report_3A_Global_Code_Checks_custom-errors">
         
        <!-- 6.1.1 :: Date of Birth is Calculated From Age -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Date of Birth is Calculated From Age']">

             <assert test="@code = '103.16233'"
                 >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age - The 'code' tag 'code'
                attribute shall contain the value '103.16233'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
  
        </rule>
        
                
        <!-- 6.1.1 :: DATE OF BIRTH ACCURACY INDICATOR -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Date of Birth Accuracy Indicator']">
          
             <assert test="@code = '102.16234'"
                 >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator - The 'code' tag 'code'
                attribute shall contain the value '102.16234'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
   
        </rule>
          
          
        <!-- 6.1.1 :: AGE -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Age']">

             <assert test="@code = '103.20109'"
                 >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age - The 'code' tag 'code'
                attribute shall contain the value '103.20109'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
    
        </rule>
        
                             
        <!-- 6.1.1:: Age Accuracy Indicator -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Age Accuracy Indicator']">
   
             <assert test="@code = '103.16279'"
                 >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator - The 'code' tag 'code'
                attribute shall contain the value '103.16279'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
     
        </rule>
        
         
        <!-- 6.1.1 :: Birth Plurality -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Birth Plurality']">

             <assert test="@code = '103.16249'"
                 >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality - The 'code' tag 'code'
                attribute shall contain the value '103.16249'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
   
        </rule>
        
        
        <!-- 6.1.1 :: Date of Death Accuracy Indicator -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Date of Death Accuracy Indicator']">

             <assert test="@code = '102.16252'"
                 >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator - The 'code' tag 'code'
                attribute shall contain the value '102.16252'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
  
        </rule>
        
        
        <!-- 6.1.1 :: Source of Death Notification -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Source of Death Notification']">

            <assert test="@code = '103.10243'"
                >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification - The 'code' tag 'code'
                attribute shall contain the value '103.10243'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
                
        </rule>
        
        
        <!-- 6.1.1 :: Mother's Original Family Name -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName = &quot;Mother's Original Family Name&quot;]">

            <assert test="@code = '103.10245'"
                >Error: Pathology Report - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person / Demographic Data / Mother's Original Family Name - The 'code' tag 'code'
                attribute shall contain the value '103.10245'. Refer to section '6.1.1 Subject of Care' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
                
        </rule>
        
    
        <!-- 7.1.1.1 :: Department Code (Diagnostic Service) -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation/cda:code[@displayName = 'pathology service']">

            <assert test="@code = '310074003'"
                >Error: Pathology Report - PATHOLOGY TEST RESULT / Department Code (Diagnostic Service) - The 'code' tag 'code'
                attribute shall contain the value '310074003'. Refer to section '7.1.1.1 PATHOLOGY TEST RESULT' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
                
        </rule>
        
        <!-- 7.1.1.1 :: Overall Test Result Status (Overall Pathology Test Result Status) -->        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation/cda:code[@displayName = 'report status']">
            
            <assert test="@code = '308552006'"
                >Error: Pathology Report - PATHOLOGY TEST RESULT / Overall Test Result Status (Overall Pathology Test Result Status) - The 'code' tag 'code'
                attribute shall contain the value '308552006'. Refer to section '7.1.1.1 PATHOLOGY TEST RESULT' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        

        <!-- 7.1.1.1 :: Observation DateTime -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation/cda:code[@displayName = 'Pathology Test Result DateTime']">

            <assert test="@code = '103.16605'"
                >Error: Pathology Report - PATHOLOGY TEST RESULT / Observation DateTime - The 'code' tag 'code'
                attribute shall contain the value '103.16605'. Refer to section '7.1.1.1 PATHOLOGY TEST RESULT' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        
        <!-- 7.1.1.1.1 :: Test Specimen Detail (SPECIMEN) -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation/cda:code[@displayName = 'Specimen']">

            <assert test="@code = '102.16156'"
                >Error: Pathology Report - Test Specimen Detail (SPECIMEN) - The 'code' tag 'code'
                attribute shall contain the value '102.16156'. Refer to section '7.1.1.1.1 Test Specimen Detail (SPECIMEN)' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>      
        
        <!-- 7.1.1.3 :: RELATED DOCUMENT -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:entry/cda:act/cda:code[@displayName = 'Related Document']">

            <assert test="@code = '102.16971'"
                >Error: Pathology Report - RELATED DOCUMENT - The 'code' tag 'code'
                attribute shall contain the value '102.16971'. Refer to section '7.1.1.3 RELATED DOCUMENT' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        <!-- 7.1.1.3 :: Document Type -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:reference/cda:externalDocument/cda:code[@displayName = 'Pathology study']">
            
            <assert test="@code = '11526-1'"
                >Error: Pathology Report - RELATED DOCUMENT / DOCUMENT PROVENANCE / Document Type - The 'code' tag 'code'
                attribute shall contain the value '11526-1'. Refer to section '7.1.1.3 RELATED DOCUMENT' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        <!-- 7.1.1.3 :: Report Name (Document Title) -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:entryRelationship/cda:act/cda:code[@displayName = 'Document Title']">

            <assert test="@code = '103.16966'"
                >Error: Pathology Report - RELATED DOCUMENT / DOCUMENT PROVENANCE / Report Name (Document Title) - The 'code' tag 'code'
                attribute shall contain the value '103.16966'. Refer to section '7.1.1.3 Report Name (Document Title)' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        <!-- 7.1.1.3 :: Report Status(Document Status) -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20018']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:entryRelationship/cda:observation/cda:code[@displayName = 'Document Status']">

            <assert test="@code = '103.20104'"
                >Error: Pathology Report - RELATED DOCUMENT / DOCUMENT PROVENANCE / Report Status(Document Status) - The 'code' tag 'code'
                attribute shall contain the value '103.20104'. Refer to section '7.1.1.3 Report Status(Document Status)' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
    </pattern>

</schema>
