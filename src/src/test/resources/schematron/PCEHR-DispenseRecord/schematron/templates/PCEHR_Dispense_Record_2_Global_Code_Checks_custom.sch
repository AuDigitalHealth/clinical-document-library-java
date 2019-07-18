<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    
    <pattern name="p-PCEHR_Dispense_Record_2_Global_Code_Checks_custom-errors"
        id="p-PCEHR_Dispense_Record_2_Global_Code_Checks_custom-errors"
        see="#p-PCEHR_Dispense_Record_2_Global_Code_Checks_custom-errors">
        
        
        <!--ClinicalDocument/component/structuredBody/component/section/[admin_obs]/code/@code="102.16080"
            ClinicalDocument/component/structuredBody/component/section/[admin_obs]/code/@displayName="Administrative Observations"-->
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[
            (translate(cda:code/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADMINISTRATIVE OBSERVATIONS') or
            (cda:code[@code='102.16080'])]">
            
            <assert test="cda:code[(@code = '102.16080')]">Error: PCEHR Dispense Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '102.16080'. Refer to section
                4 Administrative Observations of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADMINISTRATIVE OBSERVATIONS')]"
                >Error: PCEHR Dispense Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Administrative Observations'. Refer to section 
                4 Administrative Observations of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        
        <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/code/@code="102.16210"
            ClinicalDocument/component/structuredBody/component[pres_item]/section/code/@displayName="Dispense Item"-->
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[
            (translate(cda:code/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DISPENSE ITEM') or
            (cda:code[@code='102.16210'])]">
            
            <assert test="cda:code[@code = '102.16210']">Error: PCEHR Dispense Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '102.16211'. Refer to section
                7.1.1 Dispense Item (MEDICATION ACTION) of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DISPENSE ITEM')]"
                >Error: PCEHR Dispense Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Dispense Item'. Refer to section 
                7.1.1 Dispense Item (MEDICATION ACTION) of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
    </pattern>
</schema>
