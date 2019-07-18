<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Status: Last Reviewed: 
         Status: Last Updated : 09/07/2013 -->

    <pattern name="p-Dispense_Record_Global_Code_Checks_custom-errors"
        id="p-Dispense_Record_Global_Code_Checks_custom-errors"
        see="#p-Dispense_Record_Global_Code_Checks_custom-errors">


         
        <rule context="/cda:ClinicalDocument[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='MEDICATION DISPENSED') 
            or (@code = '60593-1')]]">
            
            
            <assert test="cda:code[@code = '60593-1']">Error: Dispense Record - Global Code Checks -
                The 'code' tag 'code' attribute shall be 60593-1'. Refer to section "6.2 Clinical
                Document" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='MEDICATION DISPENSED')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Medication Dispensed'. Refer to section "6.2 ClincialDocument" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACISTS') 
            or (@code = '2515')]]">
           
            
            <assert test="cda:code[@code = '2515']">Error: Dispense Record - Global Code Checks -
                The 'code' tag 'code' attribute shall be '2515'. Refer to section "7.3 Dispenser" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACISTS')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Pharmacists'. Refer to section "7.3 Dispenser" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            
        </rule>
        
        
        
        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACY') 
            or (@code = 'PHARM')]]">
            
           
            <assert test="cda:code[@code = 'PHARM']">Error: Dispense Record - Global Code Checks -
                The 'code' tag 'code' attribute shall be 'PHARM'. Refer to section "7.4 Dispensing Organization" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACY')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Pharmacy'. Refer to section "7.4 Dispensing Organization" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            
        </rule>
        
       
        
        
    </pattern>
    
</schema>
