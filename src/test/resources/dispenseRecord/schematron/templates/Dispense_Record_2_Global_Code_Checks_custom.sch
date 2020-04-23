<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Context: ClinicalDocument/component/structuredBody -->

    <!-- Status: Last Reviewed: 
        Status: Last Updated : 04/06/2013 -->

    <pattern name="p-Dispense_Record_2_Global_Code_Checks_custom-errors"
        id="p-Dispense_Record_2_Global_Code_Checks_custom-errors"
        see="#p-Dispense_Record_2_Global_Code_Checks_custom-errors">

       
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[(translate(cda:code/@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADMINISTRATIVE OBSERVATIONS')
            or (cda:code[@code = '102.16080'])]">
            
            

            <assert test="cda:code[(@code = '102.16080')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16080'. Refer to section "5.
                Administrative Observations" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

           
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADMINISTRATIVE OBSERVATIONS')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Administrative Observations'. Refer to section "5. Administrative
                Observations'" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>           

        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[(translate(cda:code/@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DISPENSE ITEM')
            or (cda:code[@code = '102.16211'])]">
            
            <assert test="cda:code[(@code = '102.16211')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16211'. Refer to section "8.2 Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DISPENSE ITEM')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Dispense Item"'. Refer to section "8.2 Dispense Item'" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>           
            
        </rule>

       
        

    </pattern>
</schema>
