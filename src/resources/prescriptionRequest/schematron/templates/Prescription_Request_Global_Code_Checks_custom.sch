<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Status: Last Reviewed: 
         Status: Last Updated : 09/07/2013 -->

    <pattern name="p-Prescription_Request_Global_Code_Checks_custom-errors"
        id="p-Prescription_Request_Global_Code_Checks_custom-errors"
        see="#p-Prescription_Request_Global_Code_Checks_custom-errors">


       
        <rule context="/cda:ClinicalDocument[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION REQUEST') 
            or (@code = '100.16285')]]">
            
            

            <assert test="cda:code[@code = '100.16285']">Error: Prescription Request - Global Code Checks -
                The 'code' tag 'code' attribute shall be 100.16285'. Refer to section "6.2 Clinical
                Document" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION REQUEST')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Prescription Request'. Refer to section "6.2 ClincialDocument" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            

        </rule>
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:substanceAdministration/cda:participant[@typeCode='TRANS']/cda:participantRole
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACISTS') 
            or (@code = '2515')]]">
            
            
            <assert test="cda:code[@code = '2515']">Error: Prescription Request - Global Code Checks -
                The 'code' tag 'code' attribute shall be '2515'. Refer to section "8.3 Prescription Instruction Recipient" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACISTS')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Pharmacists'. Refer to section "8.3 Prescription Instruction Recipient" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            
        </rule>
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:encompassingEncounter/cda:location/cda:healthCareFacility
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACY') 
            or (@code = 'PHARM')]]">
            
            
            <assert test="cda:code[@code = 'PHARM']">Error: Prescription Request - Global Code Checks -
                The 'code' tag 'code' attribute shall be '2515'. Refer to section "7.4 Dispensing Organization" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PHARMACY')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Pharmacy'. Refer to section "7.4 Dispensing Organization" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            
        </rule>
        
      
    
        
        

    </pattern>
</schema>
