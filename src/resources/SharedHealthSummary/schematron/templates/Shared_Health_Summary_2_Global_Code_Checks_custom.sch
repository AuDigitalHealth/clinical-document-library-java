<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Shared Health Summary Clinical Document:  Global Code Checks -->

    <!-- Context: ClinicalDocument -->

    <!-- Status: Last Reviewed: 29/04/2013  
         Status: Last Updated : 29/04/2013 -->


    <pattern name="p-Shared_Health_Summary_2_Global_Code_Checks_custom-errors"
        id="p-Shared_Health_Summary_2_Global_Code_Checks_custom-errors"
        see="#p-Shared_Health_Summary_2_Global_Code_Checks_custom-errors">

        <!-- CDA:CODE content -->
        <!-- The following tests check the for a) the presence of the cda:code tag, and b) the valid value inside the tag. -->

        <!--Added [not (cda:entry/cda:observationMedia)] so that the Reference Platform team can add the below additional xml
            <component>
            <section>
            <entry>
            <observationMedia ID="logo" classCode="OBS" moodCode="EVN">
            <id root="663449f5-1642-44a8-9455-614c77412bf7" />
            <value mediaType="image/png">
            <reference value="logo.png" />
            </value>
            </observationMedia>
            </entry>
            </section>
            </component>
            </structuredBody>
            </component>
            </ClinicalDocument>
        -->
        
<!--
102.16080                  Administrative Observations             Administrative Observations
101.20113                  Adverse Reactions                       Adverse Reactions
101.16146                  Medications                             Medications
101.16117                  Medical History                         Medical History
101.16638                  Immunisations                           Immunisations
-->
   
        <!-- 4. Administrative Observations -->
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Administrative Observations']">

            <assert test="@code = '102.16080'"
                > Error: Shared Health Summary - Global Code Checks - The 'code' tag 'code'
                attribute shall contain the value '102.16080'. Refer to section '4. Administrative Observations' of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
         
            
        </rule>
        
        
        <!-- 7.1.1 :: Adverse Reactions -->
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Adverse Reactions']">

            <assert test="@code = '101.20113'"
                > Error: Shared Health Summary - Global Code Checks - The 'code' tag 'code'
                attribute shall contain the value '101.20113'. Refer to section '7.1.1
                Adverse Reactions' of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
                  
        </rule>
        
        <!-- 7.1.2 :: Medications (MEDICATION ORDERS)-->
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Medication Orders']">

            <assert test="@code = '101.16146'"
                > Error: Shared Health Summary - Global Code Checks - The 'code' tag 'code'
                attribute shall contain the value '101.16146'. Refer to section '7.1.2 Medications (MEDICATION ORDERS)' 
                of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
                       
         </rule>
        
        
        <!-- 7.1.3 Past and Current Medical History (MEDICAL HISTORY) -->
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Medical History']">

            <assert test="@code = '101.16117'"
                > Error: Shared Health Summary - Global Code Checks - The 'code' tag 'code'
                attribute shall contain the value '101.16117'. Refer to section '7.1.3 Past and Current Medical History (MEDICAL HISTORY)' 
                of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
                     
        </rule>
        
        <!-- 7.1.4 :: Immunisations -->
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Immunisations']">

            <assert test="@code = '101.16638'"
                > Error: Shared Health Summary - Global Code Checks - The 'code' tag 'code'
                attribute shall contain the value '101.16638'. Refer to section '7.1.4 Immunisations' 
                of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
           
            
        </rule>
       
    </pattern>

</schema>
