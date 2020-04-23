<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    
    <pattern name="p-PCEHR_Dispense_Record_Global_Code_Checks_custom-errors"
        id="p-PCEHR_Dispense_Record_Global_Code_Checks_custom-errors"
        see="#p-PCEHR_Dispense_Record_Global_Code_Checks_custom-errors">
        
        
        <!--ClinicalDocument/code/@code="100.16765"
            ClinicalDocument/code/@displayName="PCEHR Dispense Record"-->
        
        
        <rule context="/cda:ClinicalDocument[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PCEHR DISPENSE RECORD') 
            or (@code = '100.16765')]]">
            
            <assert test="cda:code[@code = '100.16765']">Error: PCEHR Dispense Record - Global Code Checks -
                The 'code' tag 'code' attribute shall be '100.16765'. Refer to section 5.1
                ClincialDocument of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PCEHR DISPENSE RECORD')]"
                >Error: PCEHR Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PCEHR Dispense Record'. Refer to section 5.1 ClincialDocument of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        <!--ClinicalDocument/componentOf/encompassingEncounter/location/healthCareFacility/code/@code="PHARM"
            ClinicalDocument/componentOf/encompassingEncounter/location/healthCareFacility/code/@displayName="Pharmacy"-->
        
        
        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACY') 
            or (@code = 'PHARM')]]">
           
            <assert test="cda:code[@code = 'PHARM']">Error: PCEHR Dispense Record - Global Code Checks -
                The 'code' tag 'code' attribute shall be 'PHARM'. Refer to section 6.1.3
                Dispensing Organisation of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACY')]"
                >Error: PCEHR Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Pharmacy'. Refer to section 6.1.3 Dispensing Organisation of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
    </pattern>
</schema>
